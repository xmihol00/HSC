############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project pixel_proc
set_top pixel_proc
add_files pixel_proc/pixel_proc.cpp
add_files pixel_proc/pixel_proc.h
add_files -tb pixel_proc/pixel_proc_test.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1"
set_part {xc7z020-clg400-1}
create_clock -period 7 -name default
config_compile -name_max_length 40
config_schedule -effort medium -enable_dsp_full_reg -relax_ii_for_timing=0 -verbose
config_rtl -reset all
#source "./pixel_proc/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
