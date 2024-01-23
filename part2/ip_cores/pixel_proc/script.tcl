# Script to build given IP core in Vivado HLS
#
# Author: Lukas Kekely <ikekely@fit.vutbr.cz>
# Date: 1.10.2021

set ipcore_name "pixel_proc"

open_project ${ipcore_name}
set_top ${ipcore_name}
add_files ${ipcore_name}/${ipcore_name}.h
add_files ${ipcore_name}/${ipcore_name}.cpp
add_files -tb ${ipcore_name}/${ipcore_name}_test.cpp
open_solution "solution1"
set_part {xc7z020clg400-1} -tool vivado
create_clock -period 7 -name default
config_compile -name_max_length 40
config_schedule -effort medium -enable_dsp_full_reg -relax_ii_for_timing=0 -verbose
config_rtl -reset all
csynth_design
export_design -format ip_catalog -description "Pixel processing for 24-bit AXI video stream" -display_name "Pixel Processing"
exit
