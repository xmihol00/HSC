-- ==============================================================
-- Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2020.1 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity pixel_proc_AXILiteS_s_axi is
generic (
    C_S_AXI_ADDR_WIDTH    : INTEGER := 11;
    C_S_AXI_DATA_WIDTH    : INTEGER := 32);
port (
    ACLK                  :in   STD_LOGIC;
    ARESET                :in   STD_LOGIC;
    ACLK_EN               :in   STD_LOGIC;
    AWADDR                :in   STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
    AWVALID               :in   STD_LOGIC;
    AWREADY               :out  STD_LOGIC;
    WDATA                 :in   STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
    WSTRB                 :in   STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH/8-1 downto 0);
    WVALID                :in   STD_LOGIC;
    WREADY                :out  STD_LOGIC;
    BRESP                 :out  STD_LOGIC_VECTOR(1 downto 0);
    BVALID                :out  STD_LOGIC;
    BREADY                :in   STD_LOGIC;
    ARADDR                :in   STD_LOGIC_VECTOR(C_S_AXI_ADDR_WIDTH-1 downto 0);
    ARVALID               :in   STD_LOGIC;
    ARREADY               :out  STD_LOGIC;
    RDATA                 :out  STD_LOGIC_VECTOR(C_S_AXI_DATA_WIDTH-1 downto 0);
    RRESP                 :out  STD_LOGIC_VECTOR(1 downto 0);
    RVALID                :out  STD_LOGIC;
    RREADY                :in   STD_LOGIC;
    frames_V              :in   STD_LOGIC_VECTOR(31 downto 0);
    frames_V_ap_vld       :in   STD_LOGIC;
    rows_V                :in   STD_LOGIC_VECTOR(31 downto 0);
    rows_V_ap_vld         :in   STD_LOGIC;
    pixels_V              :in   STD_LOGIC_VECTOR(31 downto 0);
    pixels_V_ap_vld       :in   STD_LOGIC;
    sum_before_V          :in   STD_LOGIC_VECTOR(31 downto 0);
    sum_before_V_ap_vld   :in   STD_LOGIC;
    sum_after_V           :in   STD_LOGIC_VECTOR(31 downto 0);
    sum_after_V_ap_vld    :in   STD_LOGIC;
    values_V              :in   STD_LOGIC_VECTOR(31 downto 0);
    values_V_ap_vld       :in   STD_LOGIC;
    read_done_V           :in   STD_LOGIC_VECTOR(0 downto 0);
    read_done_V_ap_vld    :in   STD_LOGIC;
    write_ready_V         :out  STD_LOGIC_VECTOR(0 downto 0);
    shared_memory_V_address0 :in   STD_LOGIC_VECTOR(7 downto 0);
    shared_memory_V_ce0   :in   STD_LOGIC;
    shared_memory_V_we0   :in   STD_LOGIC;
    shared_memory_V_d0    :in   STD_LOGIC_VECTOR(31 downto 0);
    shared_memory_V_q0    :out  STD_LOGIC_VECTOR(31 downto 0)
);
end entity pixel_proc_AXILiteS_s_axi;

-- ------------------------Address Info-------------------
-- 0x000 : reserved
-- 0x004 : reserved
-- 0x008 : reserved
-- 0x00c : reserved
-- 0x010 : Data signal of frames_V
--         bit 31~0 - frames_V[31:0] (Read)
-- 0x014 : Control signal of frames_V
--         bit 0  - frames_V_ap_vld (Read/COR)
--         others - reserved
-- 0x018 : Data signal of rows_V
--         bit 31~0 - rows_V[31:0] (Read)
-- 0x01c : Control signal of rows_V
--         bit 0  - rows_V_ap_vld (Read/COR)
--         others - reserved
-- 0x020 : Data signal of pixels_V
--         bit 31~0 - pixels_V[31:0] (Read)
-- 0x024 : Control signal of pixels_V
--         bit 0  - pixels_V_ap_vld (Read/COR)
--         others - reserved
-- 0x028 : Data signal of sum_before_V
--         bit 31~0 - sum_before_V[31:0] (Read)
-- 0x02c : Control signal of sum_before_V
--         bit 0  - sum_before_V_ap_vld (Read/COR)
--         others - reserved
-- 0x030 : Data signal of sum_after_V
--         bit 31~0 - sum_after_V[31:0] (Read)
-- 0x034 : Control signal of sum_after_V
--         bit 0  - sum_after_V_ap_vld (Read/COR)
--         others - reserved
-- 0x038 : Data signal of values_V
--         bit 31~0 - values_V[31:0] (Read)
-- 0x03c : Control signal of values_V
--         bit 0  - values_V_ap_vld (Read/COR)
--         others - reserved
-- 0x040 : Data signal of read_done_V
--         bit 0  - read_done_V[0] (Read)
--         others - reserved
-- 0x044 : Control signal of read_done_V
--         bit 0  - read_done_V_ap_vld (Read/COR)
--         others - reserved
-- 0x048 : Data signal of write_ready_V
--         bit 0  - write_ready_V[0] (Read/Write)
--         others - reserved
-- 0x04c : reserved
-- 0x400 ~
-- 0x7ff : Memory 'shared_memory_V' (256 * 32b)
--         Word n : bit [31:0] - shared_memory_V[n]
-- (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

architecture behave of pixel_proc_AXILiteS_s_axi is
    type states is (wridle, wrdata, wrresp, wrreset, rdidle, rddata, rdreset);  -- read and write fsm states
    signal wstate  : states := wrreset;
    signal rstate  : states := rdreset;
    signal wnext, rnext: states;
    constant ADDR_FRAMES_V_DATA_0      : INTEGER := 16#010#;
    constant ADDR_FRAMES_V_CTRL        : INTEGER := 16#014#;
    constant ADDR_ROWS_V_DATA_0        : INTEGER := 16#018#;
    constant ADDR_ROWS_V_CTRL          : INTEGER := 16#01c#;
    constant ADDR_PIXELS_V_DATA_0      : INTEGER := 16#020#;
    constant ADDR_PIXELS_V_CTRL        : INTEGER := 16#024#;
    constant ADDR_SUM_BEFORE_V_DATA_0  : INTEGER := 16#028#;
    constant ADDR_SUM_BEFORE_V_CTRL    : INTEGER := 16#02c#;
    constant ADDR_SUM_AFTER_V_DATA_0   : INTEGER := 16#030#;
    constant ADDR_SUM_AFTER_V_CTRL     : INTEGER := 16#034#;
    constant ADDR_VALUES_V_DATA_0      : INTEGER := 16#038#;
    constant ADDR_VALUES_V_CTRL        : INTEGER := 16#03c#;
    constant ADDR_READ_DONE_V_DATA_0   : INTEGER := 16#040#;
    constant ADDR_READ_DONE_V_CTRL     : INTEGER := 16#044#;
    constant ADDR_WRITE_READY_V_DATA_0 : INTEGER := 16#048#;
    constant ADDR_WRITE_READY_V_CTRL   : INTEGER := 16#04c#;
    constant ADDR_SHARED_MEMORY_V_BASE : INTEGER := 16#400#;
    constant ADDR_SHARED_MEMORY_V_HIGH : INTEGER := 16#7ff#;
    constant ADDR_BITS         : INTEGER := 11;

    signal waddr               : UNSIGNED(ADDR_BITS-1 downto 0);
    signal wmask               : UNSIGNED(31 downto 0);
    signal aw_hs               : STD_LOGIC;
    signal w_hs                : STD_LOGIC;
    signal rdata_data          : UNSIGNED(31 downto 0);
    signal ar_hs               : STD_LOGIC;
    signal raddr               : UNSIGNED(ADDR_BITS-1 downto 0);
    signal AWREADY_t           : STD_LOGIC;
    signal WREADY_t            : STD_LOGIC;
    signal ARREADY_t           : STD_LOGIC;
    signal RVALID_t            : STD_LOGIC;
    -- internal registers
    signal int_frames_V        : UNSIGNED(31 downto 0) := (others => '0');
    signal int_frames_V_ap_vld : STD_LOGIC;
    signal int_rows_V          : UNSIGNED(31 downto 0) := (others => '0');
    signal int_rows_V_ap_vld   : STD_LOGIC;
    signal int_pixels_V        : UNSIGNED(31 downto 0) := (others => '0');
    signal int_pixels_V_ap_vld : STD_LOGIC;
    signal int_sum_before_V    : UNSIGNED(31 downto 0) := (others => '0');
    signal int_sum_before_V_ap_vld : STD_LOGIC;
    signal int_sum_after_V     : UNSIGNED(31 downto 0) := (others => '0');
    signal int_sum_after_V_ap_vld : STD_LOGIC;
    signal int_values_V        : UNSIGNED(31 downto 0) := (others => '0');
    signal int_values_V_ap_vld : STD_LOGIC;
    signal int_read_done_V     : UNSIGNED(0 downto 0) := (others => '0');
    signal int_read_done_V_ap_vld : STD_LOGIC;
    signal int_write_ready_V   : UNSIGNED(0 downto 0) := (others => '0');
    -- memory signals
    signal int_shared_memory_V_address0 : UNSIGNED(7 downto 0);
    signal int_shared_memory_V_ce0 : STD_LOGIC;
    signal int_shared_memory_V_we0 : STD_LOGIC;
    signal int_shared_memory_V_be0 : UNSIGNED(3 downto 0);
    signal int_shared_memory_V_d0 : UNSIGNED(31 downto 0);
    signal int_shared_memory_V_q0 : UNSIGNED(31 downto 0);
    signal int_shared_memory_V_address1 : UNSIGNED(7 downto 0);
    signal int_shared_memory_V_ce1 : STD_LOGIC;
    signal int_shared_memory_V_we1 : STD_LOGIC;
    signal int_shared_memory_V_be1 : UNSIGNED(3 downto 0);
    signal int_shared_memory_V_d1 : UNSIGNED(31 downto 0);
    signal int_shared_memory_V_q1 : UNSIGNED(31 downto 0);
    signal int_shared_memory_V_read : STD_LOGIC;
    signal int_shared_memory_V_write : STD_LOGIC;

    component pixel_proc_AXILiteS_s_axi_ram is
        generic (
            BYTES   : INTEGER :=4;
            DEPTH   : INTEGER :=256;
            AWIDTH  : INTEGER :=8);
        port (
            clk0    : in  STD_LOGIC;
            address0: in  UNSIGNED(AWIDTH-1 downto 0);
            ce0     : in  STD_LOGIC;
            we0     : in  STD_LOGIC;
            be0     : in  UNSIGNED(BYTES-1 downto 0);
            d0      : in  UNSIGNED(BYTES*8-1 downto 0);
            q0      : out UNSIGNED(BYTES*8-1 downto 0);
            clk1    : in  STD_LOGIC;
            address1: in  UNSIGNED(AWIDTH-1 downto 0);
            ce1     : in  STD_LOGIC;
            we1     : in  STD_LOGIC;
            be1     : in  UNSIGNED(BYTES-1 downto 0);
            d1      : in  UNSIGNED(BYTES*8-1 downto 0);
            q1      : out UNSIGNED(BYTES*8-1 downto 0));
    end component pixel_proc_AXILiteS_s_axi_ram;

    function log2 (x : INTEGER) return INTEGER is
        variable n, m : INTEGER;
    begin
        n := 1;
        m := 2;
        while m < x loop
            n := n + 1;
            m := m * 2;
        end loop;
        return n;
    end function log2;

begin
-- ----------------------- Instantiation------------------
-- int_shared_memory_V
int_shared_memory_V : pixel_proc_AXILiteS_s_axi_ram
generic map (
     BYTES    => 4,
     DEPTH    => 256,
     AWIDTH   => log2(256))
port map (
     clk0     => ACLK,
     address0 => int_shared_memory_V_address0,
     ce0      => int_shared_memory_V_ce0,
     we0      => int_shared_memory_V_we0,
     be0      => int_shared_memory_V_be0,
     d0       => int_shared_memory_V_d0,
     q0       => int_shared_memory_V_q0,
     clk1     => ACLK,
     address1 => int_shared_memory_V_address1,
     ce1      => int_shared_memory_V_ce1,
     we1      => int_shared_memory_V_we1,
     be1      => int_shared_memory_V_be1,
     d1       => int_shared_memory_V_d1,
     q1       => int_shared_memory_V_q1);

-- ----------------------- AXI WRITE ---------------------
    AWREADY_t <=  '1' when wstate = wridle else '0';
    AWREADY   <=  AWREADY_t;
    WREADY_t  <=  '1' when wstate = wrdata else '0';
    WREADY    <=  WREADY_t;
    BRESP     <=  "00";  -- OKAY
    BVALID    <=  '1' when wstate = wrresp else '0';
    wmask     <=  (31 downto 24 => WSTRB(3), 23 downto 16 => WSTRB(2), 15 downto 8 => WSTRB(1), 7 downto 0 => WSTRB(0));
    aw_hs     <=  AWVALID and AWREADY_t;
    w_hs      <=  WVALID and WREADY_t;

    -- write FSM
    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                wstate <= wrreset;
            elsif (ACLK_EN = '1') then
                wstate <= wnext;
            end if;
        end if;
    end process;

    process (wstate, AWVALID, WVALID, BREADY)
    begin
        case (wstate) is
        when wridle =>
            if (AWVALID = '1') then
                wnext <= wrdata;
            else
                wnext <= wridle;
            end if;
        when wrdata =>
            if (WVALID = '1') then
                wnext <= wrresp;
            else
                wnext <= wrdata;
            end if;
        when wrresp =>
            if (BREADY = '1') then
                wnext <= wridle;
            else
                wnext <= wrresp;
            end if;
        when others =>
            wnext <= wridle;
        end case;
    end process;

    waddr_proc : process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (aw_hs = '1') then
                    waddr <= UNSIGNED(AWADDR(ADDR_BITS-1 downto 0));
                end if;
            end if;
        end if;
    end process;

-- ----------------------- AXI READ ----------------------
    ARREADY_t <= '1' when (rstate = rdidle) else '0';
    ARREADY <= ARREADY_t;
    RDATA   <= STD_LOGIC_VECTOR(rdata_data);
    RRESP   <= "00";  -- OKAY
    RVALID_t  <= '1' when (rstate = rddata) and (int_shared_memory_V_read = '0') else '0';
    RVALID    <= RVALID_t;
    ar_hs   <= ARVALID and ARREADY_t;
    raddr   <= UNSIGNED(ARADDR(ADDR_BITS-1 downto 0));

    -- read FSM
    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                rstate <= rdreset;
            elsif (ACLK_EN = '1') then
                rstate <= rnext;
            end if;
        end if;
    end process;

    process (rstate, ARVALID, RREADY, RVALID_t)
    begin
        case (rstate) is
        when rdidle =>
            if (ARVALID = '1') then
                rnext <= rddata;
            else
                rnext <= rdidle;
            end if;
        when rddata =>
            if (RREADY = '1' and RVALID_t = '1') then
                rnext <= rdidle;
            else
                rnext <= rddata;
            end if;
        when others =>
            rnext <= rdidle;
        end case;
    end process;

    rdata_proc : process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (ar_hs = '1') then
                    case (TO_INTEGER(raddr)) is
                    when ADDR_FRAMES_V_DATA_0 =>
                        rdata_data <= RESIZE(int_frames_V(31 downto 0), 32);
                    when ADDR_FRAMES_V_CTRL =>
                        rdata_data <= (0 => int_frames_V_ap_vld, others => '0');
                    when ADDR_ROWS_V_DATA_0 =>
                        rdata_data <= RESIZE(int_rows_V(31 downto 0), 32);
                    when ADDR_ROWS_V_CTRL =>
                        rdata_data <= (0 => int_rows_V_ap_vld, others => '0');
                    when ADDR_PIXELS_V_DATA_0 =>
                        rdata_data <= RESIZE(int_pixels_V(31 downto 0), 32);
                    when ADDR_PIXELS_V_CTRL =>
                        rdata_data <= (0 => int_pixels_V_ap_vld, others => '0');
                    when ADDR_SUM_BEFORE_V_DATA_0 =>
                        rdata_data <= RESIZE(int_sum_before_V(31 downto 0), 32);
                    when ADDR_SUM_BEFORE_V_CTRL =>
                        rdata_data <= (0 => int_sum_before_V_ap_vld, others => '0');
                    when ADDR_SUM_AFTER_V_DATA_0 =>
                        rdata_data <= RESIZE(int_sum_after_V(31 downto 0), 32);
                    when ADDR_SUM_AFTER_V_CTRL =>
                        rdata_data <= (0 => int_sum_after_V_ap_vld, others => '0');
                    when ADDR_VALUES_V_DATA_0 =>
                        rdata_data <= RESIZE(int_values_V(31 downto 0), 32);
                    when ADDR_VALUES_V_CTRL =>
                        rdata_data <= (0 => int_values_V_ap_vld, others => '0');
                    when ADDR_READ_DONE_V_DATA_0 =>
                        rdata_data <= RESIZE(int_read_done_V(0 downto 0), 32);
                    when ADDR_READ_DONE_V_CTRL =>
                        rdata_data <= (0 => int_read_done_V_ap_vld, others => '0');
                    when ADDR_WRITE_READY_V_DATA_0 =>
                        rdata_data <= RESIZE(int_write_ready_V(0 downto 0), 32);
                    when others =>
                        rdata_data <= (others => '0');
                    end case;
                elsif (int_shared_memory_V_read = '1') then
                    rdata_data <= int_shared_memory_V_q1;
                end if;
            end if;
        end if;
    end process;

-- ----------------------- Register logic ----------------
    write_ready_V        <= STD_LOGIC_VECTOR(int_write_ready_V);

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_frames_V <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (frames_V_ap_vld = '1') then
                    int_frames_V <= UNSIGNED(frames_V); -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_frames_V_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (frames_V_ap_vld = '1') then
                    int_frames_V_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_FRAMES_V_CTRL) then
                    int_frames_V_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_rows_V <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (rows_V_ap_vld = '1') then
                    int_rows_V <= UNSIGNED(rows_V); -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_rows_V_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (rows_V_ap_vld = '1') then
                    int_rows_V_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_ROWS_V_CTRL) then
                    int_rows_V_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_pixels_V <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (pixels_V_ap_vld = '1') then
                    int_pixels_V <= UNSIGNED(pixels_V); -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_pixels_V_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (pixels_V_ap_vld = '1') then
                    int_pixels_V_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_PIXELS_V_CTRL) then
                    int_pixels_V_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_sum_before_V <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (sum_before_V_ap_vld = '1') then
                    int_sum_before_V <= UNSIGNED(sum_before_V); -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_sum_before_V_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (sum_before_V_ap_vld = '1') then
                    int_sum_before_V_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_SUM_BEFORE_V_CTRL) then
                    int_sum_before_V_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_sum_after_V <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (sum_after_V_ap_vld = '1') then
                    int_sum_after_V <= UNSIGNED(sum_after_V); -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_sum_after_V_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (sum_after_V_ap_vld = '1') then
                    int_sum_after_V_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_SUM_AFTER_V_CTRL) then
                    int_sum_after_V_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_values_V <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (values_V_ap_vld = '1') then
                    int_values_V <= UNSIGNED(values_V); -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_values_V_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (values_V_ap_vld = '1') then
                    int_values_V_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_VALUES_V_CTRL) then
                    int_values_V_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_read_done_V <= (others => '0');
            elsif (ACLK_EN = '1') then
                if (read_done_V_ap_vld = '1') then
                    int_read_done_V <= UNSIGNED(read_done_V); -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_read_done_V_ap_vld <= '0';
            elsif (ACLK_EN = '1') then
                if (read_done_V_ap_vld = '1') then
                    int_read_done_V_ap_vld <= '1';
                elsif (ar_hs = '1' and raddr = ADDR_READ_DONE_V_CTRL) then
                    int_read_done_V_ap_vld <= '0'; -- clear on read
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ACLK_EN = '1') then
                if (w_hs = '1' and waddr = ADDR_WRITE_READY_V_DATA_0) then
                    int_write_ready_V(0 downto 0) <= (UNSIGNED(WDATA(0 downto 0)) and wmask(0 downto 0)) or ((not wmask(0 downto 0)) and int_write_ready_V(0 downto 0));
                end if;
            end if;
        end if;
    end process;


-- ----------------------- Memory logic ------------------
    -- shared_memory_V
    int_shared_memory_V_address0 <= UNSIGNED(shared_memory_V_address0);
    int_shared_memory_V_ce0 <= shared_memory_V_ce0;
    int_shared_memory_V_we0 <= shared_memory_V_we0;
    int_shared_memory_V_be0 <= (others => shared_memory_V_we0);
    int_shared_memory_V_d0 <= RESIZE(UNSIGNED(shared_memory_V_d0), 32);
    shared_memory_V_q0   <= STD_LOGIC_VECTOR(RESIZE(int_shared_memory_V_q0, 32));
    int_shared_memory_V_address1 <= raddr(9 downto 2) when ar_hs = '1' else waddr(9 downto 2);
    int_shared_memory_V_ce1 <= '1' when ar_hs = '1' or (int_shared_memory_V_write = '1' and WVALID  = '1') else '0';
    int_shared_memory_V_we1 <= '1' when int_shared_memory_V_write = '1' and WVALID = '1' else '0';
    int_shared_memory_V_be1 <= UNSIGNED(WSTRB);
    int_shared_memory_V_d1 <= UNSIGNED(WDATA);

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_shared_memory_V_read <= '0';
            elsif (ACLK_EN = '1') then
                if (ar_hs = '1' and raddr >= ADDR_SHARED_MEMORY_V_BASE and raddr <= ADDR_SHARED_MEMORY_V_HIGH) then
                    int_shared_memory_V_read <= '1';
                else
                    int_shared_memory_V_read <= '0';
                end if;
            end if;
        end if;
    end process;

    process (ACLK)
    begin
        if (ACLK'event and ACLK = '1') then
            if (ARESET = '1') then
                int_shared_memory_V_write <= '0';
            elsif (ACLK_EN = '1') then
                if (aw_hs = '1' and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) >= ADDR_SHARED_MEMORY_V_BASE and UNSIGNED(AWADDR(ADDR_BITS-1 downto 0)) <= ADDR_SHARED_MEMORY_V_HIGH) then
                    int_shared_memory_V_write <= '1';
                elsif (WVALID = '1') then
                    int_shared_memory_V_write <= '0';
                end if;
            end if;
        end if;
    end process;


end architecture behave;

library IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.numeric_std.all;

entity pixel_proc_AXILiteS_s_axi_ram is
    generic (
        BYTES   : INTEGER :=4;
        DEPTH   : INTEGER :=256;
        AWIDTH  : INTEGER :=8);
    port (
        clk0    : in  STD_LOGIC;
        address0: in  UNSIGNED(AWIDTH-1 downto 0);
        ce0     : in  STD_LOGIC;
        we0     : in  STD_LOGIC;
        be0     : in  UNSIGNED(BYTES-1 downto 0);
        d0      : in  UNSIGNED(BYTES*8-1 downto 0);
        q0      : out UNSIGNED(BYTES*8-1 downto 0);
        clk1    : in  STD_LOGIC;
        address1: in  UNSIGNED(AWIDTH-1 downto 0);
        ce1     : in  STD_LOGIC;
        we1     : in  STD_LOGIC;
        be1     : in  UNSIGNED(BYTES-1 downto 0);
        d1      : in  UNSIGNED(BYTES*8-1 downto 0);
        q1      : out UNSIGNED(BYTES*8-1 downto 0));

end entity pixel_proc_AXILiteS_s_axi_ram;

architecture behave of pixel_proc_AXILiteS_s_axi_ram is
    signal address0_tmp : UNSIGNED(AWIDTH-1 downto 0);
    signal address1_tmp : UNSIGNED(AWIDTH-1 downto 0);
    type RAM_T is array (0 to DEPTH - 1) of UNSIGNED(BYTES*8 - 1 downto 0);
    shared variable mem : RAM_T := (others => (others => '0'));
begin

    process (address0)
    begin
    address0_tmp <= address0;
    --synthesis translate_off
          if (address0 > DEPTH-1) then
              address0_tmp <= (others => '0');
          else
              address0_tmp <= address0;
          end if;
    --synthesis translate_on
    end process;

    process (address1)
    begin
    address1_tmp <= address1;
    --synthesis translate_off
          if (address1 > DEPTH-1) then
              address1_tmp <= (others => '0');
          else
              address1_tmp <= address1;
          end if;
    --synthesis translate_on
    end process;

    --read port 0
    process (clk0) begin
        if (clk0'event and clk0 = '1') then
            if (ce0 = '1') then
                q0 <= mem(to_integer(address0_tmp));
            end if;
        end if;
    end process;

    --read port 1
    process (clk1) begin
        if (clk1'event and clk1 = '1') then
            if (ce1 = '1') then
                q1 <= mem(to_integer(address1_tmp));
            end if;
        end if;
    end process;

    gen_write : for i in 0 to BYTES - 1 generate
    begin
        --write port 0
        process (clk0)
        begin
            if (clk0'event and clk0 = '1') then
                if (ce0 = '1' and we0 = '1' and be0(i) = '1') then
                    mem(to_integer(address0_tmp))(8*i+7 downto 8*i) := d0(8*i+7 downto 8*i);
                end if;
            end if;
        end process;

        --write port 1
        process (clk1)
        begin
            if (clk1'event and clk1 = '1') then
                if (ce1 = '1' and we1 = '1' and be1(i) = '1') then
                    mem(to_integer(address1_tmp))(8*i+7 downto 8*i) := d1(8*i+7 downto 8*i);
                end if;
            end if;
        end process;

    end generate;

end architecture behave;


