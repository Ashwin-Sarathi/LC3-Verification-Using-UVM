//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//                                          
// DESCRIPTION: This environment contains all agents, predictors and
// scoreboards required for the block level design.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

class lc3_environment  extends uvmf_environment_base #(
    .CONFIG_T( lc3_env_configuration 
  ));
  `uvm_component_utils( lc3_environment )

  typedef fetch_environment fetchEnv_t;
  fetchEnv_t fetchEnv;
   
  typedef decode_environment decodeEnv_t;
  decodeEnv_t decodeEnv;
   
  typedef writeback_environment writebackEnv_t;
  writebackEnv_t writebackEnv;
   
  typedef memaccess_environment memaccessEnv_t;
  memaccessEnv_t memaccessEnv;
   
  typedef control_environment controlEnv_t;
  controlEnv_t controlEnv;
   
  typedef execute_environment executeEnv_t;
  executeEnv_t executeEnv;
   




  typedef imem_agent  imemResp_t;
  imemResp_t imemResp;

  typedef dmem_agent  dmemResp_t;
  dmemResp_t dmemResp;








  typedef uvmf_virtual_sequencer_base #(.CONFIG_T(lc3_env_configuration)) lc3_vsqr_t;
  lc3_vsqr_t vsqr;

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end
 
// ****************************************************************************
// FUNCTION : new()
// This function is the standard SystemVerilog constructor.
//
  function new( string name = "", uvm_component parent = null );
    super.new( name, parent );
  endfunction

// ****************************************************************************
// FUNCTION: build_phase()
// This function builds all components within this environment.
//
  virtual function void build_phase(uvm_phase phase);
// pragma uvmf custom build_phase_pre_super begin
// pragma uvmf custom build_phase_pre_super end
    super.build_phase(phase);
    fetchEnv = fetchEnv_t::type_id::create("fetchEnv",this);
    fetchEnv.set_config(configuration.fetchEnv_config);
    decodeEnv = decodeEnv_t::type_id::create("decodeEnv",this);
    decodeEnv.set_config(configuration.decodeEnv_config);
    writebackEnv = writebackEnv_t::type_id::create("writebackEnv",this);
    writebackEnv.set_config(configuration.writebackEnv_config);
    memaccessEnv = memaccessEnv_t::type_id::create("memaccessEnv",this);
    memaccessEnv.set_config(configuration.memaccessEnv_config);
    controlEnv = controlEnv_t::type_id::create("controlEnv",this);
    controlEnv.set_config(configuration.controlEnv_config);
    executeEnv = executeEnv_t::type_id::create("executeEnv",this);
    executeEnv.set_config(configuration.executeEnv_config);
    imemResp = imemResp_t::type_id::create("imemResp",this);
    imemResp.set_config(configuration.imemResp_config);
    dmemResp = dmemResp_t::type_id::create("dmemResp",this);
    dmemResp.set_config(configuration.dmemResp_config);

    vsqr = lc3_vsqr_t::type_id::create("vsqr", this);
    vsqr.set_config(configuration);
    configuration.set_vsqr(vsqr);

    // pragma uvmf custom build_phase begin
    // pragma uvmf custom build_phase end
  endfunction

// ****************************************************************************
// FUNCTION: connect_phase()
// This function makes all connections within this environment.  Connections
// typically inclue agent to predictor, predictor to scoreboard and scoreboard
// to agent.
//
  virtual function void connect_phase(uvm_phase phase);
// pragma uvmf custom connect_phase_pre_super begin
// pragma uvmf custom connect_phase_pre_super end
    super.connect_phase(phase);
    // pragma uvmf custom reg_model_connect_phase begin
    // pragma uvmf custom reg_model_connect_phase end
  endfunction

// ****************************************************************************
// FUNCTION: end_of_simulation_phase()
// This function is executed just prior to executing run_phase.  This function
// was added to the environment to sample environment configuration settings
// just before the simulation exits time 0.  The configuration structure is 
// randomized in the build phase before the environment structure is constructed.
// Configuration variables can be customized after randomization in the build_phase
// of the extended test.
// If a sequence modifies values in the configuration structure then the sequence is
// responsible for sampling the covergroup in the configuration if required.
//
  virtual function void start_of_simulation_phase(uvm_phase phase);
     configuration.lc3_configuration_cg.sample();
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

