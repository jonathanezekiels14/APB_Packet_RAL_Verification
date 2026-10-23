`include "defines.svh"

class irq_enable_reg extends uvm_reg;
	`uvm_object_utils(irq_enable_reg)

	rand uvm_reg_field reserved;
	rand uvm_reg_field sw_event_en;
	rand uvm_reg_field start_ack_en;
	rand uvm_reg_field queue_af_en;
	rand uvm_reg_field packet_fwd_en;
	rand uvm_reg_field packet_drop_en;
	rand uvm_reg_field overflow_en;
	rand uvm_reg_field error_en;
	rand uvm_reg_field gen_done_en;

	function new(string name = "irq_enable_reg");
		super.new(name, 32, UVM_NO_COVERAGE);
	endfunction

	function void build();
		reserved = uvm_reg_field::type_id::create("reserved");
		reserved.configure(this, 24, 8, "RO", 0, 24'h000000, 1, 1, 0);

		sw_event_en = uvm_reg_field::type_id::create("sw_event_en");
		sw_event_en.configure(this, 1, 7, "RW", 0, 1'b0, 1, 1, 0);

		start_ack_en = uvm_reg_field::type_id::create("start_ack_en");
		start_ack_en.configure(this, 1, 6, "RW", 0, 1'b0, 1, 1, 0);

		queue_af_en = uvm_reg_field::type_id::create("queue_af_en");
		queue_af_en.configure(this, 1, 5, "RW", 0, 1'b0, 1, 1, 0);

		packet_fwd_en = uvm_reg_field::type_id::create("packet_fwd_en");
		packet_fwd_en.configure(this, 1, 4, "RW", 0, 1'b0, 1, 1, 0);

		packet_drop_en = uvm_reg_field::type_id::create("packet_drop_en");
		packet_drop_en.configure(this, 1, 3, "RW", 0, 1'b0, 1, 1, 0);

		overflow_en = uvm_reg_field::type_id::create("overflow_en");
		overflow_en.configure(this, 1, 2, "RW", 0, 1'b0, 1, 1, 0);

		error_en = uvm_reg_field::type_id::create("error_en");
		error_en.configure(this, 1, 1, "RW", 0, 1'b0, 1, 1, 0);

		gen_done_en = uvm_reg_field::type_id::create("gen_done_en");
		gen_done_en.configure(this, 1, 0, "RW", 0, 1'b0, 1, 1, 0);
	endfunction
endclass