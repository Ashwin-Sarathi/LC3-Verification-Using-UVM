//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: 
// This file contains defines and typedefs to be compiled for use in
// the simulation running on the emulator when using Veloce.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
                                                                               

typedef enum bit [3:0] {ADD=4'b0001, AND=4'b0101, NOT=4'b1001, LD=4'b0010, LDR=4'b0110, LDI=4'b1010, LEA=4'b1110, ST=4'b0011, STR=4'b0111, STI=4'b1011, BR=4'b0000, JMP=4'b1100} opcode_d;
typedef bit [5:0] E_control_t;
typedef bit [15:0] IR_t;
typedef bit [15:0] npc_in_t;
typedef bit bypass_alu_1_t;
typedef bit bypass_alu_2_t;
typedef bit bypass_mem_1_t;
typedef bit bypass_mem_2_t;
typedef bit [15:0] VSR1_t;
typedef bit [15:0] VSR2_t;
typedef bit [1:0] W_Control_in_t;
typedef bit Mem_Control_in_t;
typedef bit enable_execute_t;
typedef bit [15:0] Mem_Bypass_Val_t;

// pragma uvmf custom additional begin
// pragma uvmf custom additional end

