// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
// Date        : Mon Mar  1 13:10:34 2021
// Host        : david running 64-bit Ubuntu 22.04.2 LTS
// Command     : write_verilog -force -mode synth_stub
//               /mnt/sdc3/david/projs/hardware-software/part2/overlay/hsc_video/hsc_video.srcs/sources_1/bd/hsc_video/ip/hsc_video_axis_register_slice_0_0/hsc_video_axis_register_slice_0_0_stub.v
// Design      : hsc_video_axis_register_slice_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "axis_register_slice_v1_1_21_axis_register_slice,Vivado 2020.1" *)
module hsc_video_axis_register_slice_0_0(aclk, aresetn, s_axis_tvalid, s_axis_tready, 
  s_axis_tdata, s_axis_tlast, s_axis_tuser, m_axis_tvalid, m_axis_tready, m_axis_tdata, 
  m_axis_tlast, m_axis_tuser)
/* synthesis syn_black_box black_box_pad_pin="aclk,aresetn,s_axis_tvalid,s_axis_tready,s_axis_tdata[23:0],s_axis_tlast,s_axis_tuser[0:0],m_axis_tvalid,m_axis_tready,m_axis_tdata[23:0],m_axis_tlast,m_axis_tuser[0:0]" */;
  input aclk;
  input aresetn;
  input s_axis_tvalid;
  output s_axis_tready;
  input [23:0]s_axis_tdata;
  input s_axis_tlast;
  input [0:0]s_axis_tuser;
  output m_axis_tvalid;
  input m_axis_tready;
  output [23:0]m_axis_tdata;
  output m_axis_tlast;
  output [0:0]m_axis_tuser;
endmodule
