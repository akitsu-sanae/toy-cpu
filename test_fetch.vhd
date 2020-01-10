library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity test_fetch is
end;

architecture TEST of test_fetch is
  component fetch
    port (
      CLK_FT: in std_logic;
      P_COUNT: in std_logic_vector(7 downto 0);
      PROM_OUT: out std_logic_vector(14 downto 0));
  end component;

  signal CLK_FT: std_logic := '0';
  signal P_COUNT: std_logic_vector(7 downto 0) := "00000000";
  signal PROM_OUT: std_logic_vector(14 downto 0);

begin
  dut: fetch port map (
    CLK_FT => CLK_FT,
    P_COUNT => P_COUNT,
    PROM_OUT => PROM_OUT);

  clock: process begin
    wait for 10 ns;
    CLK_FT <= not CLK_FT;
    P_COUNT <= P_COUNT + 1;
  end process clock;
end TEST;

