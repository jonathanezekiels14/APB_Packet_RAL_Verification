`include "defines.svh"

class err_status_reg extends uvm_reg;
	`uvm_object_utils(err_status_reg)

	rand uvm_reg_field reserved;
	rand uvm_reg_field injected;
	rand uvm_reg_field length_error;
	rand uvm_reg_field crc_error;
	rand uvm_reg_field protocol_error;
	rand uvm_reg_field undersize;
	rand uvm_reg_field queue_overflow;
	rand uvm_reg_field dest_error;
	rand uvm_reg_field bus_error;

	function new(string name = "err_status_reg");
		super.new(name, 32, UVM_NO_COVERAGE);
	endfunction

	function void build();
		reserved = uvm_reg_field::type_id::create("reserved");
		reserved.configure(this, 24, 8, "RO", 0, 24'h000000, 1, 1, 0);

		injected = uvm_reg_field::type_id::create("injected");
		injected.configure(this, 1, 7, "W1C", 0, 1'b0, 1, 1, 0);

		length_error = uvm_reg_field::type_id::create("length_error");
		length_error.configure(this, 1, 6, "W1C", 0, 1'b0, 1, 1, 0);

		crc_error = uvm_reg_field::type_id::create("crc_error");
		crc_error.configure(this, 1, 5, "W1C", 0, 1'b0, 1, 1, 0);

		protocol_error = uvm_reg_field::type_id::create("protocol_error");
		protocol_error.configure(this, 1, 4, "W1C", 0, 1'b0, 1, 1, 0);

		undersize = uvm_reg_field::type_id::create("undersize");
		undersize.configure(this, 1, 3, "W1C", 0, 1'b0, 1, 1, 0);

		queue_overflow = uvm_reg_field::type_id::create("queue_overflow");
		queue_overflow.configure(this, 1, 2, "W1C", 0, 1'b0, 1, 1, 0);

		dest_error = uvm_reg_field::type_id::create("dest_error");
		dest_error.configure(this, 1, 1, "W1C", 0, 1'b0, 1, 1, 0);

		bus_error = uvm_reg_field::type_id::create("bus_error");
		bus_error.configure(this, 1, 0, "W1C", 0, 1'b0, 1, 1, 0);
	endfunction
endclass