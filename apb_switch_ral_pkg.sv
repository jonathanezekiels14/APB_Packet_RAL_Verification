// ============================================================================
// File        : apb_switch_ral_pkg.sv
// Description : Package wrapping all APB Packet Switch UVM registers & block
// ============================================================================

package apb_ral_pkg;

	import uvm_pkg::*;
	`include "uvm_macros.svh"

	// ---------------------------------------------------------
	// Core Definitions
	// ---------------------------------------------------------
	`include "defines.svh"

	// ---------------------------------------------------------
	// 1. Register Classes (Compiled First)
	// ---------------------------------------------------------
	`include "Registers/device_id_reg.sv"
	`include "Registers/err_count_reg.sv"
	`include "Registers/err_enable_reg.sv"
	`include "Registers/err_info_reg.sv"
	`include "Registers/err_inject_reg.sv"
	`include "Registers/err_status_reg.sv"
	`include "Registers/fwd_enable_reg.sv"
	`include "Registers/gen_count_reg.sv"
	`include "Registers/gen_ctrl_reg.sv"
	`include "Registers/gen_interval_reg.sv"
	`include "Registers/gen_pkt_config_reg.sv" 
	`include "Registers/gen_status_reg.sv"
	`include "Registers/irq_enable_reg.sv"
	`include "Registers/irq_force_reg.sv"
	`include "Registers/irq_status_reg.sv"
	`include "Registers/lock_reg.sv"
	`include "Registers/port_enable_reg.sv"
	`include "Registers/port_status_reg.sv"
	`include "Registers/soft_reset_reg.sv"
	`include "Registers/stat_drop_reg.sv"
	`include "Registers/stat_rx_reg.sv"
	`include "Registers/stat_tx_reg.sv"
	`include "Registers/switch_ctrl_reg.sv"
	`include "Registers/switch_status_reg.sv"
	`include "Registers/version_reg.sv"

	// ---------------------------------------------------------
	// 2. Register Block (Compiled Last so it sees the classes above)
	// ---------------------------------------------------------
	`include "apb_switch_reg_block.sv"

endpackage