set moduleName pixel_proc
set isTopModule 1
set isTaskLevelControl 1
set isCombinational 0
set isDatapathOnly 0
set isFreeRunPipelineModule 0
set isPipelined 1
set pipeline_type loop_rewind
set FunctionProtocol ap_ctrl_none
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {pixel_proc}
set C_modelType { void 0 }
set C_modelArgList {
	{ video_in_data int 24 regular {axi_s 0 volatile  { video_in Data } }  }
	{ video_in_user_V int 1 regular {axi_s 0 volatile  { video_in User } }  }
	{ video_in_last_V int 1 regular {axi_s 0 volatile  { video_in Last } }  }
	{ video_out_data int 24 regular {axi_s 1 volatile  { video_out Data } }  }
	{ video_out_user_V int 1 regular {axi_s 1 volatile  { video_out User } }  }
	{ video_out_last_V int 1 regular {axi_s 1 volatile  { video_out Last } }  }
	{ frames_V int 32 regular {axi_slave 1}  }
	{ rows_V int 32 regular {axi_slave 1}  }
	{ pixels_V int 32 regular {axi_slave 1}  }
	{ sum_before_V int 32 regular {axi_slave 1}  }
	{ sum_after_V int 32 regular {axi_slave 1}  }
	{ values_V int 32 regular {axi_slave 1}  }
	{ read_done_V int 1 regular {axi_slave 1}  }
	{ write_ready_V int 1 regular {axi_slave 0}  }
	{ shared_memory_V int 32 regular {axi_slave 2}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "video_in_data", "interface" : "axis", "bitwidth" : 24, "direction" : "READONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "video_in.data.byte0.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 1279,"step" : 1}]}]},{"low":8,"up":15,"cElement": [{"cName": "video_in.data.byte1.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 1279,"step" : 1}]}]},{"low":16,"up":23,"cElement": [{"cName": "video_in.data.byte2.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 1279,"step" : 1}]}]}]} , 
 	{ "Name" : "video_in_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "video_in.user.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 1279,"step" : 1}]}]}]} , 
 	{ "Name" : "video_in_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "video_in.last.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 1279,"step" : 1}]}]}]} , 
 	{ "Name" : "video_out_data", "interface" : "axis", "bitwidth" : 24, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "video_out.data.byte0.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 1279,"step" : 1}]}]},{"low":8,"up":15,"cElement": [{"cName": "video_out.data.byte1.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 1279,"step" : 1}]}]},{"low":16,"up":23,"cElement": [{"cName": "video_out.data.byte2.V","cData": "uint8","bit_use": { "low": 0,"up": 7},"cArray": [{"low" : 0,"up" : 1279,"step" : 1}]}]}]} , 
 	{ "Name" : "video_out_user_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "video_out.user.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 1279,"step" : 1}]}]}]} , 
 	{ "Name" : "video_out_last_V", "interface" : "axis", "bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "video_out.last.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 1279,"step" : 1}]}]}]} , 
 	{ "Name" : "frames_V", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_vld","bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "frames.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "offset" : {"out":16}, "offset_end" : {"out":23}} , 
 	{ "Name" : "rows_V", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_vld","bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "rows.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "offset" : {"out":24}, "offset_end" : {"out":31}} , 
 	{ "Name" : "pixels_V", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_vld","bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "pixels.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "offset" : {"out":32}, "offset_end" : {"out":39}} , 
 	{ "Name" : "sum_before_V", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_vld","bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "sum_before.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "offset" : {"out":40}, "offset_end" : {"out":47}} , 
 	{ "Name" : "sum_after_V", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_vld","bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "sum_after.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "offset" : {"out":48}, "offset_end" : {"out":55}} , 
 	{ "Name" : "values_V", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_vld","bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "values.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "offset" : {"out":56}, "offset_end" : {"out":63}} , 
 	{ "Name" : "read_done_V", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_vld","bitwidth" : 1, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "read_done.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "offset" : {"out":64}, "offset_end" : {"out":71}} , 
 	{ "Name" : "write_ready_V", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_none","bitwidth" : 1, "direction" : "READONLY", "bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "write_ready.V","cData": "uint1","bit_use": { "low": 0,"up": 0},"cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "offset" : {"in":72}, "offset_end" : {"in":79}} , 
 	{ "Name" : "shared_memory_V", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_memory","bitwidth" : 32, "direction" : "READWRITE", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "shared_memory.V","cData": "uint32","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 255,"step" : 1}]}]}], "offset" : {"in":1024, "out":1024}, "offset_end" : {"in":2047, "out":2047}} ]}
# RTL Port declarations: 
set portNum 29
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ video_in_TDATA sc_in sc_lv 24 signal 0 } 
	{ video_in_TVALID sc_in sc_logic 1 invld 2 } 
	{ video_in_TREADY sc_out sc_logic 1 inacc 2 } 
	{ video_in_TUSER sc_in sc_lv 1 signal 1 } 
	{ video_in_TLAST sc_in sc_lv 1 signal 2 } 
	{ video_out_TDATA sc_out sc_lv 24 signal 3 } 
	{ video_out_TVALID sc_out sc_logic 1 outvld 5 } 
	{ video_out_TREADY sc_in sc_logic 1 outacc 5 } 
	{ video_out_TUSER sc_out sc_lv 1 signal 4 } 
	{ video_out_TLAST sc_out sc_lv 1 signal 5 } 
	{ s_axi_AXILiteS_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_AWADDR sc_in sc_lv 11 signal -1 } 
	{ s_axi_AXILiteS_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_AXILiteS_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_AXILiteS_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_ARADDR sc_in sc_lv 11 signal -1 } 
	{ s_axi_AXILiteS_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_AXILiteS_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_AXILiteS_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_BRESP sc_out sc_lv 2 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_AXILiteS_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "AXILiteS", "role": "AWADDR" },"address":[{"name":"write_ready_V","role":"data","value":"72"},{"name":"shared_memory_V","role":"data","value":"1024"}] },
	{ "name": "s_axi_AXILiteS_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "AWVALID" } },
	{ "name": "s_axi_AXILiteS_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "AWREADY" } },
	{ "name": "s_axi_AXILiteS_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "WVALID" } },
	{ "name": "s_axi_AXILiteS_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "WREADY" } },
	{ "name": "s_axi_AXILiteS_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXILiteS", "role": "WDATA" } },
	{ "name": "s_axi_AXILiteS_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXILiteS", "role": "WSTRB" } },
	{ "name": "s_axi_AXILiteS_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":11, "type": "signal", "bundle":{"name": "AXILiteS", "role": "ARADDR" },"address":[{"name":"frames_V","role":"data","value":"16"}, {"name":"frames_V","role":"valid","value":"20","valid_bit":"0"},{"name":"rows_V","role":"data","value":"24"}, {"name":"rows_V","role":"valid","value":"28","valid_bit":"0"},{"name":"pixels_V","role":"data","value":"32"}, {"name":"pixels_V","role":"valid","value":"36","valid_bit":"0"},{"name":"sum_before_V","role":"data","value":"40"}, {"name":"sum_before_V","role":"valid","value":"44","valid_bit":"0"},{"name":"sum_after_V","role":"data","value":"48"}, {"name":"sum_after_V","role":"valid","value":"52","valid_bit":"0"},{"name":"values_V","role":"data","value":"56"}, {"name":"values_V","role":"valid","value":"60","valid_bit":"0"},{"name":"read_done_V","role":"data","value":"64"}, {"name":"read_done_V","role":"valid","value":"68","valid_bit":"0"},{"name":"shared_memory_V","role":"data","value":"1024"}] },
	{ "name": "s_axi_AXILiteS_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "ARVALID" } },
	{ "name": "s_axi_AXILiteS_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "ARREADY" } },
	{ "name": "s_axi_AXILiteS_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "RVALID" } },
	{ "name": "s_axi_AXILiteS_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "RREADY" } },
	{ "name": "s_axi_AXILiteS_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXILiteS", "role": "RDATA" } },
	{ "name": "s_axi_AXILiteS_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXILiteS", "role": "RRESP" } },
	{ "name": "s_axi_AXILiteS_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "BVALID" } },
	{ "name": "s_axi_AXILiteS_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "BREADY" } },
	{ "name": "s_axi_AXILiteS_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXILiteS", "role": "BRESP" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "video_in_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "video_in_data", "role": "" }} , 
 	{ "name": "video_in_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "video_in_last_V", "role": "default" }} , 
 	{ "name": "video_in_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "video_in_last_V", "role": "default" }} , 
 	{ "name": "video_in_TUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "video_in_user_V", "role": "default" }} , 
 	{ "name": "video_in_TLAST", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "video_in_last_V", "role": "default" }} , 
 	{ "name": "video_out_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":24, "type": "signal", "bundle":{"name": "video_out_data", "role": "" }} , 
 	{ "name": "video_out_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "video_out_last_V", "role": "default" }} , 
 	{ "name": "video_out_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "video_out_last_V", "role": "default" }} , 
 	{ "name": "video_out_TUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "video_out_user_V", "role": "default" }} , 
 	{ "name": "video_out_TLAST", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "video_out_last_V", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22"],
		"CDFG" : "pixel_proc",
		"Protocol" : "ap_ctrl_none",
		"ControlExist" : "0", "ap_start" : "0", "ap_ready" : "0", "ap_done" : "0", "ap_continue" : "0", "ap_idle" : "0",
		"Pipeline" : "Rewind", "UnalignedPipeline" : "0", "RewindPipeline" : "1", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "2571", "EstimateLatencyMax" : "2572",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"Port" : [
			{"Name" : "video_in_data", "Type" : "Axis", "Direction" : "I",
				"BlockSignal" : [
					{"Name" : "video_in_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "video_in_user_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "video_in_last_V", "Type" : "Axis", "Direction" : "I"},
			{"Name" : "video_out_data", "Type" : "Axis", "Direction" : "O",
				"BlockSignal" : [
					{"Name" : "video_out_TDATA_blk_n", "Type" : "RtlSignal"}]},
			{"Name" : "video_out_user_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "video_out_last_V", "Type" : "Axis", "Direction" : "O"},
			{"Name" : "frames_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "rows_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "pixels_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "sum_before_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "sum_after_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "values_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "read_done_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "write_ready_V", "Type" : "None", "Direction" : "I"},
			{"Name" : "shared_memory_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "frame_counter_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "row_counter_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "pixel_counter_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "copy1_state", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "copy1_histogram_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "copy1_values_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "copy1_sum_before_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "copy1_empty_data_ready_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "copy1_empty_data_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "copy1_sum_after_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "copy2_state", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "address_counter_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "copy2_empty_data_ready_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "copy2_sum_before_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "copy2_sum_after_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "copy2_values_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "copy2_histogram_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "copy2_empty_data_V", "Type" : "Memory", "Direction" : "IO"}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.copy1_histogram_V_U", "Parent" : "0"},
	{"ID" : "2", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.copy1_empty_data_V_U", "Parent" : "0"},
	{"ID" : "3", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.copy2_histogram_V_U", "Parent" : "0"},
	{"ID" : "4", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.copy2_empty_data_V_U", "Parent" : "0"},
	{"ID" : "5", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pixel_proc_AXILiteS_s_axi_U", "Parent" : "0"},
	{"ID" : "6", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pixel_proc_mul_21ns_27s_48_7_1_U1", "Parent" : "0"},
	{"ID" : "7", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pixel_proc_mul_20s_27s_47_7_1_U2", "Parent" : "0"},
	{"ID" : "8", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pixel_proc_mul_19s_27s_46_7_1_U3", "Parent" : "0"},
	{"ID" : "9", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pixel_proc_mul_21ns_27s_48_7_1_U4", "Parent" : "0"},
	{"ID" : "10", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pixel_proc_mul_mul_19ns_8ns_26_4_1_U5", "Parent" : "0"},
	{"ID" : "11", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pixel_proc_mac_muladd_17s_8ns_26s_27_bkb_U6", "Parent" : "0"},
	{"ID" : "12", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pixel_proc_mac_muladd_18s_8ns_26ns_27cud_U7", "Parent" : "0"},
	{"ID" : "13", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pixel_proc_mac_muladd_17ns_8ns_26ns_2dEe_U8", "Parent" : "0"},
	{"ID" : "14", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pixel_proc_mac_muladd_19s_8ns_27s_27_eOg_U9", "Parent" : "0"},
	{"ID" : "15", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pixel_proc_mac_muladd_19s_8ns_27s_27_eOg_U10", "Parent" : "0"},
	{"ID" : "16", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.pixel_proc_mac_muladd_20ns_8ns_26ns_2fYi_U11", "Parent" : "0"},
	{"ID" : "17", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_video_in_data_U", "Parent" : "0"},
	{"ID" : "18", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_video_in_user_V_U", "Parent" : "0"},
	{"ID" : "19", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_video_in_last_V_U", "Parent" : "0"},
	{"ID" : "20", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_video_out_data_U", "Parent" : "0"},
	{"ID" : "21", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_video_out_user_V_U", "Parent" : "0"},
	{"ID" : "22", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.regslice_both_video_out_last_V_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
	pixel_proc {
		video_in_data {Type I LastRead 1 FirstWrite -1}
		video_in_user_V {Type I LastRead 1 FirstWrite -1}
		video_in_last_V {Type I LastRead 1 FirstWrite -1}
		video_out_data {Type O LastRead -1 FirstWrite 14}
		video_out_user_V {Type O LastRead -1 FirstWrite 14}
		video_out_last_V {Type O LastRead -1 FirstWrite 14}
		frames_V {Type O LastRead -1 FirstWrite 6}
		rows_V {Type O LastRead -1 FirstWrite 6}
		pixels_V {Type O LastRead -1 FirstWrite 6}
		sum_before_V {Type O LastRead -1 FirstWrite 10}
		sum_after_V {Type O LastRead -1 FirstWrite 10}
		values_V {Type O LastRead -1 FirstWrite 10}
		read_done_V {Type O LastRead -1 FirstWrite 8}
		write_ready_V {Type I LastRead 6 FirstWrite -1}
		shared_memory_V {Type IO LastRead 8 FirstWrite 8}
		frame_counter_V {Type IO LastRead -1 FirstWrite -1}
		row_counter_V {Type IO LastRead -1 FirstWrite -1}
		pixel_counter_V {Type IO LastRead -1 FirstWrite -1}
		copy1_state {Type IO LastRead -1 FirstWrite -1}
		copy1_histogram_V {Type IO LastRead -1 FirstWrite -1}
		copy1_values_V {Type IO LastRead -1 FirstWrite -1}
		copy1_sum_before_V {Type IO LastRead -1 FirstWrite -1}
		copy1_empty_data_ready_V {Type IO LastRead -1 FirstWrite -1}
		copy1_empty_data_V {Type IO LastRead -1 FirstWrite -1}
		copy1_sum_after_V {Type IO LastRead -1 FirstWrite -1}
		copy2_state {Type IO LastRead -1 FirstWrite -1}
		address_counter_V {Type IO LastRead -1 FirstWrite -1}
		copy2_empty_data_ready_V {Type IO LastRead -1 FirstWrite -1}
		copy2_sum_before_V {Type IO LastRead -1 FirstWrite -1}
		copy2_sum_after_V {Type IO LastRead -1 FirstWrite -1}
		copy2_values_V {Type IO LastRead -1 FirstWrite -1}
		copy2_histogram_V {Type IO LastRead -1 FirstWrite -1}
		copy2_empty_data_V {Type IO LastRead -1 FirstWrite -1}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "2571", "Max" : "2572"}
	, {"Name" : "Interval", "Min" : "2560", "Max" : "2560"}
]}

set PipelineEnableSignalInfo {[
	{"Pipeline" : "0", "EnableSignal" : "ap_enable_pp0"}
]}

set Spec2ImplPortList { 
	video_in_data { axis {  { video_in_TDATA in_data 0 24 } } }
	video_in_user_V { axis {  { video_in_TUSER in_data 0 1 } } }
	video_in_last_V { axis {  { video_in_TVALID in_vld 0 1 }  { video_in_TREADY in_acc 1 1 }  { video_in_TLAST in_data 0 1 } } }
	video_out_data { axis {  { video_out_TDATA out_data 1 24 } } }
	video_out_user_V { axis {  { video_out_TUSER out_data 1 1 } } }
	video_out_last_V { axis {  { video_out_TVALID out_vld 1 1 }  { video_out_TREADY out_acc 0 1 }  { video_out_TLAST out_data 1 1 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
