# HDMI video input and output overlay class for Pynq-Z2
#
# Author: Lukas Kekely <ikekely@fit.vutbr.cz>
# Date: 1.10.2021

import pynq
import pynq.lib
import pynq.lib.video



# ##############################################################################
# Prixel processing accelerator driver class
# ##############################################################################
class PixelProc(pynq.DefaultIP):
    """Driver for HSC specific pixel processing engine

    The pixel processing implements specific video processing for HSC project.
    It includes: 
        * counters of frames, rows and pixels
        * check sums of pixel intensity values
        * shared memory for writing and reading of data like histogram or transformation table

    """

    def __init__(self, description):
        super().__init__(description)

    bindto = ['xilinx.com:hls:pixel_proc:1.0'] # component name for automatic binding
    
    # Address space map (from /video/hdmi_out/pixel_proc component description in .hwh file)
    ADDRESS_SPACE_FRAMES = 0x10
    ADDRESS_SPACE_ROWS   = 0x18
    ADDRESS_SPACE_PIXELS = 0x20
    ADDRESS_SPACE_SUM_BEFORE = 0x28
    ADDRESS_SPACE_SUM_AFTER  = 0x30
    ADDRESS_SPACE_VALUES     = 0x38
    ADDRESS_SPACE_READ_DONE   = 0x40
    ADDRESS_SPACE_WRITE_READY = 0x48
    ADDRESS_SPACE_SM_INDEX_START = 256 # shared memory is accessed by index not address (index = address/8)
    ADDRESS_SPACE_SM_INDEX_END   = 512
    
    # Read functions for counters
    def read_counter_frames(self):
        return self.read(PixelProc.ADDRESS_SPACE_FRAMES)
    def read_counter_rows(self):
        return self.read(PixelProc.ADDRESS_SPACE_ROWS)
    def read_counter_pixels(self):
        return self.read(PixelProc.ADDRESS_SPACE_PIXELS)
    
    # Read functions for check sums
    def read_sum_before(self):
        return self.read(PixelProc.ADDRESS_SPACE_SUM_BEFORE)
    def read_sum_after(self):
        return self.read(PixelProc.ADDRESS_SPACE_SUM_AFTER)
    def read_values(self):
        return self.read(PixelProc.ADDRESS_SPACE_VALUES)
    
    # Shared memory fast read and write including flag access
    def read_read_done(self):
        return self.read(PixelProc.ADDRESS_SPACE_READ_DONE)
    def read_write_ready(self):
        return self.read(PixelProc.ADDRESS_SPACE_WRITE_READY)
    def write_write_ready_enable(self):
        return self.write(PixelProc.ADDRESS_SPACE_WRITE_READY, 1)
    def write_write_ready_disable(self):
        return self.write(PixelProc.ADDRESS_SPACE_WRITE_READY, 0)
    def read_shared_memory(self): # hack for faster read of array from PL
        return self.mmio.array[PixelProc.ADDRESS_SPACE_SM_INDEX_START:PixelProc.ADDRESS_SPACE_SM_INDEX_END]
    def write_shared_memory(self, data): # hack for faster write of array into PL
        self.mmio.array[PixelProc.ADDRESS_SPACE_SM_INDEX_START:PixelProc.ADDRESS_SPACE_SM_INDEX_END] = data



# ##############################################################################
# Main HSC video overlay class
# ##############################################################################
class HSCVideoOverlay(pynq.Overlay):
    """ The video overlay for the Pynq-Z2
    
    Attributes
    ----------
    video : pynq.lib.video.HDMIWrapper
         HDMI input and output interfaces
    video.hdmi_out.pixel_proc : PixelProc
         HSC specific accelerator added into standard video pipeline
    """

    def __init__(self, bitfile, **kwargs):
        super().__init__(bitfile, **kwargs)
