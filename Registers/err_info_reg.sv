`include "defines.svh"

class err_info_reg extends uvm_reg;
    `uvm_object_utils(err_info_reg)

    rand uvm_reg_field tx_snapshot;
    rand uvm_reg_field reserved;
    rand uvm_reg_field dest_port;
    rand uvm_reg_field source_fld;
    rand uvm_reg_field last_code;

    function new(string name = "err_info_reg");
        super.new(name, 32, UVM_NO_COVERAGE);
    endfunction

    function void build();
        tx_snapshot = uvm_reg_field::type_id::create("tx_snapshot");
        tx_snapshot.configure(this, 12, 20, "RO", 1, 12'h000, 1, 1, 0);

        reserved = uvm_reg_field::type_id::create("reserved");
        reserved.configure(this, 2, 18, "RO", 0, 2'h0, 1, 1, 0);

        dest_port = uvm_reg_field::type_id::create("dest_port");
        dest_port.configure(this, 2, 16, "RO", 1, 2'h0, 1, 1, 0);

        source_fld = uvm_reg_field::type_id::create("source_fld");
        source_fld.configure(this, 8, 8, "RO", 1, 8'h00, 1, 1, 0);

        last_code = uvm_reg_field::type_id::create("last_code");
        last_code.configure(this, 8, 0, "RO", 1, 8'h00, 1, 1, 0);
    endfunction
endclass