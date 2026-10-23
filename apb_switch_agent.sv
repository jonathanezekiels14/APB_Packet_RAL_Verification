// ============================================================================
// File        : apb_switch_agent.sv
// Description : UVM Agent Container for the APB Master
// ============================================================================

`include "defines.svh"

class apb_switch_agent extends uvm_agent;
    `uvm_component_utils(apb_switch_agent)

    // Configuration object handle
    apb_switch_config cfg; 

    apb_switch_driver    driver;
    apb_switch_sequencer sequencer;
    apb_switch_monitor   monitor;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        
        // 1. Fetch the configuration object from the environment
        if (!uvm_config_db#(apb_switch_config)::get(this, "", "cfg", cfg)) begin
            `uvm_fatal("NO_CFG", "Configuration object 'cfg' not found in apb_switch_agent")
        end

        // 2. Set active/passive state based on the config
        is_active = cfg.is_active;
        
        monitor = apb_switch_monitor::type_id::create("monitor", this);
        
        if (get_is_active() == UVM_ACTIVE) begin
            sequencer = apb_switch_sequencer::type_id::create("sequencer", this);
            driver    = apb_switch_driver::type_id::create("driver", this);
        end
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        
        // 3. Connect the virtual interface from the config object to the monitor
        monitor.vif = cfg.vif;
        
        if (get_is_active() == UVM_ACTIVE) begin
            // 4. Connect the virtual interface to the driver, and link the sequencer
            driver.vif = cfg.vif;
            driver.seq_item_port.connect(sequencer.seq_item_export);
        end
    endfunction
endclass