LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY counter IS
    PORT (
        clk : IN STD_LOGIC;
        rst : IN STD_LOGIC;
        reg : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0')
    );
END ENTITY counter;

ARCHITECTURE BEHAVIORAL OF counter IS
    SIGNAL count : unsigned(3 DOWNTO 0);

BEGIN
    PROCESS (clk)
    BEGIN
        IF rising_edge(clk) THEN
            IF rst = '1' THEN
                count <= (OTHERS => '0');
            ELSE
                count <= count + 1;
            END IF;
        END IF;
    END PROCESS;
END;