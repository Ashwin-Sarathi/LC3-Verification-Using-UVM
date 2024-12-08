//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// Description: This file contains the top level and utility sequences
//     used by test_top. It can be extended to create derivative top
//     level sequences.
//
//----------------------------------------------------------------------
//
//----------------------------------------------------------------------
//



class lc3_bench_sequence_base extends uvmf_sequence_base #(uvm_sequence_item);

  `uvm_object_utils( lc3_bench_sequence_base );

  // pragma uvmf custom sequences begin

// This example shows how to use the environment sequence base
// It can only be used on environments generated with UVMF_2022.3 and later.
// Environment sequences generated with UVMF_2022.1 and earlier do not have the required 
//    environment level virtual sequencer

// typedef lc3_env_sequence_base #(
//         .CONFIG_T(lc3_env_configuration_t)
//         )
//         lc3_env_sequence_base_t;
// rand lc3_env_sequence_base_t lc3_env_seq;



  // UVMF_CHANGE_ME : Instantiate, construct, and start sequences as needed to create stimulus scenarios.
  // Instantiate sequences here
  typedef imem_responder_sequence  imemResp_responder_seq_t;
  imemResp_responder_seq_t imemResp_resp_seq;
  typedef dmem_responder_sequence  dmemResp_responder_seq_t;
  dmemResp_responder_seq_t dmemResp_resp_seq;
  // pragma uvmf custom sequences end

  // Sequencer handles for each active interface in the environment
  typedef imem_transaction  imemResp_transaction_t;
  uvm_sequencer #(imemResp_transaction_t)  imemResp_sequencer; 
  typedef dmem_transaction  dmemResp_transaction_t;
  uvm_sequencer #(dmemResp_transaction_t)  dmemResp_sequencer; 


  // Top level environment configuration handle
  typedef lc3_env_configuration  lc3_env_configuration_t;
  lc3_env_configuration_t top_configuration;

  // Configuration handles to access interface BFM's
  fetch_in_configuration  fetchEnv_fetch_in_agent_config;
  fetch_out_configuration  fetchEnv_fetch_out_agent_config;
  decode_in_configuration  decodeEnv_decode_in_agent_config;
  decode_out_configuration  decodeEnv_decode_out_agent_config;
  writeback_in_configuration  writebackEnv_writeback_in_agent_config;
  writeback_out_configuration  writebackEnv_writeback_out_agent_config;
  memaccess_in_configuration  memaccessEnv_memaccess_in_agent_config;
  memaccess_out_configuration  memaccessEnv_memaccess_out_agent_config;
  control_in_configuration  controlEnv_control_in_agent_config;
  control_out_configuration  controlEnv_control_out_agent_config;
  execute_in_configuration  executeEnv_execute_in_agent_config;
  execute_out_configuration  executeEnv_execute_out_agent_config;
  imem_configuration  imemResp_config;
  dmem_configuration  dmemResp_config;

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  // ****************************************************************************
  function new( string name = "" );
    super.new( name );
    // Retrieve the configuration handles from the uvm_config_db

    // Retrieve top level configuration handle
    if ( !uvm_config_db#(lc3_env_configuration_t)::get(null,UVMF_CONFIGURATIONS, "TOP_ENV_CONFIG",top_configuration) ) begin
      `uvm_info("CFG", "*** FATAL *** uvm_config_db::get can not find TOP_ENV_CONFIG.  Are you using an older UVMF release than what was used to generate this bench?",UVM_NONE);
      `uvm_fatal("CFG", "uvm_config_db#(lc3_env_configuration_t)::get cannot find resource TOP_ENV_CONFIG");
    end

    // Retrieve config handles for all agents
    if( !uvm_config_db #( fetch_in_configuration )::get( null , UVMF_CONFIGURATIONS , fetchEnv_fetch_in_agent_BFM , fetchEnv_fetch_in_agent_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( fetch_in_configuration )::get cannot find resource fetchEnv_fetch_in_agent_BFM" )
    if( !uvm_config_db #( fetch_out_configuration )::get( null , UVMF_CONFIGURATIONS , fetchEnv_fetch_out_agent_BFM , fetchEnv_fetch_out_agent_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( fetch_out_configuration )::get cannot find resource fetchEnv_fetch_out_agent_BFM" )
    if( !uvm_config_db #( decode_in_configuration )::get( null , UVMF_CONFIGURATIONS , decodeEnv_decode_in_agent_BFM , decodeEnv_decode_in_agent_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( decode_in_configuration )::get cannot find resource decodeEnv_decode_in_agent_BFM" )
    if( !uvm_config_db #( decode_out_configuration )::get( null , UVMF_CONFIGURATIONS , decodeEnv_decode_out_agent_BFM , decodeEnv_decode_out_agent_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( decode_out_configuration )::get cannot find resource decodeEnv_decode_out_agent_BFM" )
    if( !uvm_config_db #( writeback_in_configuration )::get( null , UVMF_CONFIGURATIONS , writebackEnv_writeback_in_agent_BFM , writebackEnv_writeback_in_agent_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( writeback_in_configuration )::get cannot find resource writebackEnv_writeback_in_agent_BFM" )
    if( !uvm_config_db #( writeback_out_configuration )::get( null , UVMF_CONFIGURATIONS , writebackEnv_writeback_out_agent_BFM , writebackEnv_writeback_out_agent_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( writeback_out_configuration )::get cannot find resource writebackEnv_writeback_out_agent_BFM" )
    if( !uvm_config_db #( memaccess_in_configuration )::get( null , UVMF_CONFIGURATIONS , memaccessEnv_memaccess_in_agent_BFM , memaccessEnv_memaccess_in_agent_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( memaccess_in_configuration )::get cannot find resource memaccessEnv_memaccess_in_agent_BFM" )
    if( !uvm_config_db #( memaccess_out_configuration )::get( null , UVMF_CONFIGURATIONS , memaccessEnv_memaccess_out_agent_BFM , memaccessEnv_memaccess_out_agent_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( memaccess_out_configuration )::get cannot find resource memaccessEnv_memaccess_out_agent_BFM" )
    if( !uvm_config_db #( control_in_configuration )::get( null , UVMF_CONFIGURATIONS , controlEnv_control_in_agent_BFM , controlEnv_control_in_agent_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( control_in_configuration )::get cannot find resource controlEnv_control_in_agent_BFM" )
    if( !uvm_config_db #( control_out_configuration )::get( null , UVMF_CONFIGURATIONS , controlEnv_control_out_agent_BFM , controlEnv_control_out_agent_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( control_out_configuration )::get cannot find resource controlEnv_control_out_agent_BFM" )
    if( !uvm_config_db #( execute_in_configuration )::get( null , UVMF_CONFIGURATIONS , executeEnv_execute_in_agent_BFM , executeEnv_execute_in_agent_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( execute_in_configuration )::get cannot find resource executeEnv_execute_in_agent_BFM" )
    if( !uvm_config_db #( execute_out_configuration )::get( null , UVMF_CONFIGURATIONS , executeEnv_execute_out_agent_BFM , executeEnv_execute_out_agent_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( execute_out_configuration )::get cannot find resource executeEnv_execute_out_agent_BFM" )
    if( !uvm_config_db #( imem_configuration )::get( null , UVMF_CONFIGURATIONS , imemResp_BFM , imemResp_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( imem_configuration )::get cannot find resource imemResp_BFM" )
    if( !uvm_config_db #( dmem_configuration )::get( null , UVMF_CONFIGURATIONS , dmemResp_BFM , dmemResp_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( dmem_configuration )::get cannot find resource dmemResp_BFM" )

    // Assign the sequencer handles from the handles within agent configurations
    imemResp_sequencer = imemResp_config.get_sequencer();
    dmemResp_sequencer = dmemResp_config.get_sequencer();



    // pragma uvmf custom new begin
    // pragma uvmf custom new end

  endfunction

  // ****************************************************************************
  virtual task body();
    // pragma uvmf custom body begin

    // Construct sequences here

    // lc3_env_seq = lc3_env_sequence_base_t::type_id::create("lc3_env_seq");

    imemResp_resp_seq     = imemResp_responder_seq_t::type_id::create("imemResp_resp_seq");
    dmemResp_resp_seq     = dmemResp_responder_seq_t::type_id::create("dmemResp_resp_seq");
    
    fork
      fetchEnv_fetch_in_agent_config.wait_for_reset();
      fetchEnv_fetch_out_agent_config.wait_for_reset();
      decodeEnv_decode_in_agent_config.wait_for_reset();
      decodeEnv_decode_out_agent_config.wait_for_reset();
      writebackEnv_writeback_in_agent_config.wait_for_reset();
      writebackEnv_writeback_out_agent_config.wait_for_reset();
      memaccessEnv_memaccess_in_agent_config.wait_for_reset();
      memaccessEnv_memaccess_out_agent_config.wait_for_reset();
      controlEnv_control_in_agent_config.wait_for_reset();
      controlEnv_control_out_agent_config.wait_for_reset();
      executeEnv_execute_in_agent_config.wait_for_reset();
      executeEnv_execute_out_agent_config.wait_for_reset();
      imemResp_config.wait_for_reset();
      dmemResp_config.wait_for_reset();
    join
    // Start RESPONDER sequences here
    fork
      imemResp_resp_seq.start(imemResp_sequencer); 
      dmemResp_resp_seq.start(dmemResp_sequencer); 
    join_any // Chnaged it  join_none
    // Start INITIATOR sequences here
    fork
      // repeat (25) imemResp_random_seq.start(imemResp_sequencer);
      // repeat (25) dmemResp_random_seq.start(dmemResp_sequencer);
    join

    // lc3_env_seq.start(top_configuration.vsqr);

    // UVMF_CHANGE_ME : Extend the simulation XXX number of clocks after 
    // the last sequence to allow for the last sequence item to flow 
    // through the design.
    fork
      fetchEnv_fetch_in_agent_config.wait_for_num_clocks(40);
      fetchEnv_fetch_out_agent_config.wait_for_num_clocks(40);
      decodeEnv_decode_in_agent_config.wait_for_num_clocks(40);
      decodeEnv_decode_out_agent_config.wait_for_num_clocks(40);
      writebackEnv_writeback_in_agent_config.wait_for_num_clocks(40);
      writebackEnv_writeback_out_agent_config.wait_for_num_clocks(40);
      memaccessEnv_memaccess_in_agent_config.wait_for_num_clocks(40);
      memaccessEnv_memaccess_out_agent_config.wait_for_num_clocks(40);
      controlEnv_control_in_agent_config.wait_for_num_clocks(40);
      controlEnv_control_out_agent_config.wait_for_num_clocks(40);
      executeEnv_execute_in_agent_config.wait_for_num_clocks(40);
      executeEnv_execute_out_agent_config.wait_for_num_clocks(40);
      imemResp_config.wait_for_num_clocks(40);
      dmemResp_config.wait_for_num_clocks(40);
    join

    imemResp_resp_seq.disable_imem_sequence = 1'b1; 
  
    fork
      fetchEnv_fetch_in_agent_config.wait_for_num_clocks(30);
      fetchEnv_fetch_out_agent_config.wait_for_num_clocks(30);
      decodeEnv_decode_in_agent_config.wait_for_num_clocks(30);
      decodeEnv_decode_out_agent_config.wait_for_num_clocks(30);
      writebackEnv_writeback_in_agent_config.wait_for_num_clocks(30);
      writebackEnv_writeback_out_agent_config.wait_for_num_clocks(30);
      memaccessEnv_memaccess_in_agent_config.wait_for_num_clocks(30);
      memaccessEnv_memaccess_out_agent_config.wait_for_num_clocks(30);
      controlEnv_control_in_agent_config.wait_for_num_clocks(30);
      controlEnv_control_out_agent_config.wait_for_num_clocks(30);
      executeEnv_execute_in_agent_config.wait_for_num_clocks(30);
      executeEnv_execute_out_agent_config.wait_for_num_clocks(30);
      imemResp_config.wait_for_num_clocks(30);
      dmemResp_config.wait_for_num_clocks(30);
    join

    // pragma uvmf custom body end
  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

