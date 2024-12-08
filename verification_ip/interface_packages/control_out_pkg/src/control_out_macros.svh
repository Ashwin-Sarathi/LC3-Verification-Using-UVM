//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This file contains macros used with the control_out package.
//   These macros include packed struct definitions.  These structs are
//   used to pass data between classes, hvl, and BFM's, hdl.  Use of 
//   structs are more efficient and simpler to modify.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_struct
//      and from_struct methods defined in the macros below that are used in  
//      the control_out_configuration class.
//
  `define control_out_CONFIGURATION_STRUCT \
typedef struct packed  { \
     uvmf_active_passive_t active_passive; \
     uvmf_initiator_responder_t initiator_responder; \
     } control_out_configuration_s;

  `define control_out_CONFIGURATION_TO_STRUCT_FUNCTION \
  virtual function control_out_configuration_s to_struct();\
    control_out_configuration_struct = \
       {\
       this.active_passive,\
       this.initiator_responder\
       };\
    return ( control_out_configuration_struct );\
  endfunction

  `define control_out_CONFIGURATION_FROM_STRUCT_FUNCTION \
  virtual function void from_struct(control_out_configuration_s control_out_configuration_struct);\
      {\
      this.active_passive,\
      this.initiator_responder  \
      } = control_out_configuration_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_monitor_struct
//      and from_monitor_struct methods of the control_out_transaction class.
//
  `define control_out_MONITOR_STRUCT typedef struct packed  { \
  bit enable_updatePC ; \
  bit enable_fetch ; \
  bit enable_decode ; \
  bit enable_execute ; \
  bit enable_writeback ; \
  bit br_taken ; \
  bit bypass_alu_1 ; \
  bit bypass_alu_2 ; \
  bit bypass_mem_1 ; \
  bit bypass_mem_2 ; \
  bit [1:0] mem_state ; \
     } control_out_monitor_s;

  `define control_out_TO_MONITOR_STRUCT_FUNCTION \
  virtual function control_out_monitor_s to_monitor_struct();\
    control_out_monitor_struct = \
            { \
            this.enable_updatePC , \
            this.enable_fetch , \
            this.enable_decode , \
            this.enable_execute , \
            this.enable_writeback , \
            this.br_taken , \
            this.bypass_alu_1 , \
            this.bypass_alu_2 , \
            this.bypass_mem_1 , \
            this.bypass_mem_2 , \
            this.mem_state  \
            };\
    return ( control_out_monitor_struct);\
  endfunction\

  `define control_out_FROM_MONITOR_STRUCT_FUNCTION \
  virtual function void from_monitor_struct(control_out_monitor_s control_out_monitor_struct);\
            {\
            this.enable_updatePC , \
            this.enable_fetch , \
            this.enable_decode , \
            this.enable_execute , \
            this.enable_writeback , \
            this.br_taken , \
            this.bypass_alu_1 , \
            this.bypass_alu_2 , \
            this.bypass_mem_1 , \
            this.bypass_mem_2 , \
            this.mem_state  \
            } = control_out_monitor_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_initiator_struct
//      and from_initiator_struct methods of the control_out_transaction class.
//      Also update the comments in the driver BFM.
//
  `define control_out_INITIATOR_STRUCT typedef struct packed  { \
  bit enable_updatePC ; \
  bit enable_fetch ; \
  bit enable_decode ; \
  bit enable_execute ; \
  bit enable_writeback ; \
  bit br_taken ; \
  bit bypass_alu_1 ; \
  bit bypass_alu_2 ; \
  bit bypass_mem_1 ; \
  bit bypass_mem_2 ; \
  bit [1:0] mem_state ; \
     } control_out_initiator_s;

  `define control_out_TO_INITIATOR_STRUCT_FUNCTION \
  virtual function control_out_initiator_s to_initiator_struct();\
    control_out_initiator_struct = \
           {\
           this.enable_updatePC , \
           this.enable_fetch , \
           this.enable_decode , \
           this.enable_execute , \
           this.enable_writeback , \
           this.br_taken , \
           this.bypass_alu_1 , \
           this.bypass_alu_2 , \
           this.bypass_mem_1 , \
           this.bypass_mem_2 , \
           this.mem_state  \
           };\
    return ( control_out_initiator_struct);\
  endfunction

  `define control_out_FROM_INITIATOR_STRUCT_FUNCTION \
  virtual function void from_initiator_struct(control_out_initiator_s control_out_initiator_struct);\
           {\
           this.enable_updatePC , \
           this.enable_fetch , \
           this.enable_decode , \
           this.enable_execute , \
           this.enable_writeback , \
           this.br_taken , \
           this.bypass_alu_1 , \
           this.bypass_alu_2 , \
           this.bypass_mem_1 , \
           this.bypass_mem_2 , \
           this.mem_state  \
           } = control_out_initiator_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_responder_struct
//      and from_responder_struct methods of the control_out_transaction class.
//      Also update the comments in the driver BFM.
//
  `define control_out_RESPONDER_STRUCT typedef struct packed  { \
  bit enable_updatePC ; \
  bit enable_fetch ; \
  bit enable_decode ; \
  bit enable_execute ; \
  bit enable_writeback ; \
  bit br_taken ; \
  bit bypass_alu_1 ; \
  bit bypass_alu_2 ; \
  bit bypass_mem_1 ; \
  bit bypass_mem_2 ; \
  bit [1:0] mem_state ; \
     } control_out_responder_s;

  `define control_out_TO_RESPONDER_STRUCT_FUNCTION \
  virtual function control_out_responder_s to_responder_struct();\
    control_out_responder_struct = \
           {\
           this.enable_updatePC , \
           this.enable_fetch , \
           this.enable_decode , \
           this.enable_execute , \
           this.enable_writeback , \
           this.br_taken , \
           this.bypass_alu_1 , \
           this.bypass_alu_2 , \
           this.bypass_mem_1 , \
           this.bypass_mem_2 , \
           this.mem_state  \
           };\
    return ( control_out_responder_struct);\
  endfunction

  `define control_out_FROM_RESPONDER_STRUCT_FUNCTION \
  virtual function void from_responder_struct(control_out_responder_s control_out_responder_struct);\
           {\
           this.enable_updatePC , \
           this.enable_fetch , \
           this.enable_decode , \
           this.enable_execute , \
           this.enable_writeback , \
           this.br_taken , \
           this.bypass_alu_1 , \
           this.bypass_alu_2 , \
           this.bypass_mem_1 , \
           this.bypass_mem_2 , \
           this.mem_state  \
           } = control_out_responder_struct;\
  endfunction
// pragma uvmf custom additional begin
// pragma uvmf custom additional end
