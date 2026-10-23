`include "defines.svh"

class err_inject_reg extends uvm_reg;
	`uvm_object_utils(err_inject_reg)

	rand uvm_reg_field clear_count;
	rand uvm_reg_field reserved;
	rand uvm_reg_field injected;
	rand uvm_reg_field length_fld;
	rand uvm_reg_field crc;
	rand uvm_reg_field protocol;
	rand uvm_reg_field undersize;
	rand uvm_reg_field overflow;
	rand uvm_reg_field dest;
	rand uvm_reg_field bus;

	function new(string name = "err_inject_reg");
		super.new(name, 32, UVM_NO_COVERAGE);
	endfunction

	function void build();
		clear_count = uvm_reg_field::type_id::create("clear_count");
		clear_count.configure(this, 1, 31, "WO", 0, 1'b0, 1, 1, 0);

		reserved = uvm_reg_field::type_id::create("reserved");
		reserved.configure(this, 23, 8, "RO", 0, 23'h000000, 1, 1, 0);

		injected = uvm_reg_field::type_id::create("injected");
		injected.configure(this, 1, 7, "WO", 0, 1'b0, 1, 1, 0);

		length_fld = uvm_reg_field::type_id::create("length_fld");
		length_fld.configure(this, 1, 6, "WO", 0, 1'b0, 1, 1, 0);

		crc = uvm_reg_field::type_id::create("crc");
		crc.configure(this, 1, 5, "WO", 0, 1'b0, 1, 1, 0);

		protocol = uvm_reg_field::type_id::create("protocol");
		protocol.configure(this, 1, 4, "WO", 0, 1'b0, 1, 1, 0);

		undersize = uvm_reg_field::type_id::create("undersize");
		undersize.configure(this, 1, 3, "WO", 0, 1'b0, 1, 1, 0);

		overflow = uvm_reg_field::type_id::create("overflow");
		overflow.configure(this, 1, 2, "WO", 0, 1'b0, 1, 1, 0);

		dest = uvm_reg_field::type_id::create("dest");
		dest.configure(this, 1, 1, "WO", 0, 1'b0, 1, 1, 0);

		bus = uvm_reg_field::type_id::create("bus");
		bus.configure(this, 1, 0, "WO", 0, 1'b0, 1, 1, 0);
	endfunction
endclass