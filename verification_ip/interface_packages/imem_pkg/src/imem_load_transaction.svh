
class imem_load_transaction
  extends imem_transaction ;

  `uvm_object_utils(imem_load_transaction)

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  function new(string name = "imem_transaction");
    super.new(name);
  endfunction

    randc bit [8:0] pcOffset9;
	randc bit [5:0] pcOffset6;
	randc bit [2:0] dr;
	rand bit [2:0]  br; 

	
	constraint load_instr
  	{
    	instr_dout[15:12] inside { LD, LDR, LDI, LEA };
		
		if(instr_dout[15:12] != LDR)
		{
			instr_dout[11:9] == dr;	
			instr_dout[8:0] == pcOffset9;	
		} else {
			instr_dout[11:9] == dr;	
			instr_dout[8:6] == br;	
			instr_dout[5:0] == pcOffset6;	
		}
    
  	}
    
    function void post_randomize();
    endfunction

endclass