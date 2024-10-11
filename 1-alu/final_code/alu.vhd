library ieee;
use ieee.std_logic_1164.all;

entity alu is
    generic (n: integer := 8);
    port (
        a,b: in std_logic_vector(n-1 downto 0);
        cin: in std_logic;
        sel: in std_logic_vector(3 downto 0);
        f: out std_logic_vector(n-1 downto 0);
        cout: out std_logic
    );
end entity alu;

architecture alu_arch of alu is
    signal f0, f1, f2, f3: std_logic_vector(n-1 downto 0);
    signal cout0, cout1, cout2, cout3, cout4: std_logic_vector(0 downto 0);
    component alu_a is
        generic (n: integer := 8);
        port (
            a, b: in std_logic_vector(n-1 downto 0);
            cin: in std_logic;
            sel: in std_logic_vector(1 downto 0);
            f: out std_logic_vector(n-1 downto 0);
            cout: out std_logic
        );
    end component;
    component alu_b is 
        generic (n: integer := 8);
        port (
            a, b: in std_logic_vector(n-1 downto 0);
            sel: in std_logic_vector(1 downto 0);
            f: out std_logic_vector(n-1 downto 0);
            cout: out std_logic
        );
    end component;
    component alu_c is 
        generic (n: integer := 8);
        port (
            a: in std_logic_vector(n-1 downto 0);
            sel: in std_logic_vector(1 downto 0);
            cin: in std_logic;
            f: out std_logic_vector(n-1 downto 0);
            cout: out std_logic
        );
    end component;
    component alu_d is
        generic (n: integer := 8);
        port (
            a: in std_logic_vector(n-1 downto 0);
            cin: in std_logic;
            sel: in std_logic_vector(1 downto 0);
            f: out std_logic_vector(n-1 downto 0);
            cout: out std_logic
        );
    end component;
    component mux4 is
        generic (n: integer := 8);
        port (
            a,b,c,d: in std_logic_vector(n-1 downto 0);
            sel: in std_logic_vector(1 downto 0);
            f: out std_logic_vector(n-1 downto 0)
        );
    end component;
    begin
        alu_a_intance: alu_a generic map (n) port map (a, b, cin, sel(1 downto 0), f0, cout0(0));
        alu_b_intance: alu_b generic map (n) port map (a, b, sel(1 downto 0), f1, cout1(0));
        alu_c_intance: alu_c generic map (n) port map (a, sel(1 downto 0), cin, f2, cout2(0));
        alu_d_intance: alu_d generic map (n) port map (a, cin, sel(1 downto 0), f3, cout3(0));
        mux4_f: mux4 generic map (n) port map (f0, f1, f2, f3, sel(3 downto 2), f);
        mux4_cout: mux4 generic map (1) port map (
            cout0, 
            cout1, 
            cout2, 
            cout3, 
            sel(3 downto 2), 
            cout4
        );

        cout <= cout4(0);
end architecture alu_arch;

