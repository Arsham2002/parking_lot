----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity counter10bit is
	port
	(
		clear  : in bit;
		enable  : in bit;
		sub_add: in bit;
		cp     : in bit;
		count : out std_logic_vector(9 downto 0)
	);
end counter10bit;

architecture Structural of counter10bit is
signal s_count: std_logic_vector(9 downto 0);
begin
	process(cp) is
		begin
	 if (cp'event and cp = '1') then
		if   (clear = '1') then
					s_count <= "0000000000";
		elsif(enable = '1') then
			if (sub_add = '0' and s_count /= "1111111111") then
				s_count <= s_count + "0000000001";
			elsif(s_count /= "0000000000") then
				s_count <= s_count - "0000000001";
			end if;
	   end if;
	 end if;
	end process;
	count <= s_count;
end Structural;


