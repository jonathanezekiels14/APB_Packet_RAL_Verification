`include "defines.svh"

class gen_count_reg extends uvm_reg;
	`uvm_object_utils(gen_count_reg)

	rand uvm_reg_field reserved;
	rand uvm_reg_field packet_count;

	function new(string name = "gen_count_reg");
		super.new(name, 32, UVM_NO_COVERAGE);
	endfunction

	function void build();
		reserved = uvm_reg_field::type_id::create("reserved");
		reserved.configure(this, 16, 16, "RO", 0, 16'h0000, 1, 1, 0);

		packet_count = uvm_reg_field::type_id::create("packet_count");
		packet_count.configure(this, 16, 0, "RW", 0, 16'h0004, 1, 1, 0);
	endfunction
endclass