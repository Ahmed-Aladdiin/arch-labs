library ieee;
use ieee.std_logic_1164.all;

entity alu_a is
    generic (n: integer := 8);
    port (
        a, b: in std_logic_vector (n-1 downto 0);
        cin: in std_logic;
        sel: in std_logic_vector(1 downto 0);
        f: out std_logic_vector(n-1 downto 0);
        cout: out std_logic
    ) ;
end alu_a;

architecture alu_a_arch of alu_a is
    component adder is
        generic (n: integer := 8);
        port (
            a, b: in std_logic_vector(n-1 downto 0);
            cin: in std_logic;
            sel: in std_logic;
            f: out std_logic_vector(n-1 downto 0);
            cout: out std_logic
        );
    end component;

    signal zero_vector : std_logic_vector(n-1 downto 0) := (others => '0');
    signal f1 : std_logic_vector(n-1 downto 0) ; signal c1 : std_logic ;
    signal f2 : std_logic_vector(n-1 downto 0) ; signal c2 : std_logic ;
    signal f3 : std_logic_vector(n-1 downto 0) ; signal c3 : std_logic ;
    signal f4 : std_logic_vector(n-1 downto 0) ; signal c4 : std_logic ;
    signal f5 : std_logic_vector(n-1 downto 0) ; signal c5 : std_logic ;

    signal not_cin : std_logic;
begin
    not_cin <= (not cin);

    sig1 : adder generic map (n) port map (a, zero_vector, cin, '0', f1, c1);
    sig2 : adder generic map (n) port map (a, b, cin, '0', f2, c2);
    sig3 : adder generic map (n) port map (a, b, (not_cin), '1', f3, c3);
    sig4 : adder generic map (n) port map (a, zero_vector, (not_cin), '1', f4, c4);

    f5 <= f4 when cin = '0' else b;
    c5 <= c4 when cin = '0' else '0';

    with sel select
        f <= 
            f1 when "00",
            f2 when "01",
            f3 when "10",
            f5 when others;

    with sel select
        cout <= 
            c1 when "00",
            c2 when "01",
            c3 when "10",
            c5 when others;
    
end architecture;