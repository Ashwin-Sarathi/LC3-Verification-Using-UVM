
class imem_store_transaction
  extends imem_transaction ;

  `uvm_object_utils(imem_store_transaction)

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  function new(string name = "imem_transaction");
    super.new(name);
  endfunction

	randc bit [2:0] dr;
	rand bit [2:0]  br; 
    randc bit [8:0] pcOffset9;
	randc bit [5:0] pcOffset6;
	
	constraint store_instr
  	{
    	instr_dout[15:12] inside { ST, STR, STI};
		
		if(instr_dout[15:12] != STR)
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