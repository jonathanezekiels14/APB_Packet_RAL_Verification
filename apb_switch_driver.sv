// ============================================================================
// File        : apb_switch_driver.sv
// Description : APB Master Driver (Drives the Packet Switch DUT)
// ============================================================================

`include "defines.svh"

class apb_switch_driver extends uvm_driver #(apb_switch_seq_item);
    `uvm_component_utils(apb_switch_driver)

    virtual apb_switch_interface.DRV vif;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual apb_switch_interface)::get(this, "", "vif", vif)) begin
            `uvm_fatal("NO_VIF", "Virtual interface not found in apb_switch_driver")
        end
    endfunction

    virtual task run_phase(uvm_phase phase);
        // Wait for active-low reset to be deasserted
        wait(vif.PRESETn === 1'b1);

        // Initialize bus to IDLE state
        vif.drv_cb.PSEL    <= 1'b0;
        vif.drv_cb.PENABLE <= 1'b0;

        forever begin
            seq_item_port.get_next_item(req);
            drive_transfer(req);
            seq_item_port.item_done();
        end
    endtask

    virtual task drive_transfer(apb_switch_seq_item req);
        // ---------------------------------------------------------
        // SETUP PHASE
        // ---------------------------------------------------------
        @(vif.drv_cb);
        vif.drv_cb.PADDR   <= req.paddr;
        vif.drv_cb.PWRITE  <= req.pwrite;
        vif.drv_cb.PSEL    <= 1'b1;
        vif.drv_cb.PENABLE <= 1'b0;
        
        if (req.pwrite) begin
            vif.drv_cb.PWDATA <= req.pwdata;
        end

        // ---------------------------------------------------------
        // ACCESS PHASE
        // ---------------------------------------------------------
        @(vif.drv_cb);
        vif.drv_cb.PENABLE <= 1'b1;

        // Wait dynamically if the DUT asserts wait states (PREADY = 0)
        @(vif.drv_cb iff vif.drv_cb.PREADY === 1'b1);

        // Capture DUT responses
        if (!req.pwrite) begin
            req.prdata = vif.drv_cb.PRDATA;
        end
        req.pslverr = vif.drv_cb.PSLVERR;

        // ---------------------------------------------------------
        // CLEANUP (Return to IDLE)
        // ---------------------------------------------------------
        vif.drv_cb.PSEL    <= 1'b0;
        vif.drv_cb.PENABLE <= 1'b0;
    endtask
endclass