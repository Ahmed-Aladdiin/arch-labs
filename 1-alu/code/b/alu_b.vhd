library ieee;
use ieee.std_logic_1164.all;

entity alu_b is
  port (
    a, b: in std_logic_vector(7 downto 0);
    sel: in std_logic_vector(3 downto 0);
    f: out std_logic_vector(7 downto 0);
    cout: out std_logic
  ) ;
end alu_b;

architecture alu_b_inst of alu_b is
begin

  f <= a xor b when sel(1) = '0' and sel(0) = '0'
    else a nand b when sel(1) = '0' and sel(0) = '1'
    else a or b when sel(1) = '1' and sel(0) = '0'
    else (not a) when sel(1) = '1' and sel(0) = '1'
    else (others => '0');
  
  cout <= '0';

end alu_b_inst ; -- alu_b_inst
