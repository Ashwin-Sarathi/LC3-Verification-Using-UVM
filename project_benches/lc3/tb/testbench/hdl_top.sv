//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------                     
//               
// Description: This top level module instantiates all synthesizable
//    static content.  This and tb_top.sv are the two top level modules
//    of the simulation.  
//
//    This module instantiates the following:
//        DUT: The Design Under Test
//        Interfaces:  Signal bundles that contain signals connected to DUT
//        Driver BFM's: BFM's that actively drive interface signals
//        Monitor BFM's: BFM's that passively monitor interface signals
//
//----------------------------------------------------------------------

//----------------------------------------------------------------------
//

module hdl_top;

import lc3_parameters_pkg::*;
import uvmf_base_pkg_hdl::*;

  // pragma attribute hdl_top partition_module_xrtl                                            
// pragma uvmf custom clock_generator begin
  bit clk;
  // Instantiate a clk driver 
  // tbx clkgen
  initial begin
    clk = 0;
    #20ns;
    forever begin
      clk = ~clk;
      #5ns;
    end
  end
// pragma uvmf custom clock_generator end

// pragma uvmf custom reset_generator begin
  bit rst;
  // Instantiate a rst driver
  // tbx clkgen
  initial begin
    rst = 1; 
    #50ns;
    rst =  0; 
  end
// pragma uvmf custom reset_generator end

  // pragma uvmf custom module_item_additional begin
  // pragma uvmf custom module_item_additional end


   // tri [15:0] pc;
   // tri  instrmem_rd;
   // tri [15:0] instr_dout;
   // tri [15:0] DMem_addr;
   // tri  DMem_rd;
   // tri [15:0] DMem_din;
   // tri  complete_data;
   // tri  complete_instr;
   // tri [15:0] Data_dout;

   reg enable_execute;
   wire delayed_enable_execute;
   reg enable_decode;
   wire delayed_enable_decode;
   reg [1:0] dmem;
   wire [1:0] delayed_dmem;
   reg enable_fetch;
   wire delayed_enable_fetch;
   reg enable_updatePC;
   wire delayed_enable_updatePC;
   reg imem;
   wire delayed_imem;

  always @(posedge clk)
	begin
		enable_execute <= lc3.enable_execute;
      enable_decode <= lc3.enable_decode; 
		dmem <= lc3.mem_state;
		enable_fetch <= lc3.enable_fetch;
      enable_updatePC <= lc3.enable_updatePC;
		imem <= lc3.instrmem_rd;
	end
	
	assign delayed_enable_execute = enable_execute;
   assign delayed_enable_decode = enable_decode;
	assign delayed_dmem = dmem;
	assign delayed_enable_fetch = enable_fetch;
   assign delayed_enable_updatePC = enable_updatePC;
	assign delayed_imem = imem;
  
  // Instantiate the signal bundle, monitor bfm and driver bfm for each interface.
  // The signal bundle, _if, contains signals to be connected to the DUT.
  // The monitor, monitor_bfm, observes the bus, _if, and captures transactions.
  // The driver, driver_bfm, drives transactions onto the bus, _if.
  fetch_in_if  fetchEnv_fetch_in_agent_bus(
     // pragma uvmf custom fetchEnv_fetch_in_agent_bus_connections begin
     .clock(clk), .reset(rst), .enable_updatePC(lc3.enable_updatePC), .enable_fetch(lc3.enable_fetch), .taddr(lc3.pcout), .br_taken(lc3.br_taken)
     // pragma uvmf custom fetchEnv_fetch_in_agent_bus_connections end
     );
  fetch_out_if  fetchEnv_fetch_out_agent_bus(
     // pragma uvmf custom fetchEnv_fetch_out_agent_bus_connections begin
     .clock(clk), .reset(rst), .npc(lc3.npc_out_fetch), .pc(lc3.pc), .instrmem_rd(delayed_imem), .enable_fetch(delayed_enable_fetch), .enable_updatePC(delayed_enable_updatePC)
     // pragma uvmf custom fetchEnv_fetch_out_agent_bus_connections end
     );
  decode_in_if  decodeEnv_decode_in_agent_bus(
     // pragma uvmf custom decodeEnv_decode_in_agent_bus_connections begin
     .clock(clk), .reset(rst), .npc_in(lc3.npc_out_fetch), .enable_decode(lc3.enable_decode), .Instr_dout(lc3.Instr_dout), .psr()
     // pragma uvmf custom decodeEnv_decode_in_agent_bus_connections end
     );
  decode_out_if  decodeEnv_decode_out_agent_bus(
     // pragma uvmf custom decodeEnv_decode_out_agent_bus_connections begin
     .clock(clk), .reset(rst), .IR(lc3.IR), .E_Control(lc3.E_Control), .npc_out(lc3.npc_out_dec), .Mem_Control(lc3.Mem_Control), .W_Control(lc3.W_Control), .enable_decode(delayed_enable_decode)
     // pragma uvmf custom decodeEnv_decode_out_agent_bus_connections end
     );
  writeback_in_if  writebackEnv_writeback_in_agent_bus(
     // pragma uvmf custom writebackEnv_writeback_in_agent_bus_connections begin
     .clock(clk), .reset(rst), .enable_writeback(lc3.enable_writeback), .aluout(lc3.aluout), .memout(lc3.memout), .sr1(lc3.sr1), .sr2(lc3.sr2), .dr(lc3.dr), .npc(lc3.npc_out_dec), .pcout(lc3.pcout), .W_control(lc3.W_Control_out)
     // pragma uvmf custom writebackEnv_writeback_in_agent_bus_connections end
     );
  writeback_out_if  writebackEnv_writeback_out_agent_bus(
     // pragma uvmf custom writebackEnv_writeback_out_agent_bus_connections begin
     .clock(clk), .reset(rst), .psr(lc3.psr), .VSR1(lc3.VSR1), .VSR2(lc3.VSR2), .enableWB_status(lc3.enable_writeback)
     // pragma uvmf custom writebackEnv_writeback_out_agent_bus_connections end
     );
  memaccess_in_if  memaccessEnv_memaccess_in_agent_bus(
     // pragma uvmf custom memaccessEnv_memaccess_in_agent_bus_connections begin
     .clock(clk), .reset(rst), .mem_state(lc3.mem_state), .M_Control(lc3.Mem_Control_out), .M_Data(lc3.M_Data), .M_addr(lc3.pcout), .DMem_dout(lc3.Data_dout)
     // pragma uvmf custom memaccessEnv_memaccess_in_agent_bus_connections end
     );
  memaccess_out_if  memaccessEnv_memaccess_out_agent_bus(
     // pragma uvmf custom memaccessEnv_memaccess_out_agent_bus_connections begin
     .clock(clk), .reset(rst), .DMem_addr(lc3.Data_addr), .DMem_rd(lc3.Data_rd), .DMem_din(lc3.Data_din), .memout(lc3.memout)
     // pragma uvmf custom memaccessEnv_memaccess_out_agent_bus_connections end
     );
  control_in_if  controlEnv_control_in_agent_bus(
     // pragma uvmf custom controlEnv_control_in_agent_bus_connections begin
     .clock(clk), .reset(rst), .complete_data(lc3.complete_data), .complete_instr(lc3.complete_instr), .IR(lc3.IR), .psr(lc3.psr), .IR_Exec(lc3.IR_Exec), .IMem_dout(lc3.Instr_dout), .NZP(lc3.NZP)
     // pragma uvmf custom controlEnv_control_in_agent_bus_connections end
     );
  control_out_if  controlEnv_control_out_agent_bus(
     // pragma uvmf custom controlEnv_control_out_agent_bus_connections begin
     .clock(clk), .reset(rst), .enable_updatePC(lc3.enable_updatePC), .enable_fetch(lc3.enable_fetch), .enable_decode(lc3.enable_decode), .enable_execute(lc3.enable_execute), .enable_writeback(lc3.enable_writeback), .br_taken(lc3.br_taken), .bypass_alu_1(lc3.bypass_alu_1), .bypass_alu_2(lc3.bypass_alu_2), .bypass_mem_1(lc3.bypass_mem_1), .bypass_mem_2(lc3.bypass_mem_2), .mem_state(lc3.mem_state)
     // pragma uvmf custom controlEnv_control_out_agent_bus_connections end
     );
  execute_in_if  executeEnv_execute_in_agent_bus(
     // pragma uvmf custom executeEnv_execute_in_agent_bus_connections begin
     .clock(clk), .reset(rst), .E_control(lc3.E_Control), .IR(lc3.IR), .npc_in(lc3.npc_out_dec), .bypass_alu_1(lc3.bypass_alu_1), .bypass_alu_2(lc3.bypass_alu_2), .bypass_mem_1(lc3.bypass_mem_1), .bypass_mem_2(lc3.bypass_mem_2), .VSR1(lc3.VSR1), .VSR2(lc3.VSR2), .W_Control_in(lc3.W_Control), .Mem_Control_in(lc3.Mem_Control), .enable_execute(lc3.enable_execute), .Mem_Bypass_Val(lc3.memout)
     // pragma uvmf custom executeEnv_execute_in_agent_bus_connections end
     );
  execute_out_if  executeEnv_execute_out_agent_bus(
     // pragma uvmf custom executeEnv_execute_out_agent_bus_connections begin
     .clock(clk), .reset(rst), .W_Control_out(lc3.W_Control_out), .Mem_Control_out(lc3.Mem_Control_out), .sr1(lc3.sr1), .sr2(lc3.sr2), .dr(lc3.dr), .NZP(lc3.NZP), .aluout(lc3.aluout), .pcout(lc3.pcout), .M_Data(lc3.M_Data), .IR_Exec(lc3.IR_Exec), .enable_execute(delayed_enable_execute)
     // pragma uvmf custom executeEnv_execute_out_agent_bus_connections end
     );
  imem_if  imemResp_bus(
     // pragma uvmf custom imemResp_bus_connections begin
     .clock(clk), .reset(rst), .PC(lc3.pc), .instrmem_rd(lc3.instrmem_rd), .instr_dout(lc3.Instr_dout), .complete_instr(lc3.complete_instr)
     // pragma uvmf custom imemResp_bus_connections end
     );
  dmem_if  dmemResp_bus(
     // pragma uvmf custom dmemResp_bus_connections begin
     .clock(clk), .reset(rst), .complete_data(lc3.complete_data), .Data_dout(lc3.Data_dout), .Data_din(lc3.Data_din), .Data_rd(lc3.Data_rd), .Data_addr(lc3.Data_addr)
     // pragma uvmf custom dmemResp_bus_connections end
     );
  fetch_in_monitor_bfm  fetchEnv_fetch_in_agent_mon_bfm(fetchEnv_fetch_in_agent_bus);
  fetch_out_monitor_bfm  fetchEnv_fetch_out_agent_mon_bfm(fetchEnv_fetch_out_agent_bus);
  decode_in_monitor_bfm  decodeEnv_decode_in_agent_mon_bfm(decodeEnv_decode_in_agent_bus);
  decode_out_monitor_bfm  decodeEnv_decode_out_agent_mon_bfm(decodeEnv_decode_out_agent_bus);
  writeback_in_monitor_bfm  writebackEnv_writeback_in_agent_mon_bfm(writebackEnv_writeback_in_agent_bus);
  writeback_out_monitor_bfm  writebackEnv_writeback_out_agent_mon_bfm(writebackEnv_writeback_out_agent_bus);
  memaccess_in_monitor_bfm  memaccessEnv_memaccess_in_agent_mon_bfm(memaccessEnv_memaccess_in_agent_bus);
  memaccess_out_monitor_bfm  memaccessEnv_memaccess_out_agent_mon_bfm(memaccessEnv_memaccess_out_agent_bus);
  control_in_monitor_bfm  controlEnv_control_in_agent_mon_bfm(controlEnv_control_in_agent_bus);
  control_out_monitor_bfm  controlEnv_control_out_agent_mon_bfm(controlEnv_control_out_agent_bus);
  execute_in_monitor_bfm  executeEnv_execute_in_agent_mon_bfm(executeEnv_execute_in_agent_bus);
  execute_out_monitor_bfm  executeEnv_execute_out_agent_mon_bfm(executeEnv_execute_out_agent_bus);
  imem_monitor_bfm  imemResp_mon_bfm(imemResp_bus.monitor_port);
  dmem_monitor_bfm  dmemResp_mon_bfm(dmemResp_bus.monitor_port);
  imem_driver_bfm  imemResp_drv_bfm(imemResp_bus.responder_port);
  dmem_driver_bfm  dmemResp_drv_bfm(dmemResp_bus.responder_port);

  // pragma uvmf custom dut_instantiation begin
  // UVMF_CHANGE_ME : Add DUT and connect to signals in _bus interfaces listed above
  // Instantiate your DUT here
  // These DUT's instantiated to show verilog and vhdl instantiation
//   verilog_dut         dut_verilog(   .clk(clk), .rst(rst), .in_signal(vhdl_to_verilog_signal), .out_signal(verilog_to_vhdl_signal));
//   vhdl_dut            dut_vhdl   (   .clk(clk), .rst(rst), .in_signal(verilog_to_vhdl_signal), .out_signal(vhdl_to_verilog_signal));
      LC3 lc3(
            .clock(clk), 
            .reset(rst), 
            .complete_instr(imemResp_bus.complete_instr), 
            .complete_data(dmemResp_bus.complete_data),  
            .Instr_dout(imemResp_bus.instr_dout),
            .Data_dout(dmemResp_bus.Data_dout),   
            .instrmem_rd(imemResp_bus.instrmem_rd),
            .pc(imemResp_bus.PC),
            .Data_din(dmemResp_bus.Data_din),
            .Data_addr(dmemResp_bus.Data_addr), 
            .Data_rd(dmemResp_bus.Data_rd)	
      );
   // LC3 lc3(.clock(clk), .reset(rst), .pc(imemResp_bus.PC), .instrmem_rd(imemResp_bus.instrmem_rd), .Instr_dout(imemResp_bus.instr_dout), .Data_addr(dmemResp_bus.Data_addr), .complete_instr(imemResp_bus.complete_instr), .complete_data(dmemResp_bus.complete_data), .Data_din(dmemResp_bus.Data_din), .Data_dout(dmemResp_bus.Data_dout), .Data_rd(dmemResp_bus.Data_rd));
  //vhdl_dut            dut_vhdl   (   .clk(clk), .rst(rst), .in_signal(verilog_to_vhdl_signal), .out_signal(vhdl_to_verilog_signal));
  // pragma uvmf custom dut_instantiation end

  initial begin      // tbx vif_binding_block 
    import uvm_pkg::uvm_config_db;
    // The monitor_bfm and driver_bfm for each interface is placed into the uvm_config_db.
    // They are placed into the uvm_config_db using the string names defined in the parameters package.
    // The string names are passed to the agent configurations by test_top through the top level configuration.
    // They are retrieved by the agents configuration class for use by the agent.
    uvm_config_db #( virtual fetch_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , fetchEnv_fetch_in_agent_BFM , fetchEnv_fetch_in_agent_mon_bfm ); 
    uvm_config_db #( virtual fetch_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , fetchEnv_fetch_out_agent_BFM , fetchEnv_fetch_out_agent_mon_bfm ); 
    uvm_config_db #( virtual decode_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , decodeEnv_decode_in_agent_BFM , decodeEnv_decode_in_agent_mon_bfm ); 
    uvm_config_db #( virtual decode_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , decodeEnv_decode_out_agent_BFM , decodeEnv_decode_out_agent_mon_bfm ); 
    uvm_config_db #( virtual writeback_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , writebackEnv_writeback_in_agent_BFM , writebackEnv_writeback_in_agent_mon_bfm ); 
    uvm_config_db #( virtual writeback_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , writebackEnv_writeback_out_agent_BFM , writebackEnv_writeback_out_agent_mon_bfm ); 
    uvm_config_db #( virtual memaccess_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , memaccessEnv_memaccess_in_agent_BFM , memaccessEnv_memaccess_in_agent_mon_bfm ); 
    uvm_config_db #( virtual memaccess_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , memaccessEnv_memaccess_out_agent_BFM , memaccessEnv_memaccess_out_agent_mon_bfm ); 
    uvm_config_db #( virtual control_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , controlEnv_control_in_agent_BFM , controlEnv_control_in_agent_mon_bfm ); 
    uvm_config_db #( virtual control_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , controlEnv_control_out_agent_BFM , controlEnv_control_out_agent_mon_bfm ); 
    uvm_config_db #( virtual execute_in_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , executeEnv_execute_in_agent_BFM , executeEnv_execute_in_agent_mon_bfm ); 
    uvm_config_db #( virtual execute_out_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , executeEnv_execute_out_agent_BFM , executeEnv_execute_out_agent_mon_bfm ); 
    uvm_config_db #( virtual imem_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , imemResp_BFM , imemResp_mon_bfm ); 
    uvm_config_db #( virtual dmem_monitor_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , dmemResp_BFM , dmemResp_mon_bfm ); 
    uvm_config_db #( virtual imem_driver_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , imemResp_BFM , imemResp_drv_bfm  );
    uvm_config_db #( virtual dmem_driver_bfm  )::set( null , UVMF_VIRTUAL_INTERFACES , dmemResp_BFM , dmemResp_drv_bfm  );
  end

endmodule

// pragma uvmf custom external begin
// pragma uvmf custom external end

