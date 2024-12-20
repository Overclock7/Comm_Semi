transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {Transmitter_Ver_2_7_1200mv_85c_slow.vo}

vlog -vlog01compat -work work +incdir+C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2 {C:/Users/Overclock/Desktop/Comm_Semi/Transmitter_Ver_2/tb_transmit_16qam.v}

vsim -t 1ps +transport_int_delays +transport_path_delays -L altera_ver -L cycloneive_ver -L gate_work -L work -voptargs="+acc"  tb_transmit_16qam

add wave *
view structure
view signals
run -all
