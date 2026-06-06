Enrico Ubaldino

1) Install FuseSoc -> pip install FuseSoc
2) Make hdl and core
3) See all cores from cmd -> fusesoc core list
4) Run Core from cmd -> fusesoc run --target=sim counter
	fusesoc run --target=sim counter --verbose per saperne di più
5) Run Core Synth from cmd -> fusesoc run --target=synth counter

IF Errors:
1) pip uninstall fusesoc edalize
2) pip install fusesoc
3) modify in Python/version/Edalize/modelsim.py row 166 with tcl_build_rtl.write("{} {}\n".format(cmd, " ".join(str(x) for x in args)))


About Synth:
Run Core from cmd -> fusesoc run --target=synth counter
IF Errors:
set VIVADO_PROJECT_ARGS="--vivado_path=C:\Xilinx\Vivado\2017.4\bin\vivado.bat"
fusesoc run --target=synth counter

OR 
from Windows Button search "Vivado 2017.4 Tcl Shell" -> cd C:/Users/enric/Desktop/UnioneElettronica/FPGA/FuseSoC -> fusesoc run --target=synth counter