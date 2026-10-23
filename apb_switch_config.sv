// ============================================================================
// File        : apb_switch_config.sv
// Description : Configuration object for the APB Master Agent
// ============================================================================

`include "defines.svh"

class apb_switch_config extends uvm_object;
    `uvm_object_utils(apb_switch_config)

    virtual apb_interface vif;
    uvm_active_passive_enum is_active = UVM_ACTIVE;

    function new(string name = "apb_switch_config");
        super.new(name);
    endfunction
endclass