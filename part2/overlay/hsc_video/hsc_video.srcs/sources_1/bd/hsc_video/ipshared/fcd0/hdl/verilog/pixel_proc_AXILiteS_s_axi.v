// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2020.1 (64-bit)
// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1ns/1ps
module pixel_proc_AXILiteS_s_axi
#(parameter
    C_S_AXI_ADDR_WIDTH = 11,
    C_S_AXI_DATA_WIDTH = 32
)(
    input  wire                          ACLK,
    input  wire                          ARESET,
    input  wire                          ACLK_EN,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] AWADDR,
    input  wire                          AWVALID,
    output wire                          AWREADY,
    input  wire [C_S_AXI_DATA_WIDTH-1:0] WDATA,
    input  wire [C_S_AXI_DATA_WIDTH/8-1:0] WSTRB,
    input  wire                          WVALID,
    output wire                          WREADY,
    output wire [1:0]                    BRESP,
    output wire                          BVALID,
    input  wire                          BREADY,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] ARADDR,
    input  wire                          ARVALID,
    output wire                          ARREADY,
    output wire [C_S_AXI_DATA_WIDTH-1:0] RDATA,
    output wire [1:0]                    RRESP,
    output wire                          RVALID,
    input  wire                          RREADY,
    input  wire [31:0]                   frames_V,
    input  wire                          frames_V_ap_vld,
    input  wire [31:0]                   rows_V,
    input  wire                          rows_V_ap_vld,
    input  wire [31:0]                   pixels_V,
    input  wire                          pixels_V_ap_vld,
    input  wire [31:0]                   sum_before_V,
    input  wire                          sum_before_V_ap_vld,
    input  wire [31:0]                   sum_after_V,
    input  wire                          sum_after_V_ap_vld,
    input  wire [31:0]                   values_V,
    input  wire                          values_V_ap_vld,
    input  wire [0:0]                    read_done_V,
    input  wire                          read_done_V_ap_vld,
    output wire [0:0]                    write_ready_V,
    input  wire [7:0]                    shared_memory_V_address0,
    input  wire                          shared_memory_V_ce0,
    input  wire                          shared_memory_V_we0,
    input  wire [31:0]                   shared_memory_V_d0,
    output wire [31:0]                   shared_memory_V_q0
);
//------------------------Address Info-------------------
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

//------------------------Parameter----------------------
localparam
    ADDR_FRAMES_V_DATA_0      = 11'h010,
    ADDR_FRAMES_V_CTRL        = 11'h014,
    ADDR_ROWS_V_DATA_0        = 11'h018,
    ADDR_ROWS_V_CTRL          = 11'h01c,
    ADDR_PIXELS_V_DATA_0      = 11'h020,
    ADDR_PIXELS_V_CTRL        = 11'h024,
    ADDR_SUM_BEFORE_V_DATA_0  = 11'h028,
    ADDR_SUM_BEFORE_V_CTRL    = 11'h02c,
    ADDR_SUM_AFTER_V_DATA_0   = 11'h030,
    ADDR_SUM_AFTER_V_CTRL     = 11'h034,
    ADDR_VALUES_V_DATA_0      = 11'h038,
    ADDR_VALUES_V_CTRL        = 11'h03c,
    ADDR_READ_DONE_V_DATA_0   = 11'h040,
    ADDR_READ_DONE_V_CTRL     = 11'h044,
    ADDR_WRITE_READY_V_DATA_0 = 11'h048,
    ADDR_WRITE_READY_V_CTRL   = 11'h04c,
    ADDR_SHARED_MEMORY_V_BASE = 11'h400,
    ADDR_SHARED_MEMORY_V_HIGH = 11'h7ff,
    WRIDLE                    = 2'd0,
    WRDATA                    = 2'd1,
    WRRESP                    = 2'd2,
    WRRESET                   = 2'd3,
    RDIDLE                    = 2'd0,
    RDDATA                    = 2'd1,
    RDRESET                   = 2'd2,
    ADDR_BITS         = 11;

//------------------------Local signal-------------------
    reg  [1:0]                    wstate = WRRESET;
    reg  [1:0]                    wnext;
    reg  [ADDR_BITS-1:0]          waddr;
    wire [31:0]                   wmask;
    wire                          aw_hs;
    wire                          w_hs;
    reg  [1:0]                    rstate = RDRESET;
    reg  [1:0]                    rnext;
    reg  [31:0]                   rdata;
    wire                          ar_hs;
    wire [ADDR_BITS-1:0]          raddr;
    // internal registers
    reg  [31:0]                   int_frames_V = 'b0;
    reg                           int_frames_V_ap_vld;
    reg  [31:0]                   int_rows_V = 'b0;
    reg                           int_rows_V_ap_vld;
    reg  [31:0]                   int_pixels_V = 'b0;
    reg                           int_pixels_V_ap_vld;
    reg  [31:0]                   int_sum_before_V = 'b0;
    reg                           int_sum_before_V_ap_vld;
    reg  [31:0]                   int_sum_after_V = 'b0;
    reg                           int_sum_after_V_ap_vld;
    reg  [31:0]                   int_values_V = 'b0;
    reg                           int_values_V_ap_vld;
    reg  [0:0]                    int_read_done_V = 'b0;
    reg                           int_read_done_V_ap_vld;
    reg  [0:0]                    int_write_ready_V = 'b0;
    // memory signals
    wire [7:0]                    int_shared_memory_V_address0;
    wire                          int_shared_memory_V_ce0;
    wire                          int_shared_memory_V_we0;
    wire [3:0]                    int_shared_memory_V_be0;
    wire [31:0]                   int_shared_memory_V_d0;
    wire [31:0]                   int_shared_memory_V_q0;
    wire [7:0]                    int_shared_memory_V_address1;
    wire                          int_shared_memory_V_ce1;
    wire                          int_shared_memory_V_we1;
    wire [3:0]                    int_shared_memory_V_be1;
    wire [31:0]                   int_shared_memory_V_d1;
    wire [31:0]                   int_shared_memory_V_q1;
    reg                           int_shared_memory_V_read;
    reg                           int_shared_memory_V_write;

//------------------------Instantiation------------------
// int_shared_memory_V
pixel_proc_AXILiteS_s_axi_ram #(
    .BYTES    ( 4 ),
    .DEPTH    ( 256 )
) int_shared_memory_V (
    .clk0     ( ACLK ),
    .address0 ( int_shared_memory_V_address0 ),
    .ce0      ( int_shared_memory_V_ce0 ),
    .we0      ( int_shared_memory_V_we0 ),
    .be0      ( int_shared_memory_V_be0 ),
    .d0       ( int_shared_memory_V_d0 ),
    .q0       ( int_shared_memory_V_q0 ),
    .clk1     ( ACLK ),
    .address1 ( int_shared_memory_V_address1 ),
    .ce1      ( int_shared_memory_V_ce1 ),
    .we1      ( int_shared_memory_V_we1 ),
    .be1      ( int_shared_memory_V_be1 ),
    .d1       ( int_shared_memory_V_d1 ),
    .q1       ( int_shared_memory_V_q1 )
);

//------------------------AXI write fsm------------------
assign AWREADY = (wstate == WRIDLE);
assign WREADY  = (wstate == WRDATA);
assign BRESP   = 2'b00;  // OKAY
assign BVALID  = (wstate == WRRESP);
assign wmask   = { {8{WSTRB[3]}}, {8{WSTRB[2]}}, {8{WSTRB[1]}}, {8{WSTRB[0]}} };
assign aw_hs   = AWVALID & AWREADY;
assign w_hs    = WVALID & WREADY;

// wstate
always @(posedge ACLK) begin
    if (ARESET)
        wstate <= WRRESET;
    else if (ACLK_EN)
        wstate <= wnext;
end

// wnext
always @(*) begin
    case (wstate)
        WRIDLE:
            if (AWVALID)
                wnext = WRDATA;
            else
                wnext = WRIDLE;
        WRDATA:
            if (WVALID)
                wnext = WRRESP;
            else
                wnext = WRDATA;
        WRRESP:
            if (BREADY)
                wnext = WRIDLE;
            else
                wnext = WRRESP;
        default:
            wnext = WRIDLE;
    endcase
end

// waddr
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (aw_hs)
            waddr <= AWADDR[ADDR_BITS-1:0];
    end
end

//------------------------AXI read fsm-------------------
assign ARREADY = (rstate == RDIDLE);
assign RDATA   = rdata;
assign RRESP   = 2'b00;  // OKAY
assign RVALID  = (rstate == RDDATA) & !int_shared_memory_V_read;
assign ar_hs   = ARVALID & ARREADY;
assign raddr   = ARADDR[ADDR_BITS-1:0];

// rstate
always @(posedge ACLK) begin
    if (ARESET)
        rstate <= RDRESET;
    else if (ACLK_EN)
        rstate <= rnext;
end

// rnext
always @(*) begin
    case (rstate)
        RDIDLE:
            if (ARVALID)
                rnext = RDDATA;
            else
                rnext = RDIDLE;
        RDDATA:
            if (RREADY & RVALID)
                rnext = RDIDLE;
            else
                rnext = RDDATA;
        default:
            rnext = RDIDLE;
    endcase
end

// rdata
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs) begin
            rdata <= 1'b0;
            case (raddr)
                ADDR_FRAMES_V_DATA_0: begin
                    rdata <= int_frames_V[31:0];
                end
                ADDR_FRAMES_V_CTRL: begin
                    rdata[0] <= int_frames_V_ap_vld;
                end
                ADDR_ROWS_V_DATA_0: begin
                    rdata <= int_rows_V[31:0];
                end
                ADDR_ROWS_V_CTRL: begin
                    rdata[0] <= int_rows_V_ap_vld;
                end
                ADDR_PIXELS_V_DATA_0: begin
                    rdata <= int_pixels_V[31:0];
                end
                ADDR_PIXELS_V_CTRL: begin
                    rdata[0] <= int_pixels_V_ap_vld;
                end
                ADDR_SUM_BEFORE_V_DATA_0: begin
                    rdata <= int_sum_before_V[31:0];
                end
                ADDR_SUM_BEFORE_V_CTRL: begin
                    rdata[0] <= int_sum_before_V_ap_vld;
                end
                ADDR_SUM_AFTER_V_DATA_0: begin
                    rdata <= int_sum_after_V[31:0];
                end
                ADDR_SUM_AFTER_V_CTRL: begin
                    rdata[0] <= int_sum_after_V_ap_vld;
                end
                ADDR_VALUES_V_DATA_0: begin
                    rdata <= int_values_V[31:0];
                end
                ADDR_VALUES_V_CTRL: begin
                    rdata[0] <= int_values_V_ap_vld;
                end
                ADDR_READ_DONE_V_DATA_0: begin
                    rdata <= int_read_done_V[0:0];
                end
                ADDR_READ_DONE_V_CTRL: begin
                    rdata[0] <= int_read_done_V_ap_vld;
                end
                ADDR_WRITE_READY_V_DATA_0: begin
                    rdata <= int_write_ready_V[0:0];
                end
            endcase
        end
        else if (int_shared_memory_V_read) begin
            rdata <= int_shared_memory_V_q1;
        end
    end
end


//------------------------Register logic-----------------
assign write_ready_V = int_write_ready_V;
// int_frames_V
always @(posedge ACLK) begin
    if (ARESET)
        int_frames_V <= 0;
    else if (ACLK_EN) begin
        if (frames_V_ap_vld)
            int_frames_V <= frames_V;
    end
end

// int_frames_V_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_frames_V_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (frames_V_ap_vld)
            int_frames_V_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_FRAMES_V_CTRL)
            int_frames_V_ap_vld <= 1'b0; // clear on read
    end
end

// int_rows_V
always @(posedge ACLK) begin
    if (ARESET)
        int_rows_V <= 0;
    else if (ACLK_EN) begin
        if (rows_V_ap_vld)
            int_rows_V <= rows_V;
    end
end

// int_rows_V_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_rows_V_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (rows_V_ap_vld)
            int_rows_V_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_ROWS_V_CTRL)
            int_rows_V_ap_vld <= 1'b0; // clear on read
    end
end

// int_pixels_V
always @(posedge ACLK) begin
    if (ARESET)
        int_pixels_V <= 0;
    else if (ACLK_EN) begin
        if (pixels_V_ap_vld)
            int_pixels_V <= pixels_V;
    end
end

// int_pixels_V_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_pixels_V_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (pixels_V_ap_vld)
            int_pixels_V_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_PIXELS_V_CTRL)
            int_pixels_V_ap_vld <= 1'b0; // clear on read
    end
end

// int_sum_before_V
always @(posedge ACLK) begin
    if (ARESET)
        int_sum_before_V <= 0;
    else if (ACLK_EN) begin
        if (sum_before_V_ap_vld)
            int_sum_before_V <= sum_before_V;
    end
end

// int_sum_before_V_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_sum_before_V_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (sum_before_V_ap_vld)
            int_sum_before_V_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_SUM_BEFORE_V_CTRL)
            int_sum_before_V_ap_vld <= 1'b0; // clear on read
    end
end

// int_sum_after_V
always @(posedge ACLK) begin
    if (ARESET)
        int_sum_after_V <= 0;
    else if (ACLK_EN) begin
        if (sum_after_V_ap_vld)
            int_sum_after_V <= sum_after_V;
    end
end

// int_sum_after_V_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_sum_after_V_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (sum_after_V_ap_vld)
            int_sum_after_V_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_SUM_AFTER_V_CTRL)
            int_sum_after_V_ap_vld <= 1'b0; // clear on read
    end
end

// int_values_V
always @(posedge ACLK) begin
    if (ARESET)
        int_values_V <= 0;
    else if (ACLK_EN) begin
        if (values_V_ap_vld)
            int_values_V <= values_V;
    end
end

// int_values_V_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_values_V_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (values_V_ap_vld)
            int_values_V_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_VALUES_V_CTRL)
            int_values_V_ap_vld <= 1'b0; // clear on read
    end
end

// int_read_done_V
always @(posedge ACLK) begin
    if (ARESET)
        int_read_done_V <= 0;
    else if (ACLK_EN) begin
        if (read_done_V_ap_vld)
            int_read_done_V <= read_done_V;
    end
end

// int_read_done_V_ap_vld
always @(posedge ACLK) begin
    if (ARESET)
        int_read_done_V_ap_vld <= 1'b0;
    else if (ACLK_EN) begin
        if (read_done_V_ap_vld)
            int_read_done_V_ap_vld <= 1'b1;
        else if (ar_hs && raddr == ADDR_READ_DONE_V_CTRL)
            int_read_done_V_ap_vld <= 1'b0; // clear on read
    end
end

// int_write_ready_V[0:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_write_ready_V[0:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_WRITE_READY_V_DATA_0)
            int_write_ready_V[0:0] <= (WDATA[31:0] & wmask) | (int_write_ready_V[0:0] & ~wmask);
    end
end


//------------------------Memory logic-------------------
// shared_memory_V
assign int_shared_memory_V_address0 = shared_memory_V_address0;
assign int_shared_memory_V_ce0      = shared_memory_V_ce0;
assign int_shared_memory_V_we0      = shared_memory_V_we0;
assign int_shared_memory_V_be0      = {4{shared_memory_V_we0}};
assign int_shared_memory_V_d0       = shared_memory_V_d0;
assign shared_memory_V_q0           = int_shared_memory_V_q0;
assign int_shared_memory_V_address1 = ar_hs? raddr[9:2] : waddr[9:2];
assign int_shared_memory_V_ce1      = ar_hs | (int_shared_memory_V_write & WVALID);
assign int_shared_memory_V_we1      = int_shared_memory_V_write & WVALID;
assign int_shared_memory_V_be1      = WSTRB;
assign int_shared_memory_V_d1       = WDATA;
// int_shared_memory_V_read
always @(posedge ACLK) begin
    if (ARESET)
        int_shared_memory_V_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_SHARED_MEMORY_V_BASE && raddr <= ADDR_SHARED_MEMORY_V_HIGH)
            int_shared_memory_V_read <= 1'b1;
        else
            int_shared_memory_V_read <= 1'b0;
    end
end

// int_shared_memory_V_write
always @(posedge ACLK) begin
    if (ARESET)
        int_shared_memory_V_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_SHARED_MEMORY_V_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_SHARED_MEMORY_V_HIGH)
            int_shared_memory_V_write <= 1'b1;
        else if (WVALID)
            int_shared_memory_V_write <= 1'b0;
    end
end


endmodule


`timescale 1ns/1ps

module pixel_proc_AXILiteS_s_axi_ram
#(parameter
    BYTES  = 4,
    DEPTH  = 256,
    AWIDTH = log2(DEPTH)
) (
    input  wire               clk0,
    input  wire [AWIDTH-1:0]  address0,
    input  wire               ce0,
    input  wire               we0,
    input  wire [BYTES-1:0]   be0,
    input  wire [BYTES*8-1:0] d0,
    output reg  [BYTES*8-1:0] q0,
    input  wire               clk1,
    input  wire [AWIDTH-1:0]  address1,
    input  wire               ce1,
    input  wire               we1,
    input  wire [BYTES-1:0]   be1,
    input  wire [BYTES*8-1:0] d1,
    output reg  [BYTES*8-1:0] q1
);
//------------------------Local signal-------------------
reg  [BYTES*8-1:0] mem[0:DEPTH-1];
//------------------------Task and function--------------
function integer log2;
    input integer x;
    integer n, m;
begin
    n = 1;
    m = 2;
    while (m < x) begin
        n = n + 1;
        m = m * 2;
    end
    log2 = n;
end
endfunction
//------------------------Body---------------------------
// read port 0
always @(posedge clk0) begin
    if (ce0) q0 <= mem[address0];
end

// read port 1
always @(posedge clk1) begin
    if (ce1) q1 <= mem[address1];
end

genvar i;
generate
    for (i = 0; i < BYTES; i = i + 1) begin : gen_write
        // write port 0
        always @(posedge clk0) begin
            if (ce0 & we0 & be0[i]) begin
                mem[address0][8*i+7:8*i] <= d0[8*i+7:8*i];
            end
        end
        // write port 1
        always @(posedge clk1) begin
            if (ce1 & we1 & be1[i]) begin
                mem[address1][8*i+7:8*i] <= d1[8*i+7:8*i];
            end
        end
    end
endgenerate

endmodule

