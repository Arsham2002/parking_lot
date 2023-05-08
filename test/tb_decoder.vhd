--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY tb_decoder IS
END tb_decoder;
 
ARCHITECTURE behavior OF tb_decoder IS 
 
    COMPONENT decoder
    PORT(
         input : IN  bit;
         T0 : OUT  bit;
         T1 : OUT  bit
        );
    END COMPONENT;
    
   --Inputs
   signal input : bit := '0';

 	--Outputs
   signal T0 : bit;
   signal T1 : bit;
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: decoder PORT MAP (
          input => input,
          T0 => T0,
          T1 => T1
        );
	input <= not input after 5 ns;
END;
