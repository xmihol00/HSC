// Pixel processing testbench
//
// Author: Lukas Kekely <ikekely@fit.vutbr.cz>
// Date: 1.10.2021

#include "pixel_proc.h"
#include <fstream>

// Files with simulation input and output data. Path is relative to ip_cores/pixel_proc/solution1/csim/build.
#define INPUT_FILE  "../../../../../data/video.in"
#define OUTPUT_FILE "../../../../../data/video.out"



// /////////////////////////////////////////////////////////////////////////////
// Frame row of 720p HD video (1280 pixels).
// /////////////////////////////////////////////////////////////////////////////
class frame_row {
    
    video_axis pixel[1280]; // Pixels data as AXI-Stream words.
    
public:
    frame_row() {}
    
    // Read frame row from a binary file with simulation data.
    int read(int id, std::ifstream& file) {
        unsigned char buffer[1280*3];
        if(!file.read((char*)buffer, 1280*3))
            return 0;
        for(int i=0, j=0; i<1280; i++, j+=3) {
            pixel[i].data.byte0 = buffer[j];
            pixel[i].data.byte1 = buffer[j+1];
            pixel[i].data.byte2 = buffer[j+2];
            pixel[i].user = 0;
            pixel[i].last = 0;
        }
        if(id == 0) // first pixel of first row has SoF flag
            pixel[0].user = 1;
        pixel[1279].last = 1; // last pixel of each row has EoL flag
        return 1;
    }
    
    // Access to pixel data.
    video_axis *get_pixels() {
        return pixel;
    }
    
    // Compare two frame rows for equality and return the index with unequal pixel (or 1280 if rows are equal).
    int equal(frame_row const& other) const {
        int i;
        for(i=0; i<1280; i++) {
            if(
                pixel[i].data.byte0 != other.pixel[i].data.byte0 ||
                pixel[i].data.byte1 != other.pixel[i].data.byte1 ||
                pixel[i].data.byte2 != other.pixel[i].data.byte2 ||
                pixel[i].user != other.pixel[i].user ||
                pixel[i].last != other.pixel[i].last
            ) {
                break;
            }
        }
        return i;
    }
    
    // Print pixel at given index to standard output.
    void print_pixel(int i) {
        std::cout << "pixel(" << 
            "B=" << pixel[i].data.byte0 << ", " << 
            "G=" << pixel[i].data.byte1 << ", " << 
            "R=" << pixel[i].data.byte2 << ", " << 
            "sof=" << pixel[i].user << ", " << 
            "last=" << pixel[i].last << ")"; 
    }
};



// /////////////////////////////////////////////////////////////////////////////
// Main simulation testbench.
// /////////////////////////////////////////////////////////////////////////////
int main() {
    // Initialization
    int frame_id = 0, row_id = 0, equal;
    word_type r1, r2, r3, s1, s2, v; // accelerator registers
    flag_type rd, wr; // accelerator flags
    word_type sm[256]; // accelerator shared memory
    frame_row in, out_proc, out_expected;
    std::ifstream in_file(INPUT_FILE, std::ifstream::binary);
    std::ifstream out_file(OUTPUT_FILE, std::ifstream::binary);
    if(!in_file || !out_file) {
        std::cout << "ERROR: Unable to open simulation data files!" << std::endl;
        std::cout << "NOTE: Expecting video.in and video.out files in data folder. Use the original script with -S to generate them." << std::endl;
        return 1;
    }

    // Simulation loop
    while(in.read(row_id, in_file)) {
        if(!out_expected.read(row_id, out_file))
            break;
        // call simulation pre-processing function
        simulation_pixel_preprocess(in.get_pixels(), frame_id, row_id);
        // call accelerator processing
        pixel_proc(in.get_pixels(), out_proc.get_pixels(), r1, r2, r3, s1, s2, v, rd, wr, sm);
        // call communication with PS
        simulation_PSPL_communication(r1, r2, r3, s1, s2, v, rd, wr, sm);
        // compare image data from accelerator with expected values
        equal = out_proc.equal(out_expected);
        if(equal < 1280) {
            std::cout << "Image data mismatch on frame " << frame_id << ", row " << row_id << ", pixel " << equal << ":\n";
            std::cout << "       expected value = "; out_expected.print_pixel(equal); std::cout << std::endl;
            std::cout << "    processing output = "; out_proc.print_pixel(equal); std::cout << std::endl;
            return 1;
        }
        row_id++;
        if(row_id >= 720) {
            row_id = 0;
            frame_id++;
        }
    }

    // Finish and cleanup
    in_file.close();
    out_file.close();
    if(frame_id < 12) {
        std::cout << "ERROR: Unable to read simulation data files or they contain less than 12 frames!" << std::endl;
        return 1;
    }
    std::cout << "Simulation ended after correct processing of " << frame_id << " frames." << std::endl;
    return 0;
}
