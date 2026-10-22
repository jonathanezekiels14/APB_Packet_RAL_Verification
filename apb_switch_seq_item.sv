`include "defines.svh"

class apb_switch_seq_item extends uvm_sequence_item;
	
	// Master request fields
	rand logic [`ADDR_WIDTH-1:0] PADDR;
	rand logic [`DATA_WIDTH-1:0] PWDATA;
	rand logic PWRITE; // 1 = Write, 0 = Read
	
	// Slave response fields
	logic [`DATA_WIDTH-1:0] PRDATA;
	logic PSLVERR;

	// Constraints
	
	constraint c_addr_align {
		soft PADDR[1:0] == 2'b00;
	}

	`uvm_object_utils_begin(apb_switch_seq_item)
		`uvm_field_int(PADDR, UVM_ALL_ON | UVM_HEX)
		`uvm_field_int(PWDATA, UVM_ALL_ON | UVM_HEX)
		`uvm_field_int(PWRITE, UVM_ALL_ON | UVM_BIN)
		`uvm_field_int(PRDATA, UVM_ALL_ON | UVM_HEX)
		`uvm_field_int(PSLVERR, UVM_ALL_ON | UVM_BIN)
	`uvm_object_utils_end

	// Constructor
	function new(string name = "apb_switch_seq_item");
		super.new(name);
	endfunction

    virtual function string convert2string();
		string dir  = PWRITE ? "WRITE" : "READ";
		string data = PWRITE ? $sformatf("0x%08h", PWDATA) : $sformatf("0x%08h", PRDATA);

		return $sformatf("[APB_TX] %s | Addr: 0x%04h | Data: %s | PSLVERR: %0b", dir, PADDR, data, PSLVERR);
	endfunction
endclass