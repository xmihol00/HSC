#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /mnt/sdc3/david/projs/hardware-software/part2/ip_cores/pixel_proc/solution1/.autopilot/db/a.g.bc ${1+"$@"}
