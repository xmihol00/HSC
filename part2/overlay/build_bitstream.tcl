# Build system based on scripts from: https://github.com/Xilinx/PYNQ/tree/master/boards/Pynq-Z2/base
#
# Author: Lukas Kekely <ikekely@fit.vutbr.cz>
# Date: 1.10.2021 



set overlay_name "hsc_video"
set design_name "hsc_video"

# open block design
open_project ./${overlay_name}/${overlay_name}.xpr
open_bd_design ./${overlay_name}/${overlay_name}.srcs/sources_1/bd/${design_name}/${design_name}.bd

# Add top wrapper and xdc files
make_wrapper -files [get_files ./${overlay_name}/${overlay_name}.srcs/sources_1/bd/${design_name}/${design_name}.bd] -top
add_files -norecurse ./${overlay_name}/${overlay_name}.srcs/sources_1/bd/${design_name}/hdl/${design_name}_wrapper.v
set_property top ${design_name}_wrapper [current_fileset]
import_files -fileset constrs_1 -norecurse ${overlay_name}.xdc
update_compile_order -fileset sources_1

# set platform properties
set_property platform.default_output_type "sd_card" [current_project]
set_property platform.design_intent.embedded "true" [current_project]
set_property platform.design_intent.server_managed "false" [current_project]
set_property platform.design_intent.external_host "false" [current_project]
set_property platform.design_intent.datacenter "false" [current_project]

# call implement
launch_runs impl_1 -to_step write_bitstream -jobs 4
wait_on_run impl_1

# move and rename bitstream to final location
file copy -force ./${overlay_name}/${overlay_name}.runs/impl_1/${design_name}_wrapper.bit ${overlay_name}.bit

# copy hwh files
file copy -force ./${overlay_name}/${overlay_name}.srcs/sources_1/bd/${design_name}/hw_handoff/${design_name}.hwh ${overlay_name}.hwh

# check timing
set fd [open ./${overlay_name}/${overlay_name}.runs/impl_1/${design_name}_wrapper_timing_summary_routed.rpt r]
set timing_met 0
while { [gets $fd line] >= 0 } {
    if [string match {All user specified timing constraints are met.} $line]  { 
        set timing_met 1
        break
    }
}
if {$timing_met == 0} {
    puts "ERROR: ${overlay_name} bitstream generation does not meet timing."
    exit 1
}
puts "Timing constraints are met."
