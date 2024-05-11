# Enrico Ubaldino
# Makefile cocotb

# defaults
SIM ?= questa

TOPLEVEL_LANG ?= vhdl

PWD=$(shell pwd)

export PYTHONPATH := $(PWD)/../model:$(PYTHONPATH)

ifeq ($(TOPLEVEL_LANG),verilog)
    VERILOG_SOURCES = $(PWD)/../hdl/adder.sv
else ifeq ($(TOPLEVEL_LANG),vhdl)
    VHDL_SOURCES = $(PWD)/../hdl/adder.vhd
else
    $(error A valid value (verilog or vhdl) was not provided for TOPLEVEL_LANG=$(TOPLEVEL_LANG))
endif

TOPLEVEL := adder
MODULE   := test_adder

include $(shell cocotb-config --makefiles)/Makefile.sim
