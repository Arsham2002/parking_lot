--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_control_unit IS
END tb_control_unit;
 
ARCHITECTURE behavior OF tb_control_unit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT control_unit
    PORT(
         start : IN  bit;
         endd : IN  bit;
         clock : IN  bit;
         T0 : OUT  bit;
         T1 : OUT  bit
        );
    END COMPONENT;
    

   --Inputs
   signal start : bit := '0';
   signal endd : bit := '0';
   signal clock : bit := '0';

 	--Outputs
   signal T0 : bit;
   signal T1 : bit;

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: control_unit PORT MAP (
          start => start,
          endd => endd,
          clock => clock,
          T0 => T0,
          T1 => T1
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
	start <= '1' after 5 ns,
	        '0' after 10 ns;
	endd <= '1' after 25 ns,
	        '0' after 30 ns;
END;
