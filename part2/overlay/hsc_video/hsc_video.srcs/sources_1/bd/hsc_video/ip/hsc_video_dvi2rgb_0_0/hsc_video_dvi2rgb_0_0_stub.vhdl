-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.1 (lin64) Build 2902540 Wed May 27 19:54:35 MDT 2020
-- Date        : Mon Mar  1 13:13:10 2021
-- Host        : david running 64-bit Ubuntu 22.04.2 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /mnt/sdc3/david/projs/hardware-software/part2/overlay/hsc_video/hsc_video.srcs/sources_1/bd/hsc_video/ip/hsc_video_dvi2rgb_0_0/hsc_video_dvi2rgb_0_0_stub.vhdl
-- Design      : hsc_video_dvi2rgb_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity hsc_video_dvi2rgb_0_0 is
  Port ( 
    TMDS_Clk_p : in STD_LOGIC;
    TMDS_Clk_n : in STD_LOGIC;
    TMDS_Data_p : in STD_LOGIC_VECTOR ( 2 downto 0 );
    TMDS_Data_n : in STD_LOGIC_VECTOR ( 2 downto 0 );
    RefClk : in STD_LOGIC;
    aRst_n : in STD_LOGIC;
    vid_pData : out STD_LOGIC_VECTOR ( 23 downto 0 );
    vid_pVDE : out STD_LOGIC;
    vid_pHSync : out STD_LOGIC;
    vid_pVSync : out STD_LOGIC;
    PixelClk : out STD_LOGIC;
    aPixelClkLckd : out STD_LOGIC;
    DDC_SDA_I : in STD_LOGIC;
    DDC_SDA_O : out STD_LOGIC;
    DDC_SDA_T : out STD_LOGIC;
    DDC_SCL_I : in STD_LOGIC;
    DDC_SCL_O : out STD_LOGIC;
    DDC_SCL_T : out STD_LOGIC;
    pRst_n : in STD_LOGIC
  );

end hsc_video_dvi2rgb_0_0;

architecture stub of hsc_video_dvi2rgb_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "TMDS_Clk_p,TMDS_Clk_n,TMDS_Data_p[2:0],TMDS_Data_n[2:0],RefClk,aRst_n,vid_pData[23:0],vid_pVDE,vid_pHSync,vid_pVSync,PixelClk,aPixelClkLckd,DDC_SDA_I,DDC_SDA_O,DDC_SDA_T,DDC_SCL_I,DDC_SCL_O,DDC_SCL_T,pRst_n";
attribute x_core_info : string;
attribute x_core_info of stub : architecture is "dvi2rgb,Vivado 2020.1";
begin
end;
