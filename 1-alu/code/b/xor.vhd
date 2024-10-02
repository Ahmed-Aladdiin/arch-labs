library ieee;
use ieee.std_logic_1164.all;

entity xor_module is
  port (
    a, b: in std_logic_vector (7 downto 0);
    xor_out: out std_logic_vector(7 downto 0)
  );
end entity xor_module;

architecture arc_struct of xor_module is
begin
  xor_out <= a xor b;
end arc_struct ; -- arc_struct
