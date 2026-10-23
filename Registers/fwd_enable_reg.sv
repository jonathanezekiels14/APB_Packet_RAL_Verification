`include "defines.svh"

class fwd_enable_reg extends uvm_reg;
	`uvm_object_utils(fwd_enable_reg)

	rand uvm_reg_field reserved;
	rand uvm_reg_field fwd3_en;
	rand uvm_reg_field fwd2_en;
	rand uvm_reg_field fwd1_en;
	rand uvm_reg_field fwd0_en;

	function new(string name = "fwd_enable_reg");
		super.new(name, 32, UVM_NO_COVERAGE);
	endfunction

	function void build();
		reserved = uvm_reg_field::type_id::create("reserved");
		reserved.configure(this, 28, 4, "RO", 0, 28'h0000000, 1, 1, 0);

		fwd3_en = uvm_reg_field::type_id::create("fwd3_en");
		fwd3_en.configure(this, 1, 3, "RW", 0, 1'b1, 1, 1, 0);

		fwd2_en = uvm_reg_field::type_id::create("fwd2_en");
		fwd2_en.configure(this, 1, 2, "RW", 0, 1'b1, 1, 1, 0);

		fwd1_en = uvm_reg_field::type_id::create("fwd1_en");
		fwd1_en.configure(this, 1, 1, "RW", 0, 1'b1, 1, 1, 0);

		fwd0_en = uvm_reg_field::type_id::create("fwd0_en");
		fwd0_en.configure(this, 1, 0, "RW", 0, 1'b1, 1, 1, 0);
	endfunction
endclass