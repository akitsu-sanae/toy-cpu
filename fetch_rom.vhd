library IEEE;
use IEEE.std_logic_1164.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

entity fetch_rom is
  port (
    address: in std_logic_vector(7 downto 0);
    clock: in std_logic := '1';
    q: out std_logic_vector(14 downto 0));
end fetch_rom;

architecture SYN of fetch_rom is
  signal sub_wire0: std_logic_vector(14 downto 0);
begin
  q <= sub_wire0(14 downto 0);
  altsyncram_component : altsyncram
  generic map (
    address_aclr_a => "NONE",
    clock_enable_input_a => "BYPASS",
    clock_enable_output_a => "BYPASS",
    init_file => "rom_init.mif",
    intended_device_family => "Cyclone V",
    lpm_hint => "ENABLE_RUNTIME_MOD=NO",
    lpm_type => "altsyncram",
    numwords_a => 256,
    operation_mode => "ROM",
    outdata_aclr_a => "NONE",
    outdata_reg_a => "UNREGISTERS",
    widthad_a => 8,
    width_a => 15,
    width_byteena_a => 1)
  port map (
    address_a => address,
    clock0 => clock,
    q_a => sub_wire0);
end SYN;

