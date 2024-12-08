//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//                                          
// DESCRIPTION: This file contains environment level sequences that will
//    be reused from block to top level simulations.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class lc3_env_sequence_base #( 
      type CONFIG_T
      ) extends uvmf_virtual_sequence_base #(.CONFIG_T(CONFIG_T));


  `uvm_object_param_utils( lc3_env_sequence_base #(
                           CONFIG_T
                           ) );

  
// This lc3_env_sequence_base contains a handle to a lc3_env_configuration object 
// named configuration.  This configuration variable contains a handle to each 
// sequencer within each agent within this environment and any sub-environments.
// The configuration object handle is automatically assigned in the pre_body in the
// base class of this sequence.  The configuration handle is retrieved from the
// virtual sequencer that this sequence is started on.
// Available sequencer handles within the environment configuration:

  // Initiator agent sequencers in lc3_environment:
    // configuration.imemResp_config.sequencer
    // configuration.dmemResp_config.sequencer

  // Responder agent sequencers in lc3_environment:

  // Virtual sequencers in sub-environments located in sub-environment configuration
    // configuration.fetchEnv_config.vsqr
    // configuration.decodeEnv_config.vsqr
    // configuration.writebackEnv_config.vsqr
    // configuration.memaccessEnv_config.vsqr
    // configuration.controlEnv_config.vsqr
    // configuration.executeEnv_config.vsqr

//     typedef imem_responder_sequence imemResp_responder_sequence_t;
//     imemResp_responder_sequence_t imemResp_resp_seq;

//     typedef dmem_responder_sequence dmemResp_responder_sequence_t;
//     dmemResp_responder_sequence_t dmemResp_resp_seq;


// This example shows how to use the environment sequence base for sub-environments
// It can only be used on environments generated with UVMF_2022.3 and later.
// Environment sequences generated with UVMF_2022.1 and earlier do not have the required 
//    environment level virtual sequencer
typedef fetch_env_sequence_base #(
        .CONFIG_T(fetch_env_configuration)
        ) 
        fetchEnv_sequence_base_t;
rand fetchEnv_sequence_base_t fetchEnv_seq;

typedef decode_env_sequence_base #(
        .CONFIG_T(decode_env_configuration)
        ) 
        decodeEnv_sequence_base_t;
rand decodeEnv_sequence_base_t decodeEnv_seq;

typedef writeback_env_sequence_base #(
        .CONFIG_T(writeback_env_configuration)
        ) 
        writebackEnv_sequence_base_t;
rand writebackEnv_sequence_base_t writebackEnv_seq;

typedef memaccess_env_sequence_base #(
        .CONFIG_T(memaccess_env_configuration)
        ) 
        memaccessEnv_sequence_base_t;
rand memaccessEnv_sequence_base_t memaccessEnv_seq;

typedef control_env_sequence_base #(
        .CONFIG_T(control_env_configuration)
        ) 
        controlEnv_sequence_base_t;
rand controlEnv_sequence_base_t controlEnv_seq;

typedef execute_env_sequence_base #(
        .CONFIG_T(execute_env_configuration)
        ) 
        executeEnv_sequence_base_t;
rand executeEnv_sequence_base_t executeEnv_seq;



  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end
  
  function new(string name = "" );
    super.new(name);
//     imemResp_resp_seq = imemResp_responder_sequence_t::type_id::create("imemResp_resp_seq");
//     dmemResp_resp_seq = dmemResp_responder_sequence_t::type_id::create("dmemResp_resp_seq");

    fetchEnv_seq = fetchEnv_sequence_base_t::type_id::create("fetchEnv_seq");
    decodeEnv_seq = decodeEnv_sequence_base_t::type_id::create("decodeEnv_seq");
    writebackEnv_seq = writebackEnv_sequence_base_t::type_id::create("writebackEnv_seq");
    memaccessEnv_seq = memaccessEnv_sequence_base_t::type_id::create("memaccessEnv_seq");
    controlEnv_seq = controlEnv_sequence_base_t::type_id::create("controlEnv_seq");
    executeEnv_seq = executeEnv_sequence_base_t::type_id::create("executeEnv_seq");

  endfunction

  virtual task body();

  
    // if ( configuration.imemResp_config.sequencer != null )
    //    repeat (25) imemResp_rand_seq.start(configuration.imemResp_config.sequencer);
    // if ( configuration.dmemResp_config.sequencer != null )
    //    repeat (25) dmemResp_rand_seq.start(configuration.dmemResp_config.sequencer);

    fetchEnv_seq.start(configuration.fetchEnv_config.vsqr);
    decodeEnv_seq.start(configuration.decodeEnv_config.vsqr);
    writebackEnv_seq.start(configuration.writebackEnv_config.vsqr);
    memaccessEnv_seq.start(configuration.memaccessEnv_config.vsqr);
    controlEnv_seq.start(configuration.controlEnv_config.vsqr);
    executeEnv_seq.start(configuration.executeEnv_config.vsqr);

  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

