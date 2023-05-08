----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decoder is
	port
	(
		input:   in bit;
		T0, T1: out bit
	);
end decoder;

architecture Behavioral of decoder is
begin
	process (input)
	begin
		case (input) is
			when '0' =>
				T0 <= '1';
				T1 <= '0';
			when '1' =>
				T1 <= '1';
				T0 <= '0';
		end case;
	end process;
end Behavioral;