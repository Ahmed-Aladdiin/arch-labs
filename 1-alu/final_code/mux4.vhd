library ieee;
use ieee.std_logic_1164.all;

entity mux4 is
    port (
        a,b,c,d: in std_logic_vector(7 downto 0);
        couta, coutb, coutc, coutd: in std_logic;
        sel: in std_logic_vector(1 downto 0);
        f: out std_logic_vector(7 downto 0);
        cout: out std_logic
    );
end entity mux4;

architecture mux4_arch of mux4 is
begin
    f <= a when sel = "00" else
         b when sel = "01" else
         c when sel = "10" else
         d;
    cout <= couta when sel = "00" else
            coutb when sel = "01" else
            coutc when sel = "10" else
            coutd;
end architecture mux4_arch;