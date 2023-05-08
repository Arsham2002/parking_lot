----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control_unit is
	port
	(
		start, endd, clock: in bit;
		T0, T1:            out bit
	);
end control_unit;

architecture Structural of control_unit is
	component d_flip_flop
		port
		(
			D, clock: in bit;
			Q:       out bit
		);
	end component; --dff
	component decoder is
		port
		(
			input:   in bit;
			T0, T1: out bit
		);
	end component; --decoder
	signal s_T0, s_T1, s_Q, s_D: bit;
begin
	dff_pm: d_flip_flop port map
	(
		D => s_D,
		clock => clock,
		Q => s_Q
	);
	dec_pm: decoder port map
	(
		input => s_Q,
		T0 => s_T0,
		T1 => s_T1
	);
	s_D <= (start and s_T0) or (s_T1 and (not endd));
	T0 <= s_T0;
	T1 <= s_T1;
end Structural;

