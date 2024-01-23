# Makefile to build and simulate IP core using Vivado HLS
#
# Author: Lukas Kekely <ikekely@fit.vutbr.cz>
# Date: 1.10.2021



all:
	cd .. && vivado_hls -f pixel_proc/script.tcl 

sim:
	cd .. && vivado_hls -f pixel_proc/sim.tcl 

clean:
	-rm -rf *.app solution1 *.log .apc .settings .cproject .project *.xml vivado*
