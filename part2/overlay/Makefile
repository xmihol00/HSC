# Makefile to build block design and generate PL bitstream
#
# Author: Lukas Kekely <ikekely@fit.vutbr.cz>
# Date: 1.10.2021



all: hlsip blockdesign bitstream
	@echo
	@echo "Built of HSC Video successful!"
	@echo

hlsip:
	-rm -rf ../ip_cores/pixel_proc/solution1 # always rebuild pixel processing!
	vivado -mode batch -source build_hlsip.tcl -notrace

blockdesign:
	vivado -mode batch -source build_blockdesign.tcl -notrace

bitstream:
	vivado -mode batch -source build_bitstream.tcl -notrace

clean:
	-rm -rf hsc_video *.jou *.log ../ip_cores/*.log NA .Xil  *.dmp \
	$(wildcard ../ip_cores/*/*.app) $(wildcard ../ip_cores/*/solution1) \
	$(wildcard ../ip_cores/*/.[^.]*) $(wildcard ../ip_cores/*/*.log)

cleanall: clean
	-rm -rf *.bit *.hwh ../data/*.in ../data/*.out
