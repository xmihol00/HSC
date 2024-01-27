// Pixel processing HLS implementation for AXI video stream
//
// Author: Lukas Kekely <ikekely@fit.vutbr.cz>
// Date: 1.10.2021

#include "pixel_proc.h"

const ap_fixed<29,10> MATRIX_BGR2YCrCb[][3] = {
    {0.114, -0.081312,  0.5}, 
    {0.587, -0.418688, -0.331264},
    {0.299,  0.5,      -0.168736},
};

const ap_fixed<29,10> MATRIX_YCrCb2BGR[][3] = {
    {1,      1,        1}, 
    {0,     -0.714136, 1.402},
    {1.772, -0.344136, 0},
};

// Context information for block of frames
class Context {

    word_type sum_before;
    word_type sum_after;
    word_type values;
    ap_uint<22> histogram[256];
    word_type _empty_data[256]; // TODO: use this data for something?
    flag_type _empty_data_ready;
    enum {Start, Read, Wait, Write} state;
    
public:

    Context() {
        sum_before = sum_after = 0;
        values = 0;
        _empty_data_ready = 0;
        state = Start;
    }

    // Active processing of image data by the context
    void active(color_type& new_val, color_type val) {
        state = Start; // reset to starting state of update procedure
        histogram[val]++;
        values += 1;
        sum_before += val;
        if(_empty_data_ready) {
            // TODO: use data from shared memory?
        	new_val = _empty_data[val]; // TODO: edit value somehow?
        } else {
        	new_val = val;
        }
        sum_after += new_val;
    }

    // Background update procedure of context's internal data (FSM)
    void update(flag_type start, word_type& sb, word_type& sa, word_type& v, word_type sm[256], flag_type &rd, flag_type wr) {
        static color_type address_counter;
        switch(state) {
            // waiting for the first pixel of frame block (indicated by start flag)
            case Start:
                if(start) {
                    state = Read;
                    address_counter = 0; // reset values for the following Read state
                    rd = 0;
                    _empty_data_ready = 0;
                }
                break;
            // reading of histogram values and copying them into shared memory
            case Read:
                sb = sum_before; // make debug sums accessible
                sa = sum_after;
                v = values;
                sm[address_counter] = histogram[address_counter]; // copy histogram into shared memory (value-by-value)
                histogram[address_counter] = 0; // clear histogram data
                if(address_counter == 255) { // last histogram value copied into shared memory
                    state = Wait; // now we need to wait for data from PS
                    sum_before = 0; // clear debug sums
                    sum_after = 0;
                    values = 0;
                    rd = 1; // confirm shared memory data ready for PS
                }
                address_counter++; // address increment
                break;
            // waiting for data confirmation from PS
            case Wait:
                if(wr) {
                    state = Write;
                    address_counter = 0; // reset values for the following Write state
                    rd = 0;
                }
                break;
            // write data from shared memory into local array
            case Write:
                _empty_data[address_counter] = sm[address_counter];
                if(address_counter == 255) { // last value copied from shared memory
                    state = Start;
                    _empty_data_ready = 1; // confirm correct copy of all data
                }
                address_counter++;
                break;
        }
    }
};



// Function to compute (update) various counters
void counters(word_type& f, word_type& r, word_type& p, flag_type sof, flag_type eol) {
    static word_type frame_counter = -1; // initialization to -1 because already the first pixel of a frame is designated with SoF
    static word_type row_counter = 0;
    static word_type pixel_counter = 0;
    // Update local counter values
    if(sof) // new frame is starting
        frame_counter++;
    if(eol) // current row is ending
        row_counter++;
    pixel_counter++;
    // Make new values accessible
    f = frame_counter;
    r = row_counter;
    p = pixel_counter;
}



// /////////////////////////////////////////////////////////////////////////////
// Main IP core functionality
// /////////////////////////////////////////////////////////////////////////////
void pixel_proc(
    video_axis* video_in,  // input AXI-Stream with pixels
    video_axis* video_out, // output AXI-Stream with pixels
    word_type& frames, word_type& rows, word_type& pixels, // various counters
    word_type& sum_before, word_type& sum_after, word_type& values, // debug sums
    flag_type& read_done, flag_type& write_ready, // flags to control shared memory access
    word_type shared_memory[256]                  // shared memory itself
) {

// HLS pragmas to ensure correct IP core functionality
#pragma HLS CLOCK domain=default               // IP core uses two clocks: default (logic) and control (AXI-Lite)
#pragma HLS INTERFACE ap_ctrl_none port=return // handshake on main function return is disabled
#pragma HLS INLINE REGION RECURSIVE            // all function calls are inlined (disable handshake on function calls)

// HLS pragmas to ensure correct interface inference
#pragma HLS INTERFACE axis depth=1280 port=video_in  // input AXI-Stream data interface
#pragma HLS INTERFACE axis depth=1280 port=video_out // output AXI-Stream data interface
// All registers and shared memory are bundled into a single AXI-Lite interface
#pragma HLS INTERFACE s_axilite register port=frames
#pragma HLS INTERFACE s_axilite register port=rows
#pragma HLS INTERFACE s_axilite register port=pixels
#pragma HLS INTERFACE s_axilite register port=sum_before
#pragma HLS INTERFACE s_axilite register port=sum_after
#pragma HLS INTERFACE s_axilite register port=values
#pragma HLS INTERFACE s_axilite register port=read_done
#pragma HLS INTERFACE s_axilite register port=write_ready
#pragma HLS INTERFACE s_axilite port=shared_memory


    bool last = false; // loop to process video row-by-row (required only for simulation purposes)
    while(!last) {
#pragma HLS loop_tripcount min=1280 max=1280 avg=1280 // inform the HLS tool for better statistics
#pragma HLS pipeline II=2 rewind // target II is 2, sufficient for HD video but not for Full HD

        // read one pixel and decode its color channels and flags
        color_type B, G, R;
        flag_type sof, eol;
        B = video_in->data.byte0; // decoding
        G = video_in->data.byte1;
        R = video_in->data.byte2;
        sof = video_in->user;
        eol = video_in->last;
        ++video_in;               // axis read confirm

        // update counters
        word_type local_frames; // value of frame counter will be needed locally
        counters(local_frames, rows, pixels, sof, eol);
        frames = local_frames;
        
        // TODO: pixel data processing before context?
        ap_fixed<29,10> Y = MATRIX_BGR2YCrCb[0][0]*B + MATRIX_BGR2YCrCb[1][0]*G + MATRIX_BGR2YCrCb[2][0]*R;
        ap_fixed<29,10> Cr = MATRIX_BGR2YCrCb[0][1]*B + MATRIX_BGR2YCrCb[1][1]*G + MATRIX_BGR2YCrCb[2][1]*R;
        ap_fixed<29,10> Cb = MATRIX_BGR2YCrCb[0][2]*B + MATRIX_BGR2YCrCb[1][2]*G + MATRIX_BGR2YCrCb[2][2]*R;
        
        // processing of frame blocks in two contexts
        static Context copy1, copy2;
        color_type newY;
        flag_type copy_select;
        flag_type start;
        copy_select = local_frames.range(2, 2);        // 2nd bit of frame counter flips every 4 frames
        start = sof && (local_frames.range(1,0) == 0); // block of frames start is indicated by SoF in the first frame of the block
        if(copy_select) { // based on select bit, one copy is active and the other is updating
            copy1.active(newY, (ap_fixed<8,8,AP_RND_CONV>)Y); // TODO: maybe use something else than B here?
            copy2.update(start, sum_before, sum_after, values, shared_memory, read_done, write_ready);
        } else {
            copy2.active(newY, (ap_fixed<8,8,AP_RND_CONV>)Y); // TODO: maybe use something else than B here?
            copy1.update(start, sum_before, sum_after, values, shared_memory, read_done, write_ready);
        }

        // TODO: pixel data processing after context?
        ap_fixed<29,10> B_fixed = (MATRIX_YCrCb2BGR[0][0]*newY + MATRIX_YCrCb2BGR[1][0]*Cr + MATRIX_YCrCb2BGR[2][0]*Cb);
        if (B_fixed > 255) B_fixed = 255;
        if (B_fixed < 0) B_fixed = 0;
        ap_fixed<29,10> G_fixed = (MATRIX_YCrCb2BGR[0][1]*newY + MATRIX_YCrCb2BGR[1][1]*Cr + MATRIX_YCrCb2BGR[2][1]*Cb);
        if (G_fixed > 255) G_fixed = 255;
        if (G_fixed < 0) G_fixed = 0;
        ap_fixed<29,10> R_fixed = (MATRIX_YCrCb2BGR[0][2]*newY + MATRIX_YCrCb2BGR[1][2]*Cr + MATRIX_YCrCb2BGR[2][2]*Cb);
        if (R_fixed > 255) R_fixed = 255;
        if (R_fixed < 0) R_fixed = 0;

        // pixel color channel encoding
        video_out->data.byte0 = (ap_fixed<8,8,AP_RND_CONV>)B_fixed; // encoding
        video_out->data.byte1 = (ap_fixed<8,8,AP_RND_CONV>)G_fixed;
        video_out->data.byte2 = (ap_fixed<8,8,AP_RND_CONV>)R_fixed;
        video_out->user = sof;
        video_out->last = eol;
        ++video_out;               // confirm axis write
        
        last = eol; // just for simulation loop

    }

}

