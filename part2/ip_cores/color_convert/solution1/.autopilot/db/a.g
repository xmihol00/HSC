#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /mnt/sdc3/david/projs/hardware-software/part2/ip_cores/color_convert/solution1/.autopilot/db/a.g.bc ${1+"$@"}
