 

onerror {resume}
quietly WaveActivateNextPane {} 0

add wave -noupdate -divider fetchEnv_fetch_in_agent 
add wave -noupdate /uvm_root/uvm_test_top/environment.fetchEnv/fetch_in_agent/fetch_in_agent_monitor/txn_stream
add wave -noupdate -group fetchEnv_fetch_in_agent_bus /hdl_top/fetchEnv_fetch_in_agent_bus/*
add wave -noupdate -divider fetchEnv_fetch_out_agent 
add wave -noupdate /uvm_root/uvm_test_top/environment.fetchEnv/fetch_out_agent/fetch_out_agent_monitor/txn_stream
add wave -noupdate -group fetchEnv_fetch_out_agent_bus /hdl_top/fetchEnv_fetch_out_agent_bus/*
add wave -noupdate -divider decodeEnv_decode_in_agent 
add wave -noupdate /uvm_root/uvm_test_top/environment.decodeEnv/decode_in_agent/decode_in_agent_monitor/txn_stream
add wave -noupdate -group decodeEnv_decode_in_agent_bus /hdl_top/decodeEnv_decode_in_agent_bus/*
add wave -noupdate -divider decodeEnv_decode_out_agent 
add wave -noupdate /uvm_root/uvm_test_top/environment.decodeEnv/decode_out_agent/decode_out_agent_monitor/txn_stream
add wave -noupdate -group decodeEnv_decode_out_agent_bus /hdl_top/decodeEnv_decode_out_agent_bus/*
add wave -noupdate -divider writebackEnv_writeback_in_agent 
add wave -noupdate /uvm_root/uvm_test_top/environment.writebackEnv/writeback_in_agent/writeback_in_agent_monitor/txn_stream
add wave -noupdate -group writebackEnv_writeback_in_agent_bus /hdl_top/writebackEnv_writeback_in_agent_bus/*
add wave -noupdate -divider writebackEnv_writeback_out_agent 
add wave -noupdate /uvm_root/uvm_test_top/environment.writebackEnv/writeback_out_agent/writeback_out_agent_monitor/txn_stream
add wave -noupdate -group writebackEnv_writeback_out_agent_bus /hdl_top/writebackEnv_writeback_out_agent_bus/*
add wave -noupdate -divider memaccessEnv_memaccess_in_agent 
add wave -noupdate /uvm_root/uvm_test_top/environment.memaccessEnv/memaccess_in_agent/memaccess_in_agent_monitor/txn_stream
add wave -noupdate -group memaccessEnv_memaccess_in_agent_bus /hdl_top/memaccessEnv_memaccess_in_agent_bus/*
add wave -noupdate -divider memaccessEnv_memaccess_out_agent 
add wave -noupdate /uvm_root/uvm_test_top/environment.memaccessEnv/memaccess_out_agent/memaccess_out_agent_monitor/txn_stream
add wave -noupdate -group memaccessEnv_memaccess_out_agent_bus /hdl_top/memaccessEnv_memaccess_out_agent_bus/*
add wave -noupdate -divider controlEnv_control_in_agent 
add wave -noupdate /uvm_root/uvm_test_top/environment.controlEnv/control_in_agent/control_in_agent_monitor/txn_stream
add wave -noupdate -group controlEnv_control_in_agent_bus /hdl_top/controlEnv_control_in_agent_bus/*
add wave -noupdate -divider controlEnv_control_out_agent 
add wave -noupdate /uvm_root/uvm_test_top/environment.controlEnv/control_out_agent/control_out_agent_monitor/txn_stream
add wave -noupdate -group controlEnv_control_out_agent_bus /hdl_top/controlEnv_control_out_agent_bus/*
add wave -noupdate -divider executeEnv_execute_in_agent 
add wave -noupdate /uvm_root/uvm_test_top/environment.executeEnv/execute_in_agent/execute_in_agent_monitor/txn_stream
add wave -noupdate -group executeEnv_execute_in_agent_bus /hdl_top/executeEnv_execute_in_agent_bus/*
add wave -noupdate -divider executeEnv_execute_out_agent 
add wave -noupdate /uvm_root/uvm_test_top/environment.executeEnv/execute_out_agent/execute_out_agent_monitor/txn_stream
add wave -noupdate -group executeEnv_execute_out_agent_bus /hdl_top/executeEnv_execute_out_agent_bus/*
add wave -noupdate -divider imemResp 
add wave -noupdate /uvm_root/uvm_test_top/environment/imemResp/imemResp_monitor/txn_stream
add wave -noupdate -group imemResp_bus /hdl_top/imemResp_bus/*
add wave -noupdate -divider dmemResp 
add wave -noupdate /uvm_root/uvm_test_top/environment/dmemResp/dmemResp_monitor/txn_stream
add wave -noupdate -group dmemResp_bus /hdl_top/dmemResp_bus/*



TreeUpdate [SetDefaultTree]
quietly wave cursor active 0
configure wave -namecolwidth 472
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {27 ns} {168 ns}

