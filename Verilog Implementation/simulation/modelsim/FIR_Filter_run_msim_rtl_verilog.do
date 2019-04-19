transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+//Mac/Home/Desktop/Buffalo_Spring_2019/EE_450/Final_project/Verilog\ Implementation {//Mac/Home/Desktop/Buffalo_Spring_2019/EE_450/Final_project/Verilog Implementation/tap.v}
vlog -vlog01compat -work work +incdir+//Mac/Home/Desktop/Buffalo_Spring_2019/EE_450/Final_project/Verilog\ Implementation {//Mac/Home/Desktop/Buffalo_Spring_2019/EE_450/Final_project/Verilog Implementation/fir_filter.v}
vlog -vlog01compat -work work +incdir+//Mac/Home/Desktop/Buffalo_Spring_2019/EE_450/Final_project/Verilog\ Implementation {//Mac/Home/Desktop/Buffalo_Spring_2019/EE_450/Final_project/Verilog Implementation/testbench_filter.v}

