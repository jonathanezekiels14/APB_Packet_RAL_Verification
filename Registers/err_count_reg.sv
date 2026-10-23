`include "defines.svh"

class err_count_reg extends uvm_reg;
	`uvm_object_utils(err_count_reg)

	rand uvm_reg_field reserved;
	rand uvm_reg_field error_count;

	function new(string name = "err_count_reg");
		super.new(name, 32, UVM_NO_COVERAGE);
	endfunction

	function void build();
		reserved = uvm_reg_field::type_id::create("reserved");
		reserved.configure(this, 16, 16, "RO", 0, 16'h0000, 1, 1, 0);

		error_count = uvm_reg_field::type_id::create("error_count");
		error_count.configure(this, 16, 0, "RO", 1, 16'h0000, 1, 1, 0);
	endfunction
endclass