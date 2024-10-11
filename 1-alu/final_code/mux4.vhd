library ieee;
use ieee.std_logic_1164.all;

entity mux4 is
    generic (n: integer := 8);
    port (
        a,b,c,d: in std_logic_vector(n-1 downto 0);
        sel: in std_logic_vector(1 downto 0);
        f: out std_logic_vector(n-1 downto 0)
    );
end entity mux4;

architecture mux4_arch of mux4 is
begin
    f <= a when sel = "00" else
         b when sel = "01" else
         c when sel = "10" else
         d;

end architecture mux4_arch;