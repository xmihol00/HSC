# Script to simulate given IP core in Vivado HLS
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
create_clock -period 7 -name default
csim_design
exit
