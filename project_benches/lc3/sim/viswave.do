 

onerror resume
wave tags F0
wave update off

wave spacer -backgroundcolor Salmon { fetchEnv_fetch_in_agent }
wave add uvm_test_top.environment.fetchEnv.fetch_in_agent.fetch_in_agent_monitor.txn_stream -radix string -tag F0
wave group fetchEnv_fetch_in_agent_bus
wave add -group fetchEnv_fetch_in_agent_bus hdl_top.fetchEnv_fetch_in_agent_bus.* -radix hexadecimal -tag F0
wave group fetchEnv_fetch_in_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { fetchEnv_fetch_out_agent }
wave add uvm_test_top.environment.fetchEnv.fetch_out_agent.fetch_out_agent_monitor.txn_stream -radix string -tag F0
wave group fetchEnv_fetch_out_agent_bus
wave add -group fetchEnv_fetch_out_agent_bus hdl_top.fetchEnv_fetch_out_agent_bus.* -radix hexadecimal -tag F0
wave group fetchEnv_fetch_out_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { decodeEnv_decode_in_agent }
wave add uvm_test_top.environment.decodeEnv.decode_in_agent.decode_in_agent_monitor.txn_stream -radix string -tag F0
wave group decodeEnv_decode_in_agent_bus
wave add -group decodeEnv_decode_in_agent_bus hdl_top.decodeEnv_decode_in_agent_bus.* -radix hexadecimal -tag F0
wave group decodeEnv_decode_in_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { decodeEnv_decode_out_agent }
wave add uvm_test_top.environment.decodeEnv.decode_out_agent.decode_out_agent_monitor.txn_stream -radix string -tag F0
wave group decodeEnv_decode_out_agent_bus
wave add -group decodeEnv_decode_out_agent_bus hdl_top.decodeEnv_decode_out_agent_bus.* -radix hexadecimal -tag F0
wave group decodeEnv_decode_out_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { writebackEnv_writeback_in_agent }
wave add uvm_test_top.environment.writebackEnv.writeback_in_agent.writeback_in_agent_monitor.txn_stream -radix string -tag F0
wave group writebackEnv_writeback_in_agent_bus
wave add -group writebackEnv_writeback_in_agent_bus hdl_top.writebackEnv_writeback_in_agent_bus.* -radix hexadecimal -tag F0
wave group writebackEnv_writeback_in_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { writebackEnv_writeback_out_agent }
wave add uvm_test_top.environment.writebackEnv.writeback_out_agent.writeback_out_agent_monitor.txn_stream -radix string -tag F0
wave group writebackEnv_writeback_out_agent_bus
wave add -group writebackEnv_writeback_out_agent_bus hdl_top.writebackEnv_writeback_out_agent_bus.* -radix hexadecimal -tag F0
wave group writebackEnv_writeback_out_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { memaccessEnv_memaccess_in_agent }
wave add uvm_test_top.environment.memaccessEnv.memaccess_in_agent.memaccess_in_agent_monitor.txn_stream -radix string -tag F0
wave group memaccessEnv_memaccess_in_agent_bus
wave add -group memaccessEnv_memaccess_in_agent_bus hdl_top.memaccessEnv_memaccess_in_agent_bus.* -radix hexadecimal -tag F0
wave group memaccessEnv_memaccess_in_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { memaccessEnv_memaccess_out_agent }
wave add uvm_test_top.environment.memaccessEnv.memaccess_out_agent.memaccess_out_agent_monitor.txn_stream -radix string -tag F0
wave group memaccessEnv_memaccess_out_agent_bus
wave add -group memaccessEnv_memaccess_out_agent_bus hdl_top.memaccessEnv_memaccess_out_agent_bus.* -radix hexadecimal -tag F0
wave group memaccessEnv_memaccess_out_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { controlEnv_control_in_agent }
wave add uvm_test_top.environment.controlEnv.control_in_agent.control_in_agent_monitor.txn_stream -radix string -tag F0
wave group controlEnv_control_in_agent_bus
wave add -group controlEnv_control_in_agent_bus hdl_top.controlEnv_control_in_agent_bus.* -radix hexadecimal -tag F0
wave group controlEnv_control_in_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { controlEnv_control_out_agent }
wave add uvm_test_top.environment.controlEnv.control_out_agent.control_out_agent_monitor.txn_stream -radix string -tag F0
wave group controlEnv_control_out_agent_bus
wave add -group controlEnv_control_out_agent_bus hdl_top.controlEnv_control_out_agent_bus.* -radix hexadecimal -tag F0
wave group controlEnv_control_out_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { executeEnv_execute_in_agent }
wave add uvm_test_top.environment.executeEnv.execute_in_agent.execute_in_agent_monitor.txn_stream -radix string -tag F0
wave group executeEnv_execute_in_agent_bus
wave add -group executeEnv_execute_in_agent_bus hdl_top.executeEnv_execute_in_agent_bus.* -radix hexadecimal -tag F0
wave group executeEnv_execute_in_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { executeEnv_execute_out_agent }
wave add uvm_test_top.environment.executeEnv.execute_out_agent.execute_out_agent_monitor.txn_stream -radix string -tag F0
wave group executeEnv_execute_out_agent_bus
wave add -group executeEnv_execute_out_agent_bus hdl_top.executeEnv_execute_out_agent_bus.* -radix hexadecimal -tag F0
wave group executeEnv_execute_out_agent_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { imemResp }
wave add uvm_test_top.environment.imemResp.imemResp_monitor.txn_stream -radix string -tag F0
wave group imemResp_bus
wave add -group imemResp_bus hdl_top.imemResp_bus.* -radix hexadecimal -tag F0
wave group imemResp_bus -collapse
wave insertion [expr [wave index insertpoint] +1]
wave spacer -backgroundcolor Salmon { dmemResp }
wave add uvm_test_top.environment.dmemResp.dmemResp_monitor.txn_stream -radix string -tag F0
wave group dmemResp_bus
wave add -group dmemResp_bus hdl_top.dmemResp_bus.* -radix hexadecimal -tag F0
wave group dmemResp_bus -collapse
wave insertion [expr [wave index insertpoint] +1]



wave update on
WaveSetStreamView

