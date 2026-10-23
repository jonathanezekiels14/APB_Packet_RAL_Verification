`include "defines.svh"

class switch_ctrl_reg extends uvm_reg;
	`uvm_object_utils(switch_ctrl_reg)

	rand uvm_reg_field reserved_31_4;
	rand uvm_reg_field irq_global_en;
	rand uvm_reg_field reserved_2;
	rand uvm_reg_field stat_clear;
	rand uvm_reg_field enable;

	function new(string name = "switch_ctrl_reg");
		super.new(name, 32, UVM_NO_COVERAGE);
	endfunction

	function void build();
		reserved_31_4 = uvm_reg_field::type_id::create("reserved_31_4");
		reserved_31_4.configure(this, 28, 4, "RO", 0, 28'h0000000, 1, 1, 0);

		irq_global_en = uvm_reg_field::type_id::create("irq_global_en");
		irq_global_en.configure(this, 1, 3, "RW", 0, 1'b0, 1, 1, 0);

		reserved_2 = uvm_reg_field::type_id::create("reserved_2");
		reserved_2.configure(this, 1, 2, "RO", 0, 1'b0, 1, 1, 0);

		stat_clear = uvm_reg_field::type_id::create("stat_clear");
		stat_clear.configure(this, 1, 1, "WO", 0, 1'b0, 1, 1, 0);

		enable = uvm_reg_field::type_id::create("enable");
		enable.configure(this, 1, 0, "RW", 0, 1'b0, 1, 1, 0);
	endfunction
endclass