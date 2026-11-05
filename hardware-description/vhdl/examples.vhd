library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.env.all;

-- VHDL-2008: a self-contained simulation, not a board top level.
entity examples is
end entity;

architecture simulation of examples is
    subtype sample_t is natural range 0 to 255;
    type sample_list_t is array (natural range <>) of sample_t;
    constant samples : sample_list_t := (12, 85, 120, 0);
    signal clk : std_logic := '0';
    signal reset : boolean := true;
    signal address : natural range 0 to 3 := 0;
    signal result : unsigned(7 downto 0) := (others => '0');

    function normalize(value : sample_t) return sample_t is
    begin
        if value > 100 then
            return 100;
        else
            return value;
        end if;
    end function;
begin
    -- Concurrent assignment creates a simulation clock.
    clk <= not clk after 5 ns;

    registers : process(clk)
    begin
        if rising_edge(clk) then
            if reset then
                result <= (others => '0');
            else
                result <= to_unsigned(normalize(samples(address)), 8);
            end if;
        end if;
    end process;

    stimulus : process
    begin
        wait until falling_edge(clk);
        reset <= false;
        for i in samples'range loop
            address <= i;
            wait until rising_edge(clk);
            -- Signal assignments settle after the clocked process runs.
            wait for 1 ns;
            assert to_integer(result) = normalize(samples(i))
                report "lookup mismatch" severity failure;
            report "result=" & integer'image(to_integer(result));
            wait until falling_edge(clk);
        end loop;
        finish;
        wait;
    end process;
end architecture;
