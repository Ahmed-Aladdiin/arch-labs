library ieee;
use ieee.std_logic_1164.all;

entity adder is
    generic (n: integer := 8);
    port (
        a, b: in std_logic_vector(n-1 downto 0);
        cin: in std_logic;
        sel: in std_logic;
        f: out std_logic_vector(n-1 downto 0);
        cout: out std_logic
    ) ;
end entity adder;

architecture adder_arch of adder is
    component adder_sub_1bit is
        port (
            a, b: in std_logic;
            cin: in std_logic;
            sel: in std_logic;
            f: out std_logic;
            cout: out std_logic
        );
    end component;
    signal carry : std_logic_vector(n downto 0);
begin
    carry(0) <= cin;

    bit_addition : for i in 0 to n-1 generate
        bit_adder : adder_sub_1bit port map (
            a(i),
            b(i),
            carry(i),
            sel,
            f(i),
            carry(i+1)
        );
    end generate ; -- bit_addition

    cout <= carry(n);   
end architecture adder_arch;