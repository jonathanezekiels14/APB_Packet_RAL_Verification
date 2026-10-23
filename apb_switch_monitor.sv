// ============================================================================
// File        : apb_switch_monitor.sv
// Description : Passive observer converting bus activity to UVM transactions
// ============================================================================

`include "defines.svh"

class apb_switch_monitor extends uvm_monitor;
    `uvm_component_utils(apb_switch_monitor)

    virtual apb_switch_interface.MON vif;
    uvm_analysis_port #(apb_switch_seq_item) ap;

    function new(string name, uvm_component parent);
        super.new(name, parent);
        ap = new("ap", this);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual apb_switch_interface)::get(this, "", "vif", vif)) begin
            `uvm_fatal("NO_VIF", "Virtual interface not found in apb_switch_monitor")
        end
    endfunction

    virtual task run_phase(uvm_phase phase);
        apb_switch_seq_item tx;

        forever begin
            @(vif.mon_cb);
            
            // A transaction is captured exactly when Access Phase successfully completes
            if (vif.mon_cb.PSEL === 1'b1 && vif.mon_cb.PENABLE === 1'b1 && vif.mon_cb.PREADY === 1'b1) begin
                tx = apb_switch_seq_item::type_id::create("tx");
                
                tx.paddr   = vif.mon_cb.PADDR;
                tx.pwrite  = vif.mon_cb.PWRITE;
                tx.pslverr = vif.mon_cb.PSLVERR;
                
                if (tx.pwrite) begin
                    tx.pwdata = vif.mon_cb.PWDATA;
                end else begin
                    tx.prdata = vif.mon_cb.PRDATA;
                end
                
                // Broadcast to the subscriber/scoreboard
                ap.write(tx);
            end
        end
    endtask
endclass