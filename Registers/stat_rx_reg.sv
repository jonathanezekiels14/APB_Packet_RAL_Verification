`include "defines.svh"

class stat_rx_reg extends uvm_reg;
	`uvm_object_utils(stat_rx_reg)

	rand uvm_reg_field reserved;
	rand uvm_reg_field rx_packets;

	function new(string name = "stat_rx_reg");
		super.new(name, 32, UVM_NO_COVERAGE);
	endfunction

	function void build();
		reserved = uvm_reg_field::type_id::create("reserved");
		reserved.configure(this, 16, 16, "RO", 0, 16'h0000, 1, 1, 0);

		rx_packets = uvm_reg_field::type_id::create("rx_packets");
		rx_packets.configure(this, 16, 0, "RO", 1, 16'h0000, 1, 1, 0);
	endfunction
endclass