// ============================================================================
// File        : apb_switch_sequencer.sv
// Description : APB Master Sequencer
// ============================================================================

`include "defines.svh"

class apb_switch_sequencer extends uvm_sequencer #(apb_switch_seq_item);
    `uvm_component_utils(apb_switch_sequencer)

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction
endclass