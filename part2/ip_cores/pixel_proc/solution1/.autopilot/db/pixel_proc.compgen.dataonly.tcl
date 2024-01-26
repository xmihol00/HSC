# This script segment is generated automatically by AutoPilot

set axilite_register_dict [dict create]
set port_AXILiteS {
frames_V { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 16
	offset_end 23
}
rows_V { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 24
	offset_end 31
}
pixels_V { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 32
	offset_end 39
}
sum_before_V { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 40
	offset_end 47
}
sum_after_V { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 48
	offset_end 55
}
values_V { 
	dir O
	width 32
	depth 1
	mode ap_vld
	offset 56
	offset_end 63
}
read_done_V { 
	dir O
	width 1
	depth 1
	mode ap_vld
	offset 64
	offset_end 71
}
write_ready_V { 
	dir I
	width 1
	depth 1
	mode ap_none
	offset 72
	offset_end 79
}
shared_memory_V { 
	dir IO
	width 32
	depth 256
	mode ap_memory
	offset 1024
	offset_end 2047
}
}
dict set axilite_register_dict AXILiteS $port_AXILiteS


