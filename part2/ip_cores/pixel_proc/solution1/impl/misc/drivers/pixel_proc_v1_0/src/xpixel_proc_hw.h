// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2020.1 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
// AXILiteS
// 0x000 : reserved
// 0x004 : reserved
// 0x008 : reserved
// 0x00c : reserved
// 0x010 : Data signal of frames_V
//         bit 31~0 - frames_V[31:0] (Read)
// 0x014 : Control signal of frames_V
//         bit 0  - frames_V_ap_vld (Read/COR)
//         others - reserved
// 0x018 : Data signal of rows_V
//         bit 31~0 - rows_V[31:0] (Read)
// 0x01c : Control signal of rows_V
//         bit 0  - rows_V_ap_vld (Read/COR)
//         others - reserved
// 0x020 : Data signal of pixels_V
//         bit 31~0 - pixels_V[31:0] (Read)
// 0x024 : Control signal of pixels_V
//         bit 0  - pixels_V_ap_vld (Read/COR)
//         others - reserved
// 0x028 : Data signal of sum_before_V
//         bit 31~0 - sum_before_V[31:0] (Read)
// 0x02c : Control signal of sum_before_V
//         bit 0  - sum_before_V_ap_vld (Read/COR)
//         others - reserved
// 0x030 : Data signal of sum_after_V
//         bit 31~0 - sum_after_V[31:0] (Read)
// 0x034 : Control signal of sum_after_V
//         bit 0  - sum_after_V_ap_vld (Read/COR)
//         others - reserved
// 0x038 : Data signal of values_V
//         bit 31~0 - values_V[31:0] (Read)
// 0x03c : Control signal of values_V
//         bit 0  - values_V_ap_vld (Read/COR)
//         others - reserved
// 0x040 : Data signal of read_done_V
//         bit 0  - read_done_V[0] (Read)
//         others - reserved
// 0x044 : Control signal of read_done_V
//         bit 0  - read_done_V_ap_vld (Read/COR)
//         others - reserved
// 0x048 : Data signal of write_ready_V
//         bit 0  - write_ready_V[0] (Read/Write)
//         others - reserved
// 0x04c : reserved
// 0x400 ~
// 0x7ff : Memory 'shared_memory_V' (256 * 32b)
//         Word n : bit [31:0] - shared_memory_V[n]
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

#define XPIXEL_PROC_AXILITES_ADDR_FRAMES_V_DATA        0x010
#define XPIXEL_PROC_AXILITES_BITS_FRAMES_V_DATA        32
#define XPIXEL_PROC_AXILITES_ADDR_FRAMES_V_CTRL        0x014
#define XPIXEL_PROC_AXILITES_ADDR_ROWS_V_DATA          0x018
#define XPIXEL_PROC_AXILITES_BITS_ROWS_V_DATA          32
#define XPIXEL_PROC_AXILITES_ADDR_ROWS_V_CTRL          0x01c
#define XPIXEL_PROC_AXILITES_ADDR_PIXELS_V_DATA        0x020
#define XPIXEL_PROC_AXILITES_BITS_PIXELS_V_DATA        32
#define XPIXEL_PROC_AXILITES_ADDR_PIXELS_V_CTRL        0x024
#define XPIXEL_PROC_AXILITES_ADDR_SUM_BEFORE_V_DATA    0x028
#define XPIXEL_PROC_AXILITES_BITS_SUM_BEFORE_V_DATA    32
#define XPIXEL_PROC_AXILITES_ADDR_SUM_BEFORE_V_CTRL    0x02c
#define XPIXEL_PROC_AXILITES_ADDR_SUM_AFTER_V_DATA     0x030
#define XPIXEL_PROC_AXILITES_BITS_SUM_AFTER_V_DATA     32
#define XPIXEL_PROC_AXILITES_ADDR_SUM_AFTER_V_CTRL     0x034
#define XPIXEL_PROC_AXILITES_ADDR_VALUES_V_DATA        0x038
#define XPIXEL_PROC_AXILITES_BITS_VALUES_V_DATA        32
#define XPIXEL_PROC_AXILITES_ADDR_VALUES_V_CTRL        0x03c
#define XPIXEL_PROC_AXILITES_ADDR_READ_DONE_V_DATA     0x040
#define XPIXEL_PROC_AXILITES_BITS_READ_DONE_V_DATA     1
#define XPIXEL_PROC_AXILITES_ADDR_READ_DONE_V_CTRL     0x044
#define XPIXEL_PROC_AXILITES_ADDR_WRITE_READY_V_DATA   0x048
#define XPIXEL_PROC_AXILITES_BITS_WRITE_READY_V_DATA   1
#define XPIXEL_PROC_AXILITES_ADDR_SHARED_MEMORY_V_BASE 0x400
#define XPIXEL_PROC_AXILITES_ADDR_SHARED_MEMORY_V_HIGH 0x7ff
#define XPIXEL_PROC_AXILITES_WIDTH_SHARED_MEMORY_V     32
#define XPIXEL_PROC_AXILITES_DEPTH_SHARED_MEMORY_V     256

