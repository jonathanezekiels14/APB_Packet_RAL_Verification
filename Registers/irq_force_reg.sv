`include "defines.svh"

class irq_force_reg extends uvm_reg;
	`uvm_object_utils(irq_force_reg)

	rand uvm_reg_field reserved;
	rand uvm_reg_field force_fld;

	function new(string name = "irq_force_reg");
		super.new(name, 32, UVM_NO_COVERAGE);
	endfunction

	function void build();
		reserved = uvm_reg_field::type_id::create("reserved");
		reserved.configure(this, 24, 8, "RO", 0, 24'h000000, 1, 1, 0);

		force_fld = uvm_reg_field::type_id::create("force_fld");
		force_fld.configure(this, 8, 0, "WO", 0, 8'h00, 1, 1, 0);
	endfunction
endclass