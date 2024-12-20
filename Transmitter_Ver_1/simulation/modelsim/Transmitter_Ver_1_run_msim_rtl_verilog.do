transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_1 {C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_1/tdl.v}
vlog -vlog01compat -work work +incdir+C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_1 {C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_1/pn_gen.v}
vlog -vlog01compat -work work +incdir+C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_1 {C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_1/mux_2to1.v}
vlog -vlog01compat -work work +incdir+C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_1 {C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_1/filter_qpsk.v}
vlog -vlog01compat -work work +incdir+C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_1 {C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_1/d_filp_flop.v}
vlog -vlog01compat -work work +incdir+C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_1 {C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_1/coeff_rom.v}
vlog -vlog01compat -work work +incdir+C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_1 {C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_1/clock_generator.v}

vlog -vlog01compat -work work +incdir+C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_1 {C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_1/tb_filter_qpsk.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  tb_filter_qpsk

add wave *
view structure
view signals
run -all
