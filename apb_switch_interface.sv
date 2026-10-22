`include "defines.svh"
interface apb_switch_interface (input bit PCLK, input bit PRESETn);

    // Master Signals (Driven by Testbench)
    logic PSEL;
	logic PENABLE;
	logic PWRITE;
	logic [`ADDR_WIDTH-1:0] PADDR;
	logic [`DATA_WIDTH-1:0] PWDATA;

	// Slave Signals (Driven by DUT)
	logic [`DATA_WIDTH-1:0] PRDATA;
	logic PREADY;
	logic PSLVERR;
	logic irq; // Interrupt from the packet switch

	// Clocking Blocks
	
	clocking drv_cb @(posedge PCLK);
		default input #1step output #1ns;
		output PSEL, PENABLE, PWRITE, PADDR, PWDATA;
		input PRDATA, PREADY, PSLVERR, irq;
	endclocking
	
	clocking mon_cb @(posedge PCLK);
		default input #1step;
		input PSEL, PENABLE, PWRITE, PADDR, PWDATA, PRDATA, PREADY, PSLVERR, irq;
	endclocking

	modport DRV (clocking drv_cb, input PRESETn);
	modport MON (clocking mon_cb, input PRESETn);

endinterface