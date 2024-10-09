library ieee;
use ieee.std_logic_1164.all;

entity adder_sub_1bit is
    port (
        a, b: in std_logic;
        cin: in std_logic;
        sel: in std_logic;
        f: out std_logic;
        cout: out std_logic
    );
end entity adder_sub_1bit;

architecture adder_sub_1bit_arch of adder_sub_1bit is
    begin
        f <= a xor b xor cin ;
        cout <= (b and cin) or (a and (b xor cin)) when sel = '0' else
                (not a and b) or (cin and (not (a xor b)));
end architecture adder_sub_1bit_arch;