library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity pbdprocessor is
port (
	clock_50 : in std_logic;
	key : in std_logic_vector(0 downto 0);
	sw : in std_logic_vector(7 downto 0);
	ledg : out std_logic_vector(7 downto 0)
);
end pbdprocessor;

architecture rtl of pbdprocessor is
	component system
	port (
		signal clk_clk : in std_logic;
		signal reset_reset_n : in std_logic;
		signal switches_export : in std_logic_vector(7 downto 0);
		signal leds_export : out std_logic_vector(7 downto 0)
	);
	end component;
begin
nios : system
	port map (
		clk_clk => clock_50,
		reset_reset_n=> key(0),
		switches_export => sw(7 downto 0),
		leds_export => ledg(7 downto 0)
	);
end rtl;
		
		