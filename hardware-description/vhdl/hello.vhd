entity hello is
end entity;

architecture behavior of hello is
begin
    process
    begin
        report "Hello, World!";
        wait;
    end process;
end architecture;
