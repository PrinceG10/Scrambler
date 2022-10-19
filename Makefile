TOPLEVEL=scrambler
MODULE=test

VERILOG_SOURCES +=scrambler.v

SIM ?= icarus
TOPLEVEL_LANG ?= verilog
include $(shell cocotb-config --makefiles)/Makefile.sim
