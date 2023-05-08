--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_data_path IS
END tb_data_path;
 
ARCHITECTURE behavior OF tb_data_path IS 
 
    
    COMPONENT data_path
    PORT(
         start : IN  bit;
         endd : IN  bit;
         car_in : IN  bit;
         car_out : IN  bit;
         clock : IN  bit;
         count : OUT  std_logic_vector(9 downto 0);
		 full  : out std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal start : bit := '0';
   signal endd : bit := '0';
   signal car_in : bit := '0';
   signal car_out : bit := '0';
   signal clock : bit := '0';

 	--Outputs
   signal count : std_logic_vector(9 downto 0);
   signal full: std_logic;

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: data_path PORT MAP (
          start => start,
          endd => endd,
          car_in => car_in,
          car_out => car_out,
          clock => clock,
          count => count,
			 full => full
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
	car_in <= '1' after 15 ns,
	          '0' after 30 ns,
				 '1' after 45 ns,
				 '0' after 50 ns;
	car_out <= '1' after 35 ns,
	           '0' after 50 ns;
	endd <= '1' after 55 ns,
	        '0' after 60 ns;
END;
