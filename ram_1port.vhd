library IEEE;
use IEEE.std_logic_1164.all;

library altera_mf;
use altera_mf.altera_mf_components.all;

entity ram_1port is
  port (
    address: in std_logic_Vector(5 downto 0);
    clock: in std_logic := '1';
    data: in std_logic_vector(15 downto 0);
    wren: in std_logic;
    q: out std_logic_vector(15 downto 0));
end ram_1port;

architecture SYN of ram_1port is
  signal sub_wire0 : std_logic_vector(15 downto 0);
begin
  q <= sub_wire0(15 downto 0);

  altsyncram_component: altsyncram
  generic map (
    clock_enable_input_a => "BYPASS",
    clock_enable_output_a => "BYPASS",
    intended_device_family => "Cyclone V",
    lpm_hint => "ENABLE_RUNTIME_MOD=NO",
    lpm_type => "altsyncram",
    numwords_a => 64,
    operation_mode => "SINGLE_PORT",
    outdata_aclr_a => "NONE",
    outdata_reg_a => "UNREGISTERED",
    power_up_uninitialized => "FALSE",
    read_during_write_mode_port_a => "NEW_DATA_NO_NBE_READ",
    widthad_a => 6,
    width_a => 16,
    width_byteena_a => 1)
  port map (
    address_a => address,
    clock0 => clock,
    data_a => data,
    q_a => sub_wire0);
end SYN;


