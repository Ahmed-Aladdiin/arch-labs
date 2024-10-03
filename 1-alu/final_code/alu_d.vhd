library ieee;
use ieee.std_logic_1164.all;

entity alu_d is
    port (
        a: in std_logic_vector(7 downto 0);
        cin: in std_logic;
        sel: in std_logic_vector(1 downto 0);
        f: out std_logic_vector(7 downto 0);
        cout: out std_logic
    );
end entity alu_d;

architecture alu_d_arch of alu_d is
    begin
        f <= "0" & a(7 downto 1) when sel = "00" else
        a(0) & a(7 downto 1) when sel = "01" else
        cin & a(7 downto 1) when sel = "10" else
        a(7) & a(7 downto 1);

        cout <= a(0);
end architecture alu_d_arch;
