-------------------------------------------------------------------------------
--
-- title       : Full Adder (example)
-- design      :
-- author      : Enrico Ubaldino (External)
-- company     : AIRBUS ITALIA
--
---------------------------------------------------------------------------------

library ieee;
  use ieee.std_logic_1164.all;

entity fulladder is
  port (
    a    : in    std_logic;
    b    : in    std_logic;
    cin  : in    std_logic;
    s    : out   std_logic;
    cout : out   std_logic
  );
end entity fulladder;

architecture bev of fulladder is

begin

  s <= a xor b xor cin;
  -- Cout <= (A and B) or ((A xor B) and Cin);
  cout <= (a nand b) nand (cin nand (a xor b)); -- DeMorgan

end architecture bev;
