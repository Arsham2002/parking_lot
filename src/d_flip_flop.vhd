----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity d_flip_flop is
	port
	(
		D, clock: in bit;
		Q:       out bit
	);
end d_flip_flop;

architecture Behavioral of d_flip_flop is
begin
	process(clock)
		begin
			if (clock'event and clock = '1') then
				Q <= D;
			end if;
	end process;
end Behavioral;

