// ============================================================================
// File        : apb_switch_env.sv
// Description : Environment with explicit predictor which instantiates agent
// ============================================================================
`include "defines.svh"

import apb_switch_ral_pkg::*;

class apb_switch_env extends uvm_env;
    `uvm_component_utils(apb_switch_env)

    apb_switch_agent agent;
    apb_switch_config cfg;
    apb_switch_reg_block reg_block;
    apb_switch_adapter adapter;

    uvm_reg_predictor #(apb_switch_seq_item) predictor;

    function new(string name = "apb_switch_env", uvm_component parent);
        super.new(name,parent);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        cfg = apb_switch_config::type_id::create("cfg");

        if (!uvm_config_db#(virtual apb_switch_interface)::get(this,"","vif",cfg.vif))
            `uvm_fatal("NO_VIF", "Virtual Interface not found in environment")
        
        cfg.is_active = UVM_ACTIVE;

        uvm_config_db#(apb_switch_config)::set(this,"agent","cfg",cfg);

        agent = apb_switch_agent::type_id::create("agent",this);

        reg_block = apb_switch_reg_block::type_id::create("reg_block");
        reg_block.build();

        adapter = apb_switch_adapter::type_id::create("adapter");

        predictor = uvm_reg_predictor#(apb_switch_seq_item)::type_id::create("predictor");
    endfunction

    virtual function void connect_phase(uvm_phase phase);
        if(cfg.is_active == UVM_ACTIVE)
            reg_block.default_map.set_sequencer(agent.sequencer,adapter);
        

        reg_block.default_map.set_auto_predict(0);

        predictor.map = reg_block.default_map;
        predictor.adapter=adapter;

        agent.monitor.ap.connect(predictor.bus_in);
    endfunction
endclass

