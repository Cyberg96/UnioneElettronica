-------------------------------------------------------------------------------
--
-- title       : Full Adder Test Bench
-- design      :
-- author      : Enrico Ubaldino (External)
-- company     : AIRBUS ITALIA
--
---------------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;

entity tbfulladder is
end entity tbfulladder;

architecture behavior of tbfulladder is

  -- Component Declaration for the Unit Under Test (UUT)

  component fulladder is
    port (
      a    : in    std_logic;
      b    : in    std_logic;
      cin  : in    std_logic;
      s    : out   std_logic;
      cout : out   std_logic
    );
  end component;

  -- Inputs
  signal a   : std_logic; -- := '0';
  signal b   : std_logic; -- := '0';
  signal cin : std_logic; -- := '0';

  -- Outputs
  signal s    : std_logic;
  signal cout : std_logic;

begin

  -- Instantiate the Unit Under Test (UUT)
  dut : component fulladder
    port map (
      a    => a,
      b    => b,
      cin  => cin,
      s    => s,
      cout => cout
    );

  -- Stimulus process
  stim_proc : process is
  begin

    -- hold reset state for 100 ns.
    wait for 100 ns;

    -- insert stimulus here
    a   <= '1';
    b   <= '0';
    cin <= '0';
    wait for 10 ns;

    a   <= '0';
    b   <= '1';
    cin <= '0';
    wait for 10 ns;

    a   <= '1';
    b   <= '1';
    cin <= '0';
    wait for 10 ns;

    a   <= '0';
    b   <= '0';
    cin <= '1';
    wait for 10 ns;

    a   <= '1';
    b   <= '0';
    cin <= '1';
    wait for 10 ns;

    a   <= '0';
    b   <= '1';
    cin <= '1';
    wait for 10 ns;

    a   <= '1';
    b   <= '1';
    cin <= '1';
    wait for 10 ns;

  end process stim_proc;

end architecture behavior;
