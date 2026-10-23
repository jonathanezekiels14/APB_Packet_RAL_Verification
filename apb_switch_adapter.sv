// ============================================================================
// File        : apb_switch_adapter.sv
// Description : UVM Register Adapter for APB Master Agent
// ============================================================================

`include "defines.svh"



class apb_switch_adapter extends uvm_reg_adapter;
    `uvm_object_utils(apb_switch_adapter)

    // ---------------------------------------------------------
    // Constructor
    // ---------------------------------------------------------
    function new(string name = "apb_switch_adapter");
        super.new(name);
        
        // APB does not traditionally support byte-enables in standard setups
        supports_byte_enable = 0; 
        
        // We expect the driver to send a response back via item_done() or put()
        provides_responses = 1;   
    endfunction

    // ---------------------------------------------------------
    // reg2bus: Converts UVM RAL operation to APB Sequence Item
    // ---------------------------------------------------------
    virtual function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
        apb_seq_item tx = apb_seq_item::type_id::create("tx");
        
        tx.pwrite = (rw.kind == UVM_WRITE) ? 1'b1 : 1'b0;
        tx.paddr  = rw.addr;
        
        if (tx.pwrite) begin
            tx.pwdata = rw.data;
        end
        
        return tx;
    endfunction

    // ---------------------------------------------------------
    // bus2reg: Converts APB Sequence Item back to UVM RAL operation
    // ---------------------------------------------------------
    virtual function void bus2reg(uvm_sequence_item bus_item, ref uvm_reg_bus_op rw);
        apb_seq_item tx;
        
        if (!$cast(tx, bus_item)) begin
            `uvm_fatal("ADAPTER", "Failed to cast bus_item to apb_seq_item")
            return;
        end
        
        rw.kind   = tx.pwrite ? UVM_WRITE : UVM_READ;
        rw.addr   = tx.paddr;
        rw.data   = tx.pwrite ? tx.pwdata : tx.prdata;
        
        // Map the slave error directly to the RAL status
        rw.status = tx.pslverr ? UVM_NOT_OK : UVM_IS_OK;
    endfunction

endclass