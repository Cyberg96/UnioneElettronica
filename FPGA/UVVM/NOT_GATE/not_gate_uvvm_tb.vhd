LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

-- UVVM libraries
LIBRARY uvvm_util;
CONTEXT uvvm_util.uvvm_util_context;

ENTITY tb_not_gate IS
END tb_not_gate;

ARCHITECTURE Behavioral OF tb_not_gate IS

    -- DUT signals
    SIGNAL a : STD_LOGIC;
    SIGNAL y : STD_LOGIC;

BEGIN

    -- Instantiate the DUT
    uut : ENTITY work.not_gate
        PORT MAP(
            a => a,
            y => y
        );

    -- Main test process
    test_proc : PROCESS
        VARIABLE test_id : STRING(1 TO 10);
    BEGIN
        -------------------------------------------------------------------
        -- Initialization
        -------------------------------------------------------------------
        REPORT "Start of test for NOT Gate";
        --set_global_timing(10 ns, 10 ns);
        a <= '0';
        WAIT FOR 10 ns;

        -------------------------------------------------------------------
        -- Test Case 1: a = '0'
        -------------------------------------------------------------------
        test_id := "TC1: a='0'";
        a <= '0';
        WAIT FOR 10 ns;
        IF y /= '1' THEN
            REPORT test_id & " - Failed. Expected y='1', got y='" & to_string(y) & "'";
        ELSE
            REPORT test_id & " - Passed.";
        END IF;

        -------------------------------------------------------------------
        -- Test Case 2: a = '1'
        -------------------------------------------------------------------
        test_id := "TC2: a='1'";
        a <= '1';
        WAIT FOR 10 ns;
        IF y /= '0' THEN
            REPORT test_id & " - Failed. Expected y='0', got y='" & to_string(y) & "'";
        ELSE
            REPORT test_id & " - Passed.";
        END IF;

        -------------------------------------------------------------------
        -- Test End
        -------------------------------------------------------------------
        REPORT "End of test for NOT Gate";
        WAIT;
    END PROCESS test_proc;

END Behavioral;