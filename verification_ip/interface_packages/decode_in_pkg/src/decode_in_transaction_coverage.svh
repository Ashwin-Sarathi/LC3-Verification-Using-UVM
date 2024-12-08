//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This class records decode_in transaction information using
//       a covergroup named decode_in_transaction_cg.  An instance of this
//       coverage component is instantiated in the uvmf_parameterized_agent
//       if the has_coverage flag is set.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class decode_in_transaction_coverage  extends uvm_subscriber #(.T(decode_in_transaction ));

  `uvm_component_utils( decode_in_transaction_coverage )

  T coverage_trans;

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end
  
  // ****************************************************************************
  covergroup decode_in_transaction_cg;
    // pragma uvmf custom covergroup begin
    // UVMF_CHANGE_ME : Add coverage bins, crosses, exclusions, etc. according to coverage needs.
    option.auto_bin_max=32;
    option.per_instance=1;
    opcode: coverpoint coverage_trans.opcode;
    mode: coverpoint coverage_trans.mode;
    // npc_in: coverpoint coverage_trans.npc_in;
    sr1: coverpoint coverage_trans.sr1;
    sr2: coverpoint coverage_trans.sr2;
    dr: coverpoint coverage_trans.dr;
    baser: coverpoint coverage_trans.baser;
    pcoffset9: coverpoint coverage_trans.pcoffset9;
    pcoffset6: coverpoint coverage_trans.pcoffset6;
    imm5: coverpoint coverage_trans.imm5;
    n: coverpoint coverage_trans.n;
    z: coverpoint coverage_trans.z;
    p: coverpoint coverage_trans.p;
    // instruction: coverpoint coverage_trans.instruction;
    // pragma uvmf custom covergroup end
  endgroup

//*********************************************************************************************
//COVERAGE
//*********************************************************************************************

  covergroup decode_in_instr_transaction_cg;
    option.auto_bin_max = 1024;
    option.per_instance = 1;

    // ----------------------------------------------
    // ALU Operation Coverage
    // ----------------------------------------------
    // Coverpoints for ALU instructions (ADD, AND, NOT)
    alu_op_add: coverpoint coverage_trans.opcode {
      bins alu_operations = {4'd1}; // ADD
    }
    alu_op_and: coverpoint coverage_trans.opcode {
      bins alu_operations = {4'd5}; // AND
    }
    alu_op_not: coverpoint coverage_trans.opcode {
      bins alu_operations = {4'd9}; // NOT
    }

    // Coverpoints for ALU operands
    alu_sr1_reg: coverpoint coverage_trans.sr1;
    alu_sr2_reg: coverpoint coverage_trans.sr2;
    alu_imm5_operand: coverpoint coverage_trans.imm5;

    // Conditional operand coverage for ADD
    add_sr1: coverpoint coverage_trans.sr1 iff (coverage_trans.opcode == 4'd1); // ADD
    add_sr2: coverpoint coverage_trans.sr2 iff (coverage_trans.opcode == 4'd1); // ADD

    // Conditional operand coverage for AND
    and_sr1: coverpoint coverage_trans.sr1 iff (coverage_trans.opcode == 4'd5); // AND
    and_sr2: coverpoint coverage_trans.sr2 iff (coverage_trans.opcode == 4'd5); // AND

    //   dest_reg: coverpoint  coverage_trans.opcode[11:9] iff (( coverage_trans.opcode[15:12] == 4'h1) || (  coverage_trans.opcode[15:12] == 4'h5) || (  coverage_trans.opcode[15:12] == 4'h9));   
    // src1_reg: coverpoint  coverage_trans.opcode[8:6] iff (( coverage_trans.opcode[15:12] == 4'h1) || ( coverage_trans.opcode[15:12] == 4'h5) || ( coverage_trans.opcode[15:12] == 4'h9));  
    // imm_bit: coverpoint  coverage_trans.opcode[5] iff (( coverage_trans.opcode[15:12] == 4'h1) || ( coverage_trans.opcode[15:12] == 4'h5));
    // src2_reg: coverpoint  coverage_trans.opcode[2:0] iff (( coverage_trans.opcode[5] == 0) && (( coverage_trans.opcode[15:12] == 4'h1) || ( coverage_trans.opcode[15:12] == 4'h5)));
    // imm5_field: coverpoint  coverage_trans.opcode[4:0] iff (( coverage_trans.opcode[5] == 1'b1) && (( coverage_trans.opcode[15:12] == 4'h1) || ( coverage_trans.opcode[15:12] == 4'h5)))
    // {
  	// 	bins zero_to_31= {[0:31]};
    // }

    // Conditional coverage for NOT operation
    alu_not_dest_source: coverpoint {coverage_trans.dr, coverage_trans.sr1} iff (coverage_trans.opcode == 4'd9) {
      option.auto_bin_max = 1;
    } //{
    //   bins not_regs[] = {[6'b000000:6'b111111]};
    //   option.auto_bin_max = 64;
    //   ignore_bins ignores2 = {0, 2, 5, 6, 10, 12, 16, 17, 21, 27, 29, 30, 31, 36, 39, 40, 42, 43, 45, 48, 49, 50, 51, 57, 61};
    // }

    // Cross coverage for NOT instruction
    not_x_sr1: cross alu_op_not, alu_sr1_reg {}

    // Additional operand coverage for ALU
    alu_sr1_cp: coverpoint coverage_trans.instruction[8:6] {
      bins valid_sr1[] = {0, 1, 2, 3, 4, 5, 6, 7};
    }
    alu_sr2_cp: coverpoint coverage_trans.instruction[8:6] {
      bins valid_sr2[] = {0, 1, 2, 3, 4, 5, 6, 7};
    }
    alu_dr_cp: coverpoint coverage_trans.instruction[11:9] {
      bins valid_dr[] = {0, 1, 2, 3, 4, 5, 6, 7};
    }
    alu_imm5_cp: coverpoint coverage_trans.instruction[4:0] iff (coverage_trans.instruction[5] == 1) {
      bins possible_imm5[] = {[5'b00000:5'b11111]};
      option.auto_bin_max = 32;
      ignore_bins ignores = {12, 16, 26, 28};
    }

    // Cross coverage for ALU operands
    alu_sr1_cross_cp: coverpoint coverage_trans.instruction[8:6] {
      bins range[2] = {0, 1, 2, 3, 4, 5, 6, 7};
    }
    alu_sr2_cross_cp: coverpoint coverage_trans.instruction[8:6] {
      bins range[2] = {0, 1, 2, 3, 4, 5, 6, 7};
    }
    alu_dr_cross_cp: coverpoint coverage_trans.instruction[11:9] {
      bins range[2] = {0, 1, 2, 3, 4, 5, 6, 7};
    }

    // ----------------------------------------------
    // Memory Operation Coverage
    // ----------------------------------------------
    // Coverpoints for memory operations (LD, LDR, LDI, LEA, ST, STR, STI)
    mem_op_ld: coverpoint coverage_trans.opcode {
      bins memory_operations = {4'd2}; // LD
    }
    mem_op_ldr: coverpoint coverage_trans.opcode {
      bins memory_operations = {4'd6}; // LDR
    }
    mem_op_ldi: coverpoint coverage_trans.opcode {
      bins memory_operations = {4'd10}; // LDI
    }
    mem_op_lea: coverpoint coverage_trans.opcode {
      bins memory_operations = {4'd14}; // LEA
    }
    mem_op_st: coverpoint coverage_trans.opcode {
      bins memory_operations = {4'd3}; // ST
    }
    mem_op_str: coverpoint coverage_trans.opcode {
      bins memory_operations = {4'd7}; // STR
    }
    mem_op_sti: coverpoint coverage_trans.opcode {
      bins memory_operations = {4'd11}; // STI
    }

    // Conditional operand coverage for memory operations
    mem_dreg: coverpoint coverage_trans.dr iff ((coverage_trans.opcode == 4'd2) || (coverage_trans.opcode == 4'd6) || (coverage_trans.opcode == 4'd10) || (coverage_trans.opcode == 4'd14)) {
      bins b_0_to_7 = {[0:7]};
    }
    mem_sreg: coverpoint coverage_trans.sr1 iff ((coverage_trans.opcode == 4'd3) || (coverage_trans.opcode == 4'd7) || (coverage_trans.opcode == 4'd11)) {
      bins b_0_to_7 = {[0:7]};
    }
    mem_baser: coverpoint coverage_trans.baser iff ((coverage_trans.opcode == 4'd6) || (coverage_trans.opcode == 4'd7)) {
      bins b_0_to_7 = {[0:7]};
    }
    mem_pcOffset6_reg: coverpoint coverage_trans.pcoffset6 iff ((coverage_trans.opcode == 4'd6) || (coverage_trans.opcode == 4'd7)) {
      bins b_0_to_63 = {[0:63]};
    }
    mem_pcOffset9_reg: coverpoint coverage_trans.pcoffset9 iff ((coverage_trans.opcode == 4'd2) || (coverage_trans.opcode == 4'd10) || (coverage_trans.opcode == 4'd14) || (coverage_trans.opcode == 4'd3) || (coverage_trans.opcode == 4'd11)) {
      bins b_0_to_511 = {[0:511]};
    }

    // Cross coverage for memory operands
    ld_x_dr: cross mem_op_ld, mem_dreg {}
    ld_x_pcoffset9: cross mem_op_ld, mem_pcOffset9_reg {}

    ldr_x_dr: cross mem_op_ldr, mem_dreg {}
    ldr_x_baser: cross mem_op_ldr, mem_baser {}
    ldr_x_pcoffset6: cross mem_op_ldr, mem_pcOffset6_reg {}

    ldi_x_dr: cross mem_op_ldi, mem_dreg {}
    ldi_x_pcoffset9: cross mem_op_ldi, mem_pcOffset9_reg {}

    st_x_sr: cross mem_op_st, mem_sreg {}
    st_x_pcoffset9: cross mem_op_st, mem_pcOffset9_reg {}

    str_x_sr: cross mem_op_str, mem_sreg {}
    str_x_baser: cross mem_op_str, mem_baser {}
    str_x_pcoffset6: cross mem_op_str, mem_pcOffset6_reg {}

    sti_x_sr: cross mem_op_sti, mem_sreg {}
    sti_x_pcoffset9: cross mem_op_sti, mem_pcOffset9_reg {}

    lea_x_dr: cross mem_op_lea, mem_dreg {}
    lea_x_pcoffset9: cross mem_op_lea, mem_pcOffset9_reg {}

    // ----------------------------------------------
    // Control Operation Coverage
    // ----------------------------------------------
    // Coverpoints for control operations (JMP, BR)
    ctrl_op_jmp: coverpoint coverage_trans.opcode {
      bins control_operations = {4'd12}; // JMP
    }
    ctrl_op_br: coverpoint coverage_trans.opcode {
      bins control_operations = {4'd0}; // BR
    }

    // Conditional operand coverage for control instructions
    ctrl_nzp: coverpoint {coverage_trans.n, coverage_trans.z, coverage_trans.p} iff (coverage_trans.opcode == 4'd0) {
      bins b_0_to_7 = {[0:7]};
    }
    ctrl_pcoffset9: coverpoint coverage_trans.pcoffset9 iff (coverage_trans.opcode == 4'd0) {
      bins b_0_to_511 = {[0:511]};
    }
    ctrl_baser: coverpoint coverage_trans.baser iff (coverage_trans.opcode == 4'd12) {
      bins b_0_to_7 = {[0:7]};
    }

    // Cross coverage for control operands
    baser_x_jmp: cross ctrl_op_jmp, ctrl_baser {}
    pcoffset9_x_br: cross ctrl_op_br, ctrl_pcoffset9 {}
    nzp_x_br: cross ctrl_op_br, ctrl_nzp {}

  endgroup

  // ****************************************************************************
  // FUNCTION : new()
  // This function is the standard SystemVerilog constructor.
  //
  function new(string name="", uvm_component parent=null);
    super.new(name,parent);
    // decode_in_transaction_cg=new;
    decode_in_instr_transaction_cg = new; 
    // `uvm_warning("COVERAGE_MODEL_REVIEW", "A covergroup has been constructed which may need review because of either generation or re-generation with merging.  Please note that transaction variables added as a result of re-generation and merging are not automatically added to the covergroup.  Remove this warning after the covergroup has been reviewed.")
  endfunction

  // ****************************************************************************
  // FUNCTION : build_phase()
  // This function is the standard UVM build_phase.
  //
  function void build_phase(uvm_phase phase);
    // decode_in_transaction_cg.set_inst_name($sformatf("decode_in_transaction_cg_%s",get_full_name()));
    decode_in_instr_transaction_cg.set_inst_name($sformatf("decode_in_instr_transaction_cg%s",get_full_name()));
  endfunction

  // ****************************************************************************
  // FUNCTION: write (T t)
  // This function is automatically executed when a transaction arrives on the
  // analysis_export.  It copies values from the variables in the transaction 
  // to local variables used to collect functional coverage.  
  //
  virtual function void write (T t);
    `uvm_info("COV","Received transaction",UVM_HIGH);
    coverage_trans = t;
    // decode_in_transaction_cg.sample();
    decode_in_instr_transaction_cg.sample(); 
  endfunction

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

