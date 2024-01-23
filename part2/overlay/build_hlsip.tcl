# Build system based on scripts from: https://github.com/Xilinx/PYNQ/tree/master/boards/Pynq-Z2/base
#
# Author: Lukas Kekely <ikekely@fit.vutbr.cz>
# Date: 1.10.2021 



# Rebuild HLS IP from source
set current_dir [pwd]
cd ../ip_cores/
# get list of IP from folder names
set ip {color_convert pixel_pack pixel_unpack pixel_proc}
# Check and build each IP
foreach item $ip {
   if {[catch { glob -directory ${item}/solution1/impl/ip/ *.zip} zip_file]} {
# Build IP only if a packaged IP does not exist
      puts "Building $item IP"
      exec vivado_hls -f $item/script.tcl
   } else {
# Skip IP when a packaged IP exists in ip directory
      puts "Skipping building $item"
   }
   unset zip_file
}
cd $current_dir
puts "HLS IP builds complete"
