--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_counter10bit IS
END tb_counter10bit;
 
ARCHITECTURE behavior OF tb_counter10bit IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counter10bit
    PORT(
         clear : IN  bit;
         enable : IN  bit;
         sub_add : IN  bit;
         cp : IN  bit;
         count : OUT  std_logic_vector(9 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clear : bit := '0';
   signal enable : bit := '0';
   signal sub_add : bit := '0';
   signal cp : bit := '0';

 	--Outputs
   signal count : std_logic_vector(9 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant cp_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counter10bit PORT MAP (
          clear => clear,
          enable => enable,
          sub_add => sub_add,
          cp => cp,
          count => count
        );

   -- Clock process definitions
   cp_process :process
   begin
		cp <= '0';
		wait for cp_period/2;
		cp <= '1';
		wait for cp_period/2;
   end process;
	enable <= '1';
	clear <= '1' after 5 ns,
	         '0' after 10 ns;
	sub_add <= '0' after 15 ns,
	           '1' after 45 ns;
END;
