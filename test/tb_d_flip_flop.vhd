--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_d_flip_flop IS
END tb_d_flip_flop;
 
ARCHITECTURE behavior OF tb_d_flip_flop IS 
	component d_flip_flop
		port
		(
			D, clock: in bit;
			Q:       out bit
		);
	end component;

	--Inputs
	signal D : bit := '0';
	signal clock : bit := '0';

	--Outputs
	signal Q : bit;

	-- Clock period definitions
	constant clock_period : time := 10 ns;
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: d_flip_flop PORT MAP (
          D => D,
          clock => clock,
          Q => Q
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
	D <= '1' after 5 ns,
	     '0' after 15 ns;
END;
