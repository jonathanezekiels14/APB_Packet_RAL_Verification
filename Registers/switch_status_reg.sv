`include "defines.svh"

class switch_status_reg extends uvm_reg;
    `uvm_object_utils(switch_status_reg)
    
    rand uvm_reg_field reserved_31_18;
    rand uvm_reg_field gen_fsm;
    rand uvm_reg_field reserved_15_10;
    rand uvm_reg_field err_pending;
    rand uvm_reg_field gen_running;
    rand uvm_reg_field port_enabled;
    rand uvm_reg_field locked;
    rand uvm_reg_field switch_enabled;
    rand uvm_reg_field busy;
    rand uvm_reg_field ready;

    function new(string name = "switch_status_reg");
        super.new(name, 32, UVM_NO_COVERAGE);
    endfunction

    function void build();
        reserved_31_18 = uvm_reg_field::type_id::create("reserved_31_18");
        reserved_31_18.configure(this, 14, 18, "RO", 0, 14'h0000, 1, 1, 0);

        gen_fsm = uvm_reg_field::type_id::create("gen_fsm");
        gen_fsm.configure(this, 2, 16, "RO", 1, 2'h0, 1, 1, 0);

        reserved_15_10 = uvm_reg_field::type_id::create("reserved_15_10");
        reserved_15_10.configure(this, 6, 10, "RO", 0, 6'h00, 1, 1, 0);

        err_pending = uvm_reg_field::type_id::create("err_pending");
        err_pending.configure(this, 1, 9, "RO", 1, 1'b0, 1, 1, 0);

        gen_running = uvm_reg_field::type_id::create("gen_running");
        gen_running.configure(this, 1, 8, "RO", 1, 1'b0, 1, 1, 0);

        port_enabled = uvm_reg_field::type_id::create("port_enabled");
        port_enabled.configure(this, 4, 4, "RO", 1, 4'hF, 1, 1, 0);

        locked = uvm_reg_field::type_id::create("locked");
        locked.configure(this, 1, 3, "RO", 1, 1'b1, 1, 1, 0);

        switch_enabled = uvm_reg_field::type_id::create("switch_enabled");
        switch_enabled.configure(this, 1, 2, "RO", 1, 1'b0, 1, 1, 0);

        busy = uvm_reg_field::type_id::create("busy");
        busy.configure(this, 1, 1, "RO", 1, 1'b0, 1, 1, 0);

        ready = uvm_reg_field::type_id::create("ready");
        ready.configure(this, 1, 0, "RO", 1, 1'b1, 1, 1, 0);
    endfunction
endclass