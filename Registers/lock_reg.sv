`include "defines.svh"

class lock_reg extends uvm_reg;
    `uvm_object_utils(lock_reg)

    rand uvm_reg_field key_reserved;
    rand uvm_reg_field locked;

    function new(string name = "lock_reg");
        super.new(name, 32, UVM_NO_COVERAGE);
    endfunction

    function void build();
        key_reserved = uvm_reg_field::type_id::create("key_reserved");
        key_reserved.configure(this, 31, 1, "WO", 0, 31'h00000000, 1, 1, 0);

        locked = uvm_reg_field::type_id::create("locked");
        locked.configure(this, 1, 0, "RO", 1, 1'b1, 1, 1, 0);
    endfunction
endclass