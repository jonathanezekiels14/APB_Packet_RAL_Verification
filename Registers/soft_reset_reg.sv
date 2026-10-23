`include "defines.svh"

class soft_reset_reg extends uvm_reg;
    `uvm_object_utils(soft_reset_reg)

    rand uvm_reg_field reserved;
    rand uvm_reg_field pulse;

    function new(string name = "soft_reset_reg");
        super.new(name, 32, UVM_NO_COVERAGE);
    endfunction

    function void build();
        reserved = uvm_reg_field::type_id::create("reserved");
        reserved.configure(this, 31, 1, "RO", 0, 31'h00000000, 1, 1, 0);

        pulse = uvm_reg_field::type_id::create("pulse");
        pulse.configure(this, 1, 0, "WO", 0, 1'b0, 1, 1, 0);
    endfunction
endclass