git clone : git clone https://github.com/UVVM/UVVM.git

#Compilation list
set path_uvvm_clone C:/Users/enric/Documents/QUESTASIM/Libraries/UVVM

vcom -2008 -work uvvm_util $path_uvvm_clone/uvvm_util/src/*
vcom -2008 -work uvvm_vvc_framework $path_uvvm_clone/uvvm_vvc_framework/src/*


the same procedure for uvvm_cc_framework

C:/Users/enric/Desktop/UnioneElettronica/FPGA/UVVM/NOT_GATE/not_gate_uvvm_tb.vhd