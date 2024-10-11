library ieee;
use ieee.std_logic_1164.all;

entity alu_c is
  generic (n: integer := 8);
  port (
    a: in std_logic_vector(n-1 downto 0);
    sel: in std_logic_vector(1 downto 0);
    cin: in std_logic;
    f: out std_logic_vector(n-1 downto 0);
    cout: out std_logic
  ) ;
end alu_c;

architecture alu_c_inst of alu_c is
begin

  f <= (a(n-2 downto 0) & '0') when sel(1) = '0' and sel(0) = '0'
    else (a(n-2 downto 0) & a(n-1)) when sel(1) = '0' and sel(0) = '1'
    else (a(n-2 downto 0) & cin) when sel(1) = '1' and sel(0) = '0'
    else (others => '0');
  
  cout <= a(n-1) when sel(1) = '0' and sel(0) = '0'
    else a(n-1) when sel(1) = '0' and sel(0) = '1'
    else a(n-1) when sel(1) = '1' and sel(0) = '0'
    else '0';

end alu_c_inst ; -- alu_c_inst