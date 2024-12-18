//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//                                          
// DESCRIPTION: THis is the configuration for the lc3 environment.
//  it contains configuration classes for each agent.  It also contains
//  environment level configuration variables.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class lc3_env_configuration 
extends uvmf_environment_configuration_base;

  `uvm_object_utils( lc3_env_configuration )


//Constraints for the configuration variables:


  covergroup lc3_configuration_cg;
    // pragma uvmf custom covergroup begin
    option.auto_bin_max=1024;
    // pragma uvmf custom covergroup end
  endgroup

typedef fetch_env_configuration fetchEnv_config_t;
rand fetchEnv_config_t fetchEnv_config;

typedef decode_env_configuration decodeEnv_config_t;
rand decodeEnv_config_t decodeEnv_config;

typedef writeback_env_configuration writebackEnv_config_t;
rand writebackEnv_config_t writebackEnv_config;

typedef memaccess_env_configuration memaccessEnv_config_t;
rand memaccessEnv_config_t memaccessEnv_config;

typedef control_env_configuration controlEnv_config_t;
rand controlEnv_config_t controlEnv_config;

typedef execute_env_configuration executeEnv_config_t;
rand executeEnv_config_t executeEnv_config;


    typedef imem_configuration imemResp_config_t;
    rand imemResp_config_t imemResp_config;

    typedef dmem_configuration dmemResp_config_t;
    rand dmemResp_config_t dmemResp_config;


    string                fetchEnv_interface_names[];
    uvmf_active_passive_t fetchEnv_interface_activity[];
    string                decodeEnv_interface_names[];
    uvmf_active_passive_t decodeEnv_interface_activity[];
    string                writebackEnv_interface_names[];
    uvmf_active_passive_t writebackEnv_interface_activity[];
    string                memaccessEnv_interface_names[];
    uvmf_active_passive_t memaccessEnv_interface_activity[];
    string                controlEnv_interface_names[];
    uvmf_active_passive_t controlEnv_interface_activity[];
    string                executeEnv_interface_names[];
    uvmf_active_passive_t executeEnv_interface_activity[];


  typedef uvmf_virtual_sequencer_base #(.CONFIG_T(lc3_env_configuration)) lc3_vsqr_t;
  lc3_vsqr_t vsqr;

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

// ****************************************************************************
// FUNCTION : new()
// This function is the standard SystemVerilog constructor.
// This function constructs the configuration object for each agent in the environment.
//
  function new( string name = "" );
    super.new( name );

   fetchEnv_config = fetchEnv_config_t::type_id::create("fetchEnv_config");
   decodeEnv_config = decodeEnv_config_t::type_id::create("decodeEnv_config");
   writebackEnv_config = writebackEnv_config_t::type_id::create("writebackEnv_config");
   memaccessEnv_config = memaccessEnv_config_t::type_id::create("memaccessEnv_config");
   controlEnv_config = controlEnv_config_t::type_id::create("controlEnv_config");
   executeEnv_config = executeEnv_config_t::type_id::create("executeEnv_config");

    imemResp_config = imemResp_config_t::type_id::create("imemResp_config");
    dmemResp_config = dmemResp_config_t::type_id::create("dmemResp_config");


    lc3_configuration_cg=new;
    // `uvm_warning("COVERAGE_MODEL_REVIEW", "A covergroup has been constructed which may need review because of either generation or re-generation with merging.  Please note that configuration variables added as a result of re-generation and merging are not automatically added to the covergroup.  Remove this warning after the covergroup has been reviewed.")

  // pragma uvmf custom new begin
  // pragma uvmf custom new end
  endfunction

// ****************************************************************************
// FUNCTION : set_vsqr()
// This function is used to assign the vsqr handle.
  virtual function void set_vsqr( lc3_vsqr_t vsqr);
     this.vsqr = vsqr;
  endfunction : set_vsqr

// ****************************************************************************
// FUNCTION: post_randomize()
// This function is automatically called after the randomize() function 
// is executed.
//
  function void post_randomize();
    super.post_randomize();
    // pragma uvmf custom post_randomize begin
    // pragma uvmf custom post_randomize end
  endfunction
  
// ****************************************************************************
// FUNCTION: convert2string()
// This function converts all variables in this class to a single string for
// logfile reporting. This function concatenates the convert2string result for
// each agent configuration in this configuration class.
//
  virtual function string convert2string();
    // pragma uvmf custom convert2string begin
    return {
     
     "\n", imemResp_config.convert2string,
     "\n", dmemResp_config.convert2string,
     "\n", fetchEnv_config.convert2string,
     "\n", decodeEnv_config.convert2string,
     "\n", writebackEnv_config.convert2string,
     "\n", memaccessEnv_config.convert2string,
     "\n", controlEnv_config.convert2string,
     "\n", executeEnv_config.convert2string

       };
    // pragma uvmf custom convert2string end
  endfunction
// ****************************************************************************
// FUNCTION: initialize();
// This function configures each interface agents configuration class.  The 
// sim level determines the active/passive state of the agent.  The environment_path
// identifies the hierarchy down to and including the instantiation name of the
// environment for this configuration class.  Each instance of the environment 
// has its own configuration class.  The string interface names are used by 
// the agent configurations to identify the virtual interface handle to pull from
// the uvm_config_db.  
//
  function void initialize(uvmf_sim_level_t sim_level, 
                                      string environment_path,
                                      string interface_names[],
                                      uvm_reg_block register_model = null,
                                      uvmf_active_passive_t interface_activity[] = {}
                                     );

    super.initialize(sim_level, environment_path, interface_names, register_model, interface_activity);

  // Interface initialization for sub-environments
    fetchEnv_interface_names    = new[2];
    fetchEnv_interface_activity = new[2];

    fetchEnv_interface_names     = interface_names[0:1];
    fetchEnv_interface_activity  = interface_activity[0:1];
    decodeEnv_interface_names    = new[2];
    decodeEnv_interface_activity = new[2];

    decodeEnv_interface_names     = interface_names[2:3];
    decodeEnv_interface_activity  = interface_activity[2:3];
    writebackEnv_interface_names    = new[2];
    writebackEnv_interface_activity = new[2];

    writebackEnv_interface_names     = interface_names[4:5];
    writebackEnv_interface_activity  = interface_activity[4:5];
    memaccessEnv_interface_names    = new[2];
    memaccessEnv_interface_activity = new[2];

    memaccessEnv_interface_names     = interface_names[6:7];
    memaccessEnv_interface_activity  = interface_activity[6:7];
    controlEnv_interface_names    = new[2];
    controlEnv_interface_activity = new[2];

    controlEnv_interface_names     = interface_names[8:9];
    controlEnv_interface_activity  = interface_activity[8:9];
    executeEnv_interface_names    = new[2];
    executeEnv_interface_activity = new[2];

    executeEnv_interface_names     = interface_names[10:11];
    executeEnv_interface_activity  = interface_activity[10:11];


  // Interface initialization for local agents
     imemResp_config.initialize( interface_activity[12], {environment_path,".imemResp"}, interface_names[12]);
     imemResp_config.initiator_responder = RESPONDER;
     // imemResp_config.has_coverage = 1;
     dmemResp_config.initialize( interface_activity[13], {environment_path,".dmemResp"}, interface_names[13]);
     dmemResp_config.initiator_responder = RESPONDER;
     // dmemResp_config.has_coverage = 1;


     fetchEnv_config.initialize( sim_level, {environment_path,".fetchEnv"}, fetchEnv_interface_names, null,   fetchEnv_interface_activity);
     decodeEnv_config.initialize( sim_level, {environment_path,".decodeEnv"}, decodeEnv_interface_names, null,   decodeEnv_interface_activity);
     writebackEnv_config.initialize( sim_level, {environment_path,".writebackEnv"}, writebackEnv_interface_names, null,   writebackEnv_interface_activity);
     memaccessEnv_config.initialize( sim_level, {environment_path,".memaccessEnv"}, memaccessEnv_interface_names, null,   memaccessEnv_interface_activity);
     controlEnv_config.initialize( sim_level, {environment_path,".controlEnv"}, controlEnv_interface_names, null,   controlEnv_interface_activity);
     executeEnv_config.initialize( sim_level, {environment_path,".executeEnv"}, executeEnv_interface_names, null,   executeEnv_interface_activity);



  // pragma uvmf custom initialize begin
  // pragma uvmf custom initialize end

  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

