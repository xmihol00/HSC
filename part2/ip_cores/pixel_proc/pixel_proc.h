// Pixel processing common definitions needed in testbench
//
// Author: Lukas Kekely <ikekely@fit.vutbr.cz>
// Date: 1.10.2021

#ifndef PIXEL_PROC_H
#define PIXEL_PROC_H

#include <ap_fixed.h>
#include <ap_int.h>
#include <hls_math.h>
#include <iostream>
#include <iomanip>



// /////////////////////////////////////////////////////////////////////////////
// Basic type definitions
// /////////////////////////////////////////////////////////////////////////////

typedef ap_uint<32> word_type; // 32-bit data word for configuration AXI-Lite
typedef ap_uint<8> color_type; // 8-bit unsigned color channel
typedef ap_uint<1> flag_type;  // 1-bit true (1) or false (0) flags 

// AXI-Stream video interface word definition
struct video_axis { 
    struct {
        color_type byte0; // blue channel
        color_type byte1; // green channel
        color_type byte2; // red channel
    } data;
    flag_type user; // Start of Frame: flag the first pixel in each frame
    flag_type last; // End of Line: flag the last pixel in each frame row
    // Valid and Ready signals are implicit, other axis signals are ignored
};



// /////////////////////////////////////////////////////////////////////////////
// Simulation specific functions, add non-accelerated processing here
// /////////////////////////////////////////////////////////////////////////////

// This function is called on every row of every frame before it is sent to the accelerator
// Insert parts of the video data processing here (if any)
static void simulation_pixel_preprocess(video_axis row[1280], int frame_id, int row_id) {
}

// This function is called after every row of pixels processed by the accelerator
// Edit the communication template with your specific PS based control of PL accelerator here
static void simulation_PSPL_communication(
    word_type& frames, word_type& rows, word_type& pixels,
    word_type& sum_before, word_type& sum_after, word_type& values,
    flag_type& read_done, flag_type& write_ready,
    word_type shared_memory[256]
) {
    static unsigned last_frames = 4; // start on frame 4
    if(write_ready) { // if write operation is ongoing, finish it
        write_ready = 0;
        if(frames >= last_frames) // synchronization check = write ended too late for a given block of frames (should never occur in simulation)
            std::cout << "Frame: " << last_frames << " \tWARNING missed partialy, HW thread processing too slow!" << std::endl; 
        return;
    }
    unsigned new_frames = frames;
    if(new_frames < last_frames) // still in the same old block of frames
        return;
    while(last_frames+4 <= new_frames) { // synchronization check = missed blocks of frames (should never occur in simulation)
        std::cout << "Frame: " << last_frames << " \t WARNING: missed completely, HW thread processing too slow!" << std::endl;
        last_frames += 4;
    }
    if(!read_done) // wait for read ready confirmation from PL
        return;
    unsigned sb = sum_before;
    unsigned sa = sum_after;
    unsigned v = values;
    if(!v) // histogram empty
        return;
    
    // /////////////////////////////////////////////////////////////////////////
    // Accelerator specific communication called once per every block of frames
    // /////////////////////////////////////////////////////////////////////////
    word_type histogram[256], sum_histogram = 0;
    for(int i=0; i<256; i++) {// array read of shared memory
        histogram[i] = shared_memory[i];
        sum_histogram += histogram[i]; 
    }
    assert(v == 1280*720*4 && "Wrong pixel count for block of frames!");
    assert(v == sum_histogram && "Wrong pixel count in histogram!");
    // TODO: process shared memory data somehow?
    for(int i=0; i<256; i++) // array write of shared memory
        shared_memory[i] = i; // TODO: actually calculate data to write somehow?
    write_ready = 1;
    // /////////////////////////////////////////////////////////////////////////
    
    std::cout << std::fixed << std::setprecision(3);
    std::cout << // TODO: finish the print message!
        "Frame: " << last_frames <<
        " \tMeans: " << (double)sb/(double)v << " " << (double)sa/(double)v << 
        " \tCumSum: " << -1.0 << " \tPu: " << -1.0 << std::endl;
    last_frames += 4;
}



// /////////////////////////////////////////////////////////////////////////////
// Main IP core function declaration
// /////////////////////////////////////////////////////////////////////////////
void pixel_proc(
    video_axis* video_in,  // input AXI-Stream with pixels
    video_axis* video_out, // output AXI-Stream with pixels
    word_type& frames, word_type& rows, word_type& pixels, // various counters
    word_type& sum_before, word_type& sum_after, word_type& values, // debug sums
    flag_type& read_done, flag_type& write_ready, // flags to control shared memory access
    word_type shared_memory[256]                  // shared memory itself
);

#endif
