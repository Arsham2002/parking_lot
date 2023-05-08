----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity data_path is
	port
	(
		start, endd, car_in, car_out, clock: in bit;
		count:                              out std_logic_vector(9 downto 0);
		full:                               out std_logic
	);
end data_path;

architecture Structural of data_path is
	component control_unit
		port
		(
			start, endd, clock: in bit;
			T0, T1:            out bit
		);
	end component;
	component counter10bit
		port
		(
			clear  : in bit;
			enable  : in bit;
			sub_add: in bit;
			cp     : in bit;
			count : out std_logic_vector(9 downto 0)
		);
	end component;
	signal s_T0, s_T1, s_clear, s_enable: bit;
	signal s_count: std_logic_vector(9 downto 0);
begin
	cu_pm: control_unit port map
	(
		start => start,
		endd => endd,
		clock => clock,
		T0 => s_T0,
		T1 => s_T1
	);
	c10b_pm: counter10bit port map
	(
		cp => clock,
		clear => s_clear,
		sub_add => car_out,
		enable => s_enable,
		count => s_count
	);
	s_clear <= start and s_T0;
	s_enable <= s_T1 and (car_in xor car_out);
	count <= s_count;
	full <= s_count(9);
end Structural;

