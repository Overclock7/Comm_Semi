transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2 {C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/transmit_16qam.v}
vlog -vlog01compat -work work +incdir+C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2 {C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/tdl.v}
vlog -vlog01compat -work work +incdir+C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2 {C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/register.v}
vlog -vlog01compat -work work +incdir+C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2 {C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/pn_gen.v}
vlog -vlog01compat -work work +incdir+C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2 {C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/mux_4to2.v}
vlog -vlog01compat -work work +incdir+C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2 {C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/filter_16qam.v}
vlog -vlog01compat -work work +incdir+C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2 {C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/coeff_rom.v}
vlog -vlog01compat -work work +incdir+C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2 {C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/clock_generator_2.v}

vlog -vlog01compat -work work +incdir+C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2 {C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/tb_transmit_16qam.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  tb_transmit_16qam

add wave *
view structure
view signals
run -all
