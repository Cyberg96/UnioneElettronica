# This file is public domain, it can be freely copied without restrictions.
# SPDX-License-Identifier: CC0-1.0

# Makefile

# defaults
SIM ?= questa
TOPLEVEL_LANG ?= vhdl

PWD=$(shell pwd)
export PYTHONPATH := $(PWD)/../model:$(PYTHONPATH)

VHDL_SOURCES += $(PWD)/FullAdder.vhd
# use VHDL_SOURCES for VHDL files

# TOPLEVEL is the name of the toplevel module in your Verilog or VHDL file
TOPLEVEL := fulladder

# MODULE is the basename of the Python test file
MODULE := test_my_design

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim
