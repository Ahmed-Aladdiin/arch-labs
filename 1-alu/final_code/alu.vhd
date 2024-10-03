library ieee;
use ieee.std_logic_1164.all;

entity alu is
    port (
        a,b: in std_logic_vector(7 downto 0);
        cin: in std_logic;
        sel: in std_logic_vector(3 downto 0);
        f: out std_logic_vector(7 downto 0);
        cout: out std_logic
    );
end entity alu;

architecture alu_arch of alu is
    signal f0, f1, f2: std_logic_vector(7 downto 0);
    signal cout0, cout1, cout2: std_logic;
    component alu_b is 
        port (
            a, b: in std_logic_vector(7 downto 0);
            sel: in std_logic_vector(1 downto 0);
            f: out std_logic_vector(7 downto 0);
            cout: out std_logic
        );
    end component;
    component alu_c is 
        port (
            a: in std_logic_vector(7 downto 0);
            sel: in std_logic_vector(1 downto 0);
            cin: in std_logic;
            f: out std_logic_vector(7 downto 0);
            cout: out std_logic
        );
    end component;
    component alu_d is 
        port (
            a: in std_logic_vector(7 downto 0);
            cin: in std_logic;
            sel: in std_logic_vector(1 downto 0);
            f: out std_logic_vector(7 downto 0);
            cout: out std_logic
        );
    end component;
    component mux4 is
        port (
            a,b,c,d: in std_logic_vector(7 downto 0);
            couta, coutb, coutc, coutd: in std_logic;
            sel: in std_logic_vector(1 downto 0);
            f: out std_logic_vector(7 downto 0);
            cout: out std_logic
        );
    end component;
    begin
        u0: alu_b port map (a, b, sel(1 downto 0), f0, cout0);
        u1: alu_c port map (a, sel(1 downto 0), cin, f1, cout1);
        u2: alu_d port map (a, cin, sel(1 downto 0), f2, cout2);
        u3: mux4 port map ("XXXXXXXX", f0, f1, f2, 'X',cout0, cout1, cout2, sel(3 downto 2), f, cout);
        
end architecture alu_arch;

