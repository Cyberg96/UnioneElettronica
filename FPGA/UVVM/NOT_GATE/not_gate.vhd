LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY not_gate IS
    PORT (
        a : IN STD_LOGIC;
        y : OUT STD_LOGIC);
END not_gate;

ARCHITECTURE Behavioral OF not_gate IS
BEGIN
    y <= NOT a;
END Behavioral;