library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity test_clk_gen is
end;

architecture TEST of test_clk_gen is
  component clk_gen
    port (
      CLK: in std_logic;
      CLK_FT: out std_logic;
      CLK_DC: out std_logic;
      CLK_EX: out std_logic;
      CLK_WB: out std_logic);
  end component;

  signal CLK: std_logic := '0';
  signal CLK_FT: std_logic := '0';
  signal CLK_DC: std_logic := '0';
  signal CLK_EX: std_logic := '0';
  signal CLK_WB: std_logic := '0';

begin
  dut: clk_gen port map (
    CLK => CLK,
    CLK_FT => CLK_FT,
    CLK_DC => CLK_DC,
    CLK_EX => CLK_EX,
    CLK_WB => CLK_WB);

  clock: process begin
    wait for 10 ns;
    CLK <= not CLK;
  end process clock;
end TEST;

