library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity test is
    port (
        sys_clk         : in    std_logic;
        btn1            : in    std_logic;
        btn2            : in    std_logic;
        reconfig_n      : out   std_logic := '1';
        led             : out   std_logic_vector (5 downto 0)
        );
end entity;

architecture rtl of test is
    signal reconfig_n_r : std_logic := '1';
    signal led_r        : std_logic_vector(5 downto 0) := "111111";
begin
    process(sys_clk)
    begin
        if rising_edge(sys_clk) then
            if btn1 = '1' then
                led_r <= "101010";
            else
                led_r <= "010101";
            end if;
            if btn2 = '1' then
                reconfig_n_r <= '0';
            end if;
        end if;
    end process;

    led <= led_r;

    -- This allows RECONFIG_N to be shorted low externally
    reconfig_n <= '0' when reconfig_n_r = '0' else 'Z';

    -- Driving high in the inactive state makes no difference 
    -- reconfig_n <= reconfig_n_r;

end architecture;
