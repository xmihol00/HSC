// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2020.1
// Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#ifndef _color_convert_HH_
#define _color_convert_HH_

#include "systemc.h"
#include "AESL_pkg.h"

#include "color_convert_macbkb.h"
#include "color_convert_maccud.h"
#include "color_convert_AXILiteS_s_axi.h"

namespace ap_rtl {

template<unsigned int C_S_AXI_AXILITES_ADDR_WIDTH = 7,
         unsigned int C_S_AXI_AXILITES_DATA_WIDTH = 32>
struct color_convert : public sc_module {
    // Port declarations 31
    sc_in_clk ap_clk;
    sc_in< sc_logic > ap_rst_n;
    sc_in< sc_lv<24> > stream_in_24_TDATA;
    sc_in< sc_logic > stream_in_24_TVALID;
    sc_out< sc_logic > stream_in_24_TREADY;
    sc_in< sc_lv<1> > stream_in_24_TUSER;
    sc_in< sc_lv<1> > stream_in_24_TLAST;
    sc_out< sc_lv<24> > stream_out_24_TDATA;
    sc_out< sc_logic > stream_out_24_TVALID;
    sc_in< sc_logic > stream_out_24_TREADY;
    sc_out< sc_lv<1> > stream_out_24_TUSER;
    sc_out< sc_lv<1> > stream_out_24_TLAST;
    sc_in< sc_logic > s_axi_AXILiteS_AWVALID;
    sc_out< sc_logic > s_axi_AXILiteS_AWREADY;
    sc_in< sc_uint<C_S_AXI_AXILITES_ADDR_WIDTH> > s_axi_AXILiteS_AWADDR;
    sc_in< sc_logic > s_axi_AXILiteS_WVALID;
    sc_out< sc_logic > s_axi_AXILiteS_WREADY;
    sc_in< sc_uint<C_S_AXI_AXILITES_DATA_WIDTH> > s_axi_AXILiteS_WDATA;
    sc_in< sc_uint<C_S_AXI_AXILITES_DATA_WIDTH/8> > s_axi_AXILiteS_WSTRB;
    sc_in< sc_logic > s_axi_AXILiteS_ARVALID;
    sc_out< sc_logic > s_axi_AXILiteS_ARREADY;
    sc_in< sc_uint<C_S_AXI_AXILITES_ADDR_WIDTH> > s_axi_AXILiteS_ARADDR;
    sc_out< sc_logic > s_axi_AXILiteS_RVALID;
    sc_in< sc_logic > s_axi_AXILiteS_RREADY;
    sc_out< sc_uint<C_S_AXI_AXILITES_DATA_WIDTH> > s_axi_AXILiteS_RDATA;
    sc_out< sc_lv<2> > s_axi_AXILiteS_RRESP;
    sc_out< sc_logic > s_axi_AXILiteS_BVALID;
    sc_in< sc_logic > s_axi_AXILiteS_BREADY;
    sc_out< sc_lv<2> > s_axi_AXILiteS_BRESP;
    sc_in_clk control;
    sc_in< sc_logic > ap_rst_n_control;
    sc_signal< sc_logic > ap_var_for_const0;


    // Module declarations
    color_convert(sc_module_name name);
    SC_HAS_PROCESS(color_convert);

    ~color_convert();

    sc_trace_file* mVcdFile;

    ofstream mHdltvinHandle;
    ofstream mHdltvoutHandle;
    color_convert_AXILiteS_s_axi<C_S_AXI_AXILITES_ADDR_WIDTH,C_S_AXI_AXILITES_DATA_WIDTH>* color_convert_AXILiteS_s_axi_U;
    color_convert_macbkb<1,1,8,10,18,19>* color_convert_macbkb_U1;
    color_convert_macbkb<1,1,8,10,18,19>* color_convert_macbkb_U2;
    color_convert_macbkb<1,1,8,10,18,19>* color_convert_macbkb_U3;
    color_convert_maccud<1,1,8,10,19,20>* color_convert_maccud_U4;
    color_convert_maccud<1,1,8,10,19,20>* color_convert_maccud_U5;
    color_convert_maccud<1,1,8,10,19,20>* color_convert_maccud_U6;
    regslice_both<24>* regslice_both_stream_in_24_data_U;
    regslice_both<1>* regslice_both_stream_in_24_user_V_U;
    regslice_both<1>* regslice_both_stream_in_24_last_V_U;
    regslice_both<24>* regslice_both_stream_out_24_data_U;
    regslice_both<1>* regslice_both_stream_out_24_user_V_U;
    regslice_both<1>* regslice_both_stream_out_24_last_V_U;
    sc_signal< sc_logic > ap_rst_n_inv;
    sc_signal< sc_lv<10> > c1_c1_V;
    sc_signal< sc_lv<10> > c1_c1_V_0_data_reg;
    sc_signal< sc_logic > c1_c1_V_0_vld_reg;
    sc_signal< sc_logic > c1_c1_V_0_ack_out;
    sc_signal< sc_lv<10> > c1_c2_V;
    sc_signal< sc_lv<10> > c1_c2_V_0_data_reg;
    sc_signal< sc_logic > c1_c2_V_0_vld_reg;
    sc_signal< sc_logic > c1_c2_V_0_ack_out;
    sc_signal< sc_lv<10> > c1_c3_V;
    sc_signal< sc_lv<10> > c1_c3_V_0_data_reg;
    sc_signal< sc_logic > c1_c3_V_0_vld_reg;
    sc_signal< sc_logic > c1_c3_V_0_ack_out;
    sc_signal< sc_lv<10> > c2_c1_V;
    sc_signal< sc_lv<10> > c2_c1_V_0_data_reg;
    sc_signal< sc_logic > c2_c1_V_0_vld_reg;
    sc_signal< sc_logic > c2_c1_V_0_ack_out;
    sc_signal< sc_lv<10> > c2_c2_V;
    sc_signal< sc_lv<10> > c2_c2_V_0_data_reg;
    sc_signal< sc_logic > c2_c2_V_0_vld_reg;
    sc_signal< sc_logic > c2_c2_V_0_ack_out;
    sc_signal< sc_lv<10> > c2_c3_V;
    sc_signal< sc_lv<10> > c2_c3_V_0_data_reg;
    sc_signal< sc_logic > c2_c3_V_0_vld_reg;
    sc_signal< sc_logic > c2_c3_V_0_ack_out;
    sc_signal< sc_lv<10> > c3_c1_V;
    sc_signal< sc_lv<10> > c3_c1_V_0_data_reg;
    sc_signal< sc_logic > c3_c1_V_0_vld_reg;
    sc_signal< sc_logic > c3_c1_V_0_ack_out;
    sc_signal< sc_lv<10> > c3_c2_V;
    sc_signal< sc_lv<10> > c3_c2_V_0_data_reg;
    sc_signal< sc_logic > c3_c2_V_0_vld_reg;
    sc_signal< sc_logic > c3_c2_V_0_ack_out;
    sc_signal< sc_lv<10> > c3_c3_V;
    sc_signal< sc_lv<10> > c3_c3_V_0_data_reg;
    sc_signal< sc_logic > c3_c3_V_0_vld_reg;
    sc_signal< sc_logic > c3_c3_V_0_ack_out;
    sc_signal< sc_lv<10> > bias_c1_V;
    sc_signal< sc_lv<10> > bias_c1_V_0_data_reg;
    sc_signal< sc_logic > bias_c1_V_0_vld_reg;
    sc_signal< sc_logic > bias_c1_V_0_ack_out;
    sc_signal< sc_lv<10> > bias_c2_V;
    sc_signal< sc_lv<10> > bias_c2_V_0_data_reg;
    sc_signal< sc_logic > bias_c2_V_0_vld_reg;
    sc_signal< sc_logic > bias_c2_V_0_ack_out;
    sc_signal< sc_lv<10> > bias_c3_V;
    sc_signal< sc_lv<10> > bias_c3_V_0_data_reg;
    sc_signal< sc_logic > bias_c3_V_0_vld_reg;
    sc_signal< sc_logic > bias_c3_V_0_ack_out;
    sc_signal< sc_logic > stream_in_24_TDATA_blk_n;
    sc_signal< sc_lv<1> > ap_CS_fsm;
    sc_signal< sc_logic > ap_CS_fsm_pp0_stage0;
    sc_signal< bool > ap_block_pp0_stage0;
    sc_signal< sc_logic > stream_out_24_TDATA_blk_n;
    sc_signal< sc_logic > ap_enable_reg_pp0_iter5;
    sc_signal< sc_logic > ap_enable_reg_pp0_iter6;
    sc_signal< sc_logic > ap_rst_n_control_inv;
    sc_signal< sc_lv<1> > stream_in_24_user_V_s_reg_910;
    sc_signal< bool > ap_block_state1_pp0_stage0_iter0;
    sc_signal< bool > ap_block_state2_pp0_stage0_iter1;
    sc_signal< bool > ap_block_state3_pp0_stage0_iter2;
    sc_signal< bool > ap_block_state4_pp0_stage0_iter3;
    sc_signal< bool > ap_block_state5_pp0_stage0_iter4;
    sc_signal< bool > ap_block_state6_pp0_stage0_iter5;
    sc_signal< sc_logic > regslice_both_stream_out_24_data_U_apdone_blk;
    sc_signal< bool > ap_block_state7_pp0_stage0_iter6;
    sc_signal< bool > ap_block_pp0_stage0_11001;
    sc_signal< sc_lv<1> > stream_in_24_user_V_s_reg_910_pp0_iter1_reg;
    sc_signal< sc_lv<1> > stream_in_24_user_V_s_reg_910_pp0_iter2_reg;
    sc_signal< sc_lv<1> > stream_in_24_user_V_s_reg_910_pp0_iter3_reg;
    sc_signal< sc_lv<1> > stream_in_24_user_V_s_reg_910_pp0_iter4_reg;
    sc_signal< sc_lv<1> > stream_in_24_last_V_s_reg_915;
    sc_signal< sc_lv<1> > stream_in_24_last_V_s_reg_915_pp0_iter1_reg;
    sc_signal< sc_lv<1> > stream_in_24_last_V_s_reg_915_pp0_iter2_reg;
    sc_signal< sc_lv<1> > stream_in_24_last_V_s_reg_915_pp0_iter3_reg;
    sc_signal< sc_lv<1> > stream_in_24_last_V_s_reg_915_pp0_iter4_reg;
    sc_signal< sc_lv<8> > p_Repl2_s_fu_215_p1;
    sc_signal< sc_lv<8> > p_Repl2_s_reg_920;
    sc_signal< sc_lv<8> > p_Repl2_1_reg_925;
    sc_signal< sc_lv<8> > p_Repl2_2_reg_930;
    sc_signal< sc_lv<8> > p_Repl2_2_reg_930_pp0_iter1_reg;
    sc_signal< sc_lv<8> > p_Repl2_2_reg_930_pp0_iter2_reg;
    sc_signal< sc_lv<10> > bias_c3_V_read_reg_935;
    sc_signal< sc_lv<10> > bias_c3_V_read_reg_935_pp0_iter2_reg;
    sc_signal< sc_lv<10> > bias_c3_V_read_reg_935_pp0_iter3_reg;
    sc_signal< sc_lv<10> > bias_c2_V_read_reg_940;
    sc_signal< sc_lv<10> > bias_c2_V_read_reg_940_pp0_iter2_reg;
    sc_signal< sc_lv<10> > bias_c2_V_read_reg_940_pp0_iter3_reg;
    sc_signal< sc_lv<10> > bias_c1_V_read_reg_945;
    sc_signal< sc_lv<10> > bias_c1_V_read_reg_945_pp0_iter2_reg;
    sc_signal< sc_lv<10> > bias_c1_V_read_reg_945_pp0_iter3_reg;
    sc_signal< sc_lv<10> > c3_c3_V_read_reg_950;
    sc_signal< sc_lv<10> > c3_c3_V_read_reg_950_pp0_iter2_reg;
    sc_signal< sc_lv<10> > c3_c1_V_read_reg_955;
    sc_signal< sc_lv<10> > c2_c3_V_read_reg_960;
    sc_signal< sc_lv<10> > c2_c3_V_read_reg_960_pp0_iter2_reg;
    sc_signal< sc_lv<10> > c2_c1_V_read_reg_965;
    sc_signal< sc_lv<10> > c1_c3_V_read_reg_970;
    sc_signal< sc_lv<10> > c1_c3_V_read_reg_970_pp0_iter2_reg;
    sc_signal< sc_lv<10> > c1_c2_V_read_reg_975;
    sc_signal< sc_lv<18> > r_V_fu_239_p1;
    sc_signal< sc_lv<18> > r_V_reg_980;
    sc_signal< sc_lv<18> > r_V_12_fu_246_p2;
    sc_signal< sc_lv<18> > r_V_12_reg_986;
    sc_signal< sc_lv<18> > r_V_2_fu_252_p1;
    sc_signal< sc_lv<18> > r_V_2_reg_991;
    sc_signal< sc_lv<18> > r_V_16_fu_259_p2;
    sc_signal< sc_lv<18> > r_V_16_reg_996;
    sc_signal< sc_lv<18> > r_V_19_fu_269_p2;
    sc_signal< sc_lv<18> > r_V_19_reg_1001;
    sc_signal< sc_lv<19> > grp_fu_865_p3;
    sc_signal< sc_lv<19> > ret_V_6_reg_1006;
    sc_signal< sc_logic > ap_enable_reg_pp0_iter2;
    sc_signal< sc_lv<19> > grp_fu_872_p3;
    sc_signal< sc_lv<19> > ret_V_reg_1011;
    sc_signal< sc_lv<19> > grp_fu_879_p3;
    sc_signal< sc_lv<19> > ret_V_11_reg_1016;
    sc_signal< sc_lv<20> > grp_fu_886_p3;
    sc_signal< sc_lv<20> > ret_V_7_reg_1021;
    sc_signal< sc_logic > ap_enable_reg_pp0_iter3;
    sc_signal< sc_lv<20> > grp_fu_894_p3;
    sc_signal< sc_lv<20> > ret_V_9_reg_1026;
    sc_signal< sc_lv<20> > grp_fu_902_p3;
    sc_signal< sc_lv<20> > ret_V_12_reg_1031;
    sc_signal< sc_lv<1> > p_Result_s_fu_330_p3;
    sc_signal< sc_lv<1> > p_Result_s_reg_1036;
    sc_signal< sc_lv<8> > p_Val2_7_fu_368_p2;
    sc_signal< sc_lv<8> > p_Val2_7_reg_1042;
    sc_signal< sc_lv<1> > and_ln781_fu_424_p2;
    sc_signal< sc_lv<1> > and_ln781_reg_1048;
    sc_signal< sc_lv<1> > or_ln785_fu_430_p2;
    sc_signal< sc_lv<1> > or_ln785_reg_1054;
    sc_signal< sc_lv<1> > p_Result_2_fu_452_p3;
    sc_signal< sc_lv<1> > p_Result_2_reg_1060;
    sc_signal< sc_lv<8> > p_Val2_15_fu_490_p2;
    sc_signal< sc_lv<8> > p_Val2_15_reg_1066;
    sc_signal< sc_lv<1> > and_ln781_1_fu_546_p2;
    sc_signal< sc_lv<1> > and_ln781_1_reg_1072;
    sc_signal< sc_lv<1> > or_ln785_1_fu_552_p2;
    sc_signal< sc_lv<1> > or_ln785_1_reg_1078;
    sc_signal< sc_lv<1> > p_Result_4_fu_574_p3;
    sc_signal< sc_lv<1> > p_Result_4_reg_1084;
    sc_signal< sc_lv<8> > p_Val2_23_fu_612_p2;
    sc_signal< sc_lv<8> > p_Val2_23_reg_1090;
    sc_signal< sc_lv<1> > and_ln781_2_fu_668_p2;
    sc_signal< sc_lv<1> > and_ln781_2_reg_1096;
    sc_signal< sc_lv<1> > or_ln785_2_fu_674_p2;
    sc_signal< sc_lv<1> > or_ln785_2_reg_1102;
    sc_signal< sc_logic > ap_enable_reg_pp0_iter1;
    sc_signal< bool > ap_block_pp0_stage0_subdone;
    sc_signal< sc_logic > ap_enable_reg_pp0_iter4;
    sc_signal< bool > ap_block_pp0_stage0_01001;
    sc_signal< sc_lv<8> > r_V_12_fu_246_p0;
    sc_signal< sc_lv<10> > r_V_12_fu_246_p1;
    sc_signal< sc_lv<8> > r_V_16_fu_259_p0;
    sc_signal< sc_lv<10> > r_V_16_fu_259_p1;
    sc_signal< sc_lv<8> > r_V_19_fu_269_p0;
    sc_signal< sc_lv<10> > r_V_19_fu_269_p1;
    sc_signal< sc_lv<18> > rhs_V_2_fu_314_p3;
    sc_signal< sc_lv<20> > sext_ln728_fu_321_p1;
    sc_signal< sc_lv<20> > ret_V_8_fu_325_p2;
    sc_signal< sc_lv<1> > tmp_5_fu_356_p3;
    sc_signal< sc_lv<8> > p_Val2_6_fu_338_p4;
    sc_signal< sc_lv<8> > zext_ln415_fu_364_p1;
    sc_signal< sc_lv<1> > tmp_6_fu_374_p3;
    sc_signal< sc_lv<1> > p_Result_1_fu_348_p3;
    sc_signal< sc_lv<1> > xor_ln416_fu_382_p2;
    sc_signal< sc_lv<4> > tmp_fu_394_p4;
    sc_signal< sc_lv<1> > carry_1_fu_388_p2;
    sc_signal< sc_lv<1> > Range1_all_ones_fu_404_p2;
    sc_signal< sc_lv<1> > Range1_all_zeros_fu_410_p2;
    sc_signal< sc_lv<1> > deleted_zeros_fu_416_p3;
    sc_signal< sc_lv<18> > rhs_V_5_fu_436_p3;
    sc_signal< sc_lv<20> > sext_ln728_1_fu_443_p1;
    sc_signal< sc_lv<20> > ret_V_10_fu_447_p2;
    sc_signal< sc_lv<1> > tmp_9_fu_478_p3;
    sc_signal< sc_lv<8> > zext_ln415_1_fu_486_p1;
    sc_signal< sc_lv<8> > p_Val2_14_fu_460_p4;
    sc_signal< sc_lv<1> > tmp_10_fu_496_p3;
    sc_signal< sc_lv<1> > p_Result_3_fu_470_p3;
    sc_signal< sc_lv<1> > xor_ln416_1_fu_504_p2;
    sc_signal< sc_lv<4> > tmp_1_fu_516_p4;
    sc_signal< sc_lv<1> > carry_3_fu_510_p2;
    sc_signal< sc_lv<1> > Range1_all_ones_1_fu_526_p2;
    sc_signal< sc_lv<1> > Range1_all_zeros_1_fu_532_p2;
    sc_signal< sc_lv<1> > deleted_zeros_1_fu_538_p3;
    sc_signal< sc_lv<18> > rhs_V_8_fu_558_p3;
    sc_signal< sc_lv<20> > sext_ln728_2_fu_565_p1;
    sc_signal< sc_lv<20> > ret_V_13_fu_569_p2;
    sc_signal< sc_lv<1> > tmp_13_fu_600_p3;
    sc_signal< sc_lv<8> > zext_ln415_2_fu_608_p1;
    sc_signal< sc_lv<8> > p_Val2_22_fu_582_p4;
    sc_signal< sc_lv<1> > tmp_14_fu_618_p3;
    sc_signal< sc_lv<1> > p_Result_5_fu_592_p3;
    sc_signal< sc_lv<1> > xor_ln416_2_fu_626_p2;
    sc_signal< sc_lv<4> > tmp_2_fu_638_p4;
    sc_signal< sc_lv<1> > carry_5_fu_632_p2;
    sc_signal< sc_lv<1> > Range1_all_ones_2_fu_648_p2;
    sc_signal< sc_lv<1> > Range1_all_zeros_2_fu_654_p2;
    sc_signal< sc_lv<1> > deleted_zeros_2_fu_660_p3;
    sc_signal< sc_lv<1> > xor_ln781_fu_680_p2;
    sc_signal< sc_lv<1> > xor_ln340_1_fu_695_p2;
    sc_signal< sc_lv<1> > or_ln340_3_fu_700_p2;
    sc_signal< sc_lv<1> > overflow_fu_690_p2;
    sc_signal< sc_lv<1> > and_ln340_fu_705_p2;
    sc_signal< sc_lv<1> > neg_src_fu_685_p2;
    sc_signal< sc_lv<1> > or_ln340_fu_710_p2;
    sc_signal< sc_lv<8> > select_ln340_fu_716_p3;
    sc_signal< sc_lv<8> > select_ln396_fu_723_p3;
    sc_signal< sc_lv<1> > xor_ln781_1_fu_738_p2;
    sc_signal< sc_lv<1> > xor_ln340_fu_753_p2;
    sc_signal< sc_lv<1> > or_ln340_4_fu_758_p2;
    sc_signal< sc_lv<1> > overflow_1_fu_748_p2;
    sc_signal< sc_lv<1> > and_ln340_1_fu_763_p2;
    sc_signal< sc_lv<1> > neg_src_6_fu_743_p2;
    sc_signal< sc_lv<1> > or_ln340_1_fu_768_p2;
    sc_signal< sc_lv<8> > select_ln340_1_fu_774_p3;
    sc_signal< sc_lv<8> > select_ln396_1_fu_781_p3;
    sc_signal< sc_lv<1> > xor_ln781_2_fu_796_p2;
    sc_signal< sc_lv<1> > xor_ln340_2_fu_811_p2;
    sc_signal< sc_lv<1> > or_ln340_5_fu_816_p2;
    sc_signal< sc_lv<1> > overflow_2_fu_806_p2;
    sc_signal< sc_lv<1> > and_ln340_2_fu_821_p2;
    sc_signal< sc_lv<1> > neg_src_7_fu_801_p2;
    sc_signal< sc_lv<1> > or_ln340_2_fu_826_p2;
    sc_signal< sc_lv<8> > select_ln340_2_fu_832_p3;
    sc_signal< sc_lv<8> > select_ln396_2_fu_839_p3;
    sc_signal< sc_lv<8> > out3_V_fu_846_p3;
    sc_signal< sc_lv<8> > out2_V_fu_788_p3;
    sc_signal< sc_lv<8> > out1_V_fu_730_p3;
    sc_signal< sc_lv<8> > grp_fu_865_p0;
    sc_signal< sc_lv<8> > grp_fu_872_p0;
    sc_signal< sc_lv<8> > grp_fu_879_p0;
    sc_signal< sc_lv<8> > grp_fu_886_p0;
    sc_signal< sc_lv<18> > r_V_4_fu_293_p1;
    sc_signal< sc_lv<8> > grp_fu_894_p0;
    sc_signal< sc_lv<8> > grp_fu_902_p0;
    sc_signal< sc_lv<1> > ap_NS_fsm;
    sc_signal< sc_logic > ap_reset_idle_pp0;
    sc_signal< sc_logic > ap_idle_pp0;
    sc_signal< sc_logic > ap_enable_pp0;
    sc_signal< sc_logic > regslice_both_stream_in_24_data_U_apdone_blk;
    sc_signal< sc_lv<24> > stream_in_24_TDATA_int;
    sc_signal< sc_logic > stream_in_24_TVALID_int;
    sc_signal< sc_logic > stream_in_24_TREADY_int;
    sc_signal< sc_logic > regslice_both_stream_in_24_data_U_ack_in;
    sc_signal< sc_logic > regslice_both_stream_in_24_user_V_U_apdone_blk;
    sc_signal< sc_lv<1> > stream_in_24_TUSER_int;
    sc_signal< sc_logic > regslice_both_stream_in_24_user_V_U_vld_out;
    sc_signal< sc_logic > regslice_both_stream_in_24_user_V_U_ack_in;
    sc_signal< sc_logic > regslice_both_stream_in_24_last_V_U_apdone_blk;
    sc_signal< sc_lv<1> > stream_in_24_TLAST_int;
    sc_signal< sc_logic > regslice_both_stream_in_24_last_V_U_vld_out;
    sc_signal< sc_logic > regslice_both_stream_in_24_last_V_U_ack_in;
    sc_signal< sc_lv<24> > stream_out_24_TDATA_int;
    sc_signal< sc_logic > stream_out_24_TVALID_int;
    sc_signal< sc_logic > stream_out_24_TREADY_int;
    sc_signal< sc_logic > regslice_both_stream_out_24_data_U_vld_out;
    sc_signal< sc_logic > regslice_both_stream_out_24_user_V_U_apdone_blk;
    sc_signal< sc_logic > regslice_both_stream_out_24_user_V_U_ack_in_dummy;
    sc_signal< sc_logic > regslice_both_stream_out_24_user_V_U_vld_out;
    sc_signal< sc_logic > regslice_both_stream_out_24_last_V_U_apdone_blk;
    sc_signal< sc_logic > regslice_both_stream_out_24_last_V_U_ack_in_dummy;
    sc_signal< sc_logic > regslice_both_stream_out_24_last_V_U_vld_out;
    sc_signal< sc_lv<18> > r_V_12_fu_246_p00;
    static const sc_logic ap_const_logic_1;
    static const sc_logic ap_const_logic_0;
    static const sc_lv<1> ap_ST_fsm_pp0_stage0;
    static const bool ap_const_boolean_1;
    static const sc_lv<32> ap_const_lv32_0;
    static const bool ap_const_boolean_0;
    static const int C_S_AXI_DATA_WIDTH;
    static const sc_lv<32> ap_const_lv32_8;
    static const sc_lv<32> ap_const_lv32_F;
    static const sc_lv<32> ap_const_lv32_10;
    static const sc_lv<32> ap_const_lv32_17;
    static const sc_lv<8> ap_const_lv8_0;
    static const sc_lv<32> ap_const_lv32_13;
    static const sc_lv<32> ap_const_lv32_7;
    static const sc_lv<1> ap_const_lv1_1;
    static const sc_lv<4> ap_const_lv4_F;
    static const sc_lv<4> ap_const_lv4_0;
    static const sc_lv<8> ap_const_lv8_FF;
    // Thread declarations
    void thread_ap_var_for_const0();
    void thread_ap_clk_no_reset_();
    void thread_Range1_all_ones_1_fu_526_p2();
    void thread_Range1_all_ones_2_fu_648_p2();
    void thread_Range1_all_ones_fu_404_p2();
    void thread_Range1_all_zeros_1_fu_532_p2();
    void thread_Range1_all_zeros_2_fu_654_p2();
    void thread_Range1_all_zeros_fu_410_p2();
    void thread_and_ln340_1_fu_763_p2();
    void thread_and_ln340_2_fu_821_p2();
    void thread_and_ln340_fu_705_p2();
    void thread_and_ln781_1_fu_546_p2();
    void thread_and_ln781_2_fu_668_p2();
    void thread_and_ln781_fu_424_p2();
    void thread_ap_CS_fsm_pp0_stage0();
    void thread_ap_block_pp0_stage0();
    void thread_ap_block_pp0_stage0_01001();
    void thread_ap_block_pp0_stage0_11001();
    void thread_ap_block_pp0_stage0_subdone();
    void thread_ap_block_state1_pp0_stage0_iter0();
    void thread_ap_block_state2_pp0_stage0_iter1();
    void thread_ap_block_state3_pp0_stage0_iter2();
    void thread_ap_block_state4_pp0_stage0_iter3();
    void thread_ap_block_state5_pp0_stage0_iter4();
    void thread_ap_block_state6_pp0_stage0_iter5();
    void thread_ap_block_state7_pp0_stage0_iter6();
    void thread_ap_enable_pp0();
    void thread_ap_idle_pp0();
    void thread_ap_reset_idle_pp0();
    void thread_ap_rst_n_control_inv();
    void thread_ap_rst_n_inv();
    void thread_bias_c1_V_0_ack_out();
    void thread_bias_c2_V_0_ack_out();
    void thread_bias_c3_V_0_ack_out();
    void thread_c1_c1_V_0_ack_out();
    void thread_c1_c2_V_0_ack_out();
    void thread_c1_c3_V_0_ack_out();
    void thread_c2_c1_V_0_ack_out();
    void thread_c2_c2_V_0_ack_out();
    void thread_c2_c3_V_0_ack_out();
    void thread_c3_c1_V_0_ack_out();
    void thread_c3_c2_V_0_ack_out();
    void thread_c3_c3_V_0_ack_out();
    void thread_carry_1_fu_388_p2();
    void thread_carry_3_fu_510_p2();
    void thread_carry_5_fu_632_p2();
    void thread_deleted_zeros_1_fu_538_p3();
    void thread_deleted_zeros_2_fu_660_p3();
    void thread_deleted_zeros_fu_416_p3();
    void thread_grp_fu_865_p0();
    void thread_grp_fu_872_p0();
    void thread_grp_fu_879_p0();
    void thread_grp_fu_886_p0();
    void thread_grp_fu_894_p0();
    void thread_grp_fu_902_p0();
    void thread_neg_src_6_fu_743_p2();
    void thread_neg_src_7_fu_801_p2();
    void thread_neg_src_fu_685_p2();
    void thread_or_ln340_1_fu_768_p2();
    void thread_or_ln340_2_fu_826_p2();
    void thread_or_ln340_3_fu_700_p2();
    void thread_or_ln340_4_fu_758_p2();
    void thread_or_ln340_5_fu_816_p2();
    void thread_or_ln340_fu_710_p2();
    void thread_or_ln785_1_fu_552_p2();
    void thread_or_ln785_2_fu_674_p2();
    void thread_or_ln785_fu_430_p2();
    void thread_out1_V_fu_730_p3();
    void thread_out2_V_fu_788_p3();
    void thread_out3_V_fu_846_p3();
    void thread_overflow_1_fu_748_p2();
    void thread_overflow_2_fu_806_p2();
    void thread_overflow_fu_690_p2();
    void thread_p_Repl2_s_fu_215_p1();
    void thread_p_Result_1_fu_348_p3();
    void thread_p_Result_2_fu_452_p3();
    void thread_p_Result_3_fu_470_p3();
    void thread_p_Result_4_fu_574_p3();
    void thread_p_Result_5_fu_592_p3();
    void thread_p_Result_s_fu_330_p3();
    void thread_p_Val2_14_fu_460_p4();
    void thread_p_Val2_15_fu_490_p2();
    void thread_p_Val2_22_fu_582_p4();
    void thread_p_Val2_23_fu_612_p2();
    void thread_p_Val2_6_fu_338_p4();
    void thread_p_Val2_7_fu_368_p2();
    void thread_r_V_12_fu_246_p0();
    void thread_r_V_12_fu_246_p00();
    void thread_r_V_12_fu_246_p1();
    void thread_r_V_12_fu_246_p2();
    void thread_r_V_16_fu_259_p0();
    void thread_r_V_16_fu_259_p1();
    void thread_r_V_16_fu_259_p2();
    void thread_r_V_19_fu_269_p0();
    void thread_r_V_19_fu_269_p1();
    void thread_r_V_19_fu_269_p2();
    void thread_r_V_2_fu_252_p1();
    void thread_r_V_4_fu_293_p1();
    void thread_r_V_fu_239_p1();
    void thread_ret_V_10_fu_447_p2();
    void thread_ret_V_13_fu_569_p2();
    void thread_ret_V_8_fu_325_p2();
    void thread_rhs_V_2_fu_314_p3();
    void thread_rhs_V_5_fu_436_p3();
    void thread_rhs_V_8_fu_558_p3();
    void thread_select_ln340_1_fu_774_p3();
    void thread_select_ln340_2_fu_832_p3();
    void thread_select_ln340_fu_716_p3();
    void thread_select_ln396_1_fu_781_p3();
    void thread_select_ln396_2_fu_839_p3();
    void thread_select_ln396_fu_723_p3();
    void thread_sext_ln728_1_fu_443_p1();
    void thread_sext_ln728_2_fu_565_p1();
    void thread_sext_ln728_fu_321_p1();
    void thread_stream_in_24_TDATA_blk_n();
    void thread_stream_in_24_TREADY();
    void thread_stream_in_24_TREADY_int();
    void thread_stream_out_24_TDATA_blk_n();
    void thread_stream_out_24_TDATA_int();
    void thread_stream_out_24_TVALID();
    void thread_stream_out_24_TVALID_int();
    void thread_tmp_10_fu_496_p3();
    void thread_tmp_13_fu_600_p3();
    void thread_tmp_14_fu_618_p3();
    void thread_tmp_1_fu_516_p4();
    void thread_tmp_2_fu_638_p4();
    void thread_tmp_5_fu_356_p3();
    void thread_tmp_6_fu_374_p3();
    void thread_tmp_9_fu_478_p3();
    void thread_tmp_fu_394_p4();
    void thread_xor_ln340_1_fu_695_p2();
    void thread_xor_ln340_2_fu_811_p2();
    void thread_xor_ln340_fu_753_p2();
    void thread_xor_ln416_1_fu_504_p2();
    void thread_xor_ln416_2_fu_626_p2();
    void thread_xor_ln416_fu_382_p2();
    void thread_xor_ln781_1_fu_738_p2();
    void thread_xor_ln781_2_fu_796_p2();
    void thread_xor_ln781_fu_680_p2();
    void thread_zext_ln415_1_fu_486_p1();
    void thread_zext_ln415_2_fu_608_p1();
    void thread_zext_ln415_fu_364_p1();
    void thread_ap_NS_fsm();
    void thread_hdltv_gen();
};

}

using namespace ap_rtl;

#endif
