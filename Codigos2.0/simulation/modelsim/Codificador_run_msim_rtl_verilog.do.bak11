transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/gabri/Documents/GitHub/Coding-System-CCF251/Codigos2.0 {C:/Users/gabri/Documents/GitHub/Coding-System-CCF251/Codigos2.0/Codificador.v}
vlog -vlog01compat -work work +incdir+C:/Users/gabri/Documents/GitHub/Coding-System-CCF251/Codigos2.0 {C:/Users/gabri/Documents/GitHub/Coding-System-CCF251/Codigos2.0/Display.v}

vlog -vlog01compat -work work +incdir+C:/Users/gabri/Documents/GitHub/Coding-System-CCF251/Codigos2.0 {C:/Users/gabri/Documents/GitHub/Coding-System-CCF251/Codigos2.0/Tb_display.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  Tb_display

add wave *
view structure
view signals
run -all
