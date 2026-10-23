`include "defines.svh"

class gen_interval_reg extends uvm_reg;
	`uvm_object_utils(gen_interval_reg)

	rand uvm_reg_field reserved;
	rand uvm_reg_field interval_fld;

	function new(string name = "gen_interval_reg");
		super.new(name, 32, UVM_NO_COVERAGE);
	endfunction

	function void build();
		reserved = uvm_reg_field::type_id::create("reserved");
		reserved.configure(this, 16, 16, "RO", 0, 16'h0000, 1, 1, 0);

		interval_fld = uvm_reg_field::type_id::create("interval_fld");
		interval_fld.configure(this, 16, 0, "RW", 0, 16'h0002, 1, 1, 0);
	endfunction
endclass