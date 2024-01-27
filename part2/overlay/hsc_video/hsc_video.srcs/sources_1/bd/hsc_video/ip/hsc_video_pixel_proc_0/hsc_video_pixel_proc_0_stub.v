// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
// Date        : Mon Mar  1 13:16:44 2021
// Host        : david running 64-bit Ubuntu 22.04.2 LTS
// Command     : write_verilog -force -mode synth_stub
//               /mnt/sdc3/david/projs/hardware-software/part2/overlay/hsc_video/hsc_video.srcs/sources_1/bd/hsc_video/ip/hsc_video_pixel_proc_0/hsc_video_pixel_proc_0_stub.v
// Design      : hsc_video_pixel_proc_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "pixel_proc,Vivado 2020.1" *)
module hsc_video_pixel_proc_0(s_axi_AXILiteS_AWADDR, 
  s_axi_AXILiteS_AWVALID, s_axi_AXILiteS_AWREADY, s_axi_AXILiteS_WDATA, 
  s_axi_AXILiteS_WSTRB, s_axi_AXILiteS_WVALID, s_axi_AXILiteS_WREADY, 
  s_axi_AXILiteS_BRESP, s_axi_AXILiteS_BVALID, s_axi_AXILiteS_BREADY, 
  s_axi_AXILiteS_ARADDR, s_axi_AXILiteS_ARVALID, s_axi_AXILiteS_ARREADY, 
  s_axi_AXILiteS_RDATA, s_axi_AXILiteS_RRESP, s_axi_AXILiteS_RVALID, 
  s_axi_AXILiteS_RREADY, ap_clk, ap_rst_n, video_in_TVALID, video_in_TREADY, video_in_TDATA, 
  video_in_TLAST, video_in_TUSER, video_out_TVALID, video_out_TREADY, video_out_TDATA, 
  video_out_TLAST, video_out_TUSER)
/* synthesis syn_black_box black_box_pad_pin="s_axi_AXILiteS_AWADDR[10:0],s_axi_AXILiteS_AWVALID,s_axi_AXILiteS_AWREADY,s_axi_AXILiteS_WDATA[31:0],s_axi_AXILiteS_WSTRB[3:0],s_axi_AXILiteS_WVALID,s_axi_AXILiteS_WREADY,s_axi_AXILiteS_BRESP[1:0],s_axi_AXILiteS_BVALID,s_axi_AXILiteS_BREADY,s_axi_AXILiteS_ARADDR[10:0],s_axi_AXILiteS_ARVALID,s_axi_AXILiteS_ARREADY,s_axi_AXILiteS_RDATA[31:0],s_axi_AXILiteS_RRESP[1:0],s_axi_AXILiteS_RVALID,s_axi_AXILiteS_RREADY,ap_clk,ap_rst_n,video_in_TVALID,video_in_TREADY,video_in_TDATA[23:0],video_in_TLAST[0:0],video_in_TUSER[0:0],video_out_TVALID,video_out_TREADY,video_out_TDATA[23:0],video_out_TLAST[0:0],video_out_TUSER[0:0]" */;
  input [10:0]s_axi_AXILiteS_AWADDR;
  input s_axi_AXILiteS_AWVALID;
  output s_axi_AXILiteS_AWREADY;
  input [31:0]s_axi_AXILiteS_WDATA;
  input [3:0]s_axi_AXILiteS_WSTRB;
  input s_axi_AXILiteS_WVALID;
  output s_axi_AXILiteS_WREADY;
  output [1:0]s_axi_AXILiteS_BRESP;
  output s_axi_AXILiteS_BVALID;
  input s_axi_AXILiteS_BREADY;
  input [10:0]s_axi_AXILiteS_ARADDR;
  input s_axi_AXILiteS_ARVALID;
  output s_axi_AXILiteS_ARREADY;
  output [31:0]s_axi_AXILiteS_RDATA;
  output [1:0]s_axi_AXILiteS_RRESP;
  output s_axi_AXILiteS_RVALID;
  input s_axi_AXILiteS_RREADY;
  input ap_clk;
  input ap_rst_n;
  input video_in_TVALID;
  output video_in_TREADY;
  input [23:0]video_in_TDATA;
  input [0:0]video_in_TLAST;
  input [0:0]video_in_TUSER;
  output video_out_TVALID;
  input video_out_TREADY;
  output [23:0]video_out_TDATA;
  output [0:0]video_out_TLAST;
  output [0:0]video_out_TUSER;
endmodule
