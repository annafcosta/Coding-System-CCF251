transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -vlog01compat -work work +incdir+. {Lot.vo}

vlog -vlog01compat -work work +incdir+C:/Users/gabri/Documents/GitHub/Coding-System-CCF251/TP2 {C:/Users/gabri/Documents/GitHub/Coding-System-CCF251/TP2/lot_tb.v}

vsim -t 1ps -L altera_ver -L cycloneive_ver -L gate_work -L work -voptargs="+acc"  lot_tb

add wave *
view structure
view signals
run -all
