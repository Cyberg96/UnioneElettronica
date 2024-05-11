# This file is public domain, it can be freely copied without restrictions.
# SPDX-License-Identifier: CC0-1.0

# test_my_design.py (simple)

import cocotb
from cocotb.triggers import Timer


# @cocotb.test()
# async def my_first_test(dut):
#     """Try accessing the design."""
# 
#     for cycle in range(10):
#         dut.clk.value = 0
#         await Timer(1, units="ns")
#         dut.clk.value = 1
#         await Timer(1, units="ns")
# 
#     dut._log.info("my_signal_1 is %s", dut.my_signal_1.value)
#     assert dut.my_signal_2.value[0] == 0, "my_signal_2[0] is not 0!"


# test_my_design.py (extended)

import cocotb
from cocotb.triggers import FallingEdge, Timer


# async def generate_clock(dut):
#    """Generate clock pulses."""

#    for cycle in range(10):
#        dut.clk.value = 0
#        await Timer(1, units="ns")
#        dut.clk.value = 1
#        await Timer(1, units="ns")


@cocotb.test()
async def my_second_test(dut):
    """Try accessing the design."""
    """Test for 1 + 1"""

    A = 1
    B = 1
    Cin = 0
  #  await cocotb.start(generate_clock(dut))  # run the clock "in the background"

   # await Timer(100, units="ns")  # wait a bit
    dut.A.value = A
    dut.B.value = B
    dut.Cin.value = Cin

    await Timer(100, units="ns")  # wait a bit

    #dut._log.info("Count is %s", dut.Count.value)
    assert dut.Cout.value[0] == 1, "Cout is not expected!"
    assert dut.s.value[0] == 0, "S is not expected!"
