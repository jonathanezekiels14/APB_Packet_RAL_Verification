`include "defines.svh"

class gen_ctrl_reg extends uvm_reg;
	`uvm_object_utils(gen_ctrl_reg)

	rand uvm_reg_field reserved;
	rand uvm_reg_field continuous;
	rand uvm_reg_field stop;
	rand uvm_reg_field start;
	rand uvm_reg_field enable;

	function new(string name = "gen_ctrl_reg");
		super.new(name, 32, UVM_NO_COVERAGE);
	endfunction

	function void build();
		reserved = uvm_reg_field::type_id::create("reserved");
		reserved.configure(this, 28, 4, "RO", 0, 28'h0000000, 1, 1, 0);

		continuous = uvm_reg_field::type_id::create("continuous");
		continuous.configure(this, 1, 3, "RW", 0, 1'b0, 1, 1, 0);

		stop = uvm_reg_field::type_id::create("stop");
		stop.configure(this, 1, 2, "WO", 0, 1'b0, 1, 1, 0);

		start = uvm_reg_field::type_id::create("start");
		start.configure(this, 1, 1, "WO", 0, 1'b0, 1, 1, 0);

		enable = uvm_reg_field::type_id::create("enable");
		enable.configure(this, 1, 0, "RW", 0, 1'b0, 1, 1, 0);
	endfunction
endclass