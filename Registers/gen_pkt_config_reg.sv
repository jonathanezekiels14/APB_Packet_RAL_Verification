`include "defines.svh"

class gen_pkt_cfg_reg extends uvm_reg;
	`uvm_object_utils(gen_pkt_cfg_reg)

	rand uvm_reg_field reserved_31_24;
	rand uvm_reg_field seed;
	rand uvm_reg_field length_fld;
	rand uvm_reg_field reserved_7_4;
	rand uvm_reg_field src_port;
	rand uvm_reg_field dst_port;

	function new(string name = "gen_pkt_cfg_reg");
		super.new(name, 32, UVM_NO_COVERAGE);
	endfunction

	function void build();
		reserved_31_24 = uvm_reg_field::type_id::create("reserved_31_24");
		reserved_31_24.configure(this, 8, 24, "RO", 0, 8'h00, 1, 1, 0);

		seed = uvm_reg_field::type_id::create("seed");
		seed.configure(this, 8, 16, "RW", 0, 8'h00, 1, 1, 0);

		length_fld = uvm_reg_field::type_id::create("length_fld");
		length_fld.configure(this, 8, 8, "RW", 0, 8'h04, 1, 1, 0);

		reserved_7_4 = uvm_reg_field::type_id::create("reserved_7_4");
		reserved_7_4.configure(this, 4, 4, "RO", 0, 4'h0, 1, 1, 0);

		src_port = uvm_reg_field::type_id::create("src_port");
		src_port.configure(this, 2, 2, "RW", 0, 2'h0, 1, 1, 0);

		dst_port = uvm_reg_field::type_id::create("dst_port");
		dst_port.configure(this, 2, 0, "RW", 0, 2'h1, 1, 1, 0);
	endfunction
endclass