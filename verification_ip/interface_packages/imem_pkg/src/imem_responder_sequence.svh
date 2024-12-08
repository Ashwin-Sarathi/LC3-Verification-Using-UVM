//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This class can be used to provide stimulus when an interface
//              has been configured to run in a responder mode. It
//              will never finish by default, always going back to the driver
//              and driver BFM for the next transaction with which to respond.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class imem_responder_sequence 
  extends imem_sequence_base ;

  `uvm_object_utils( imem_responder_sequence )

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  bit disable_imem_sequence; 
  function new(string name = "imem_responder_sequence");
    super.new(name);
    disable_imem_sequence = 1'b0; 
  endfunction

  // static int instr_c = 0;
  // bit [2:0] reg_c= 3'b000;
  // imem_load_transaction reqx; 

  task body();
    req=imem_transaction::type_id::create("req");
    // reqx=imem_load_transaction::type_id::create("reqx");
    initalize_reg(); 

    repeat(500) begin// I have chnaged forever begin
      // if(instr_c < 30) 
      // begin
      //   instr_c++;
      //   start_item(reqx);
      //   if(!(reqx.randomize() with {instr_dout[15:12] inside{LD};})) `uvm_fatal("SEQ", "imem_random_sequence::body()-imem_transaction randomization result not as expected")
      //   reqx.instr_dout[11:9] =  reg_c;
      //   reg_c = reg_c + 3'h1;
      //   $display("%h ********************* %d",reg_c,instr_c);
      //   finish_item(reqx);
      // end 
      // else begin
      start_item(req);
      if(disable_imem_sequence == 1'b0) begin 
        if(!req.randomize()) `uvm_fatal("SEQ", "imem_random_sequence::body()-imem_transaction randomization result not as expected")
          req.complete_instr= 1; 
      end else begin 
        req.instr_dout = 0; 
        req.complete_instr=0; 
      end 
      finish_item(req);
      // pragma uvmf custom body begin
      // UVMF_CHANGE_ME : Do something here with the resulting req item.  The
      // finish_item() call above will block until the req transaction is ready
      // to be handled by the responder sequence.
      // If this was an item that required a response, the expectation is
      // that the response should be populated within this transaction now.
      `uvm_info("SEQ",$sformatf("Processed txn: %s",req.convert2string()),UVM_HIGH)
      // pragma uvmf custom body end
      end 
  endtask

  task initalize_reg();
    start_item(req);
    finish_item(req);
    req.instr_dout[15:12] = LD;
    req.dr = 3'h0;
    req.instr_dout[11:0] = {req.dr, req.pcoffset9}; //LD to R0
    req.complete_instr = 1;

    start_item(req);
    finish_item(req);
    req.instr_dout[15:12] = LD;
    req.dr = 3'h0;
    req.instr_dout[11:0] = {req.dr, 9'h0}; //LD to R0
    req.complete_instr = 1;

    start_item(req);
    finish_item(req);
    req.instr_dout[15:12] = LD;
    req.dr = 3'h1;
    req.instr_dout[11:0] = {req.dr, 9'h0}; //LD to R0
    req.complete_instr = 1;

    start_item(req);
    finish_item(req);
    req.instr_dout[15:12] = LD;
    req.dr = 3'h2;
    req.instr_dout[11:0] = {req.dr, 9'h0}; //LD to R0
    req.complete_instr = 1;

    start_item(req);
    finish_item(req);
    req.instr_dout[15:12] = LD;
    req.dr = 3'h3;
    req.instr_dout[11:0] = {req.dr, 9'h0}; //LD to R0
    req.complete_instr = 1;

    start_item(req);
    finish_item(req);
    req.instr_dout[15:12] = LD;
    req.dr = 3'h4;
    req.instr_dout[11:0] = {req.dr, 9'h0}; //LD to R0
    req.complete_instr = 1;

    start_item(req);
    finish_item(req);
    req.instr_dout[15:12] = LD;
    req.dr = 3'h5;
    req.instr_dout[11:0] = {req.dr, 9'h0}; //LD to R0
    req.complete_instr = 1;

    start_item(req);
    finish_item(req);
    req.instr_dout[15:12] = LD;
    req.dr = 3'h6;
    req.instr_dout[11:0] = {req.dr, 9'h0}; //LD to R0
    req.complete_instr = 1;

    start_item(req);
    finish_item(req);
    req.instr_dout[15:12] = LD;
    req.dr = 3'h7;
    req.instr_dout[11:0] = {req.dr, 9'h0}; //LD to R0
    req.complete_instr = 1;

    start_item(req);
    finish_item(req);
  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

