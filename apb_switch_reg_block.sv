// ============================================================================
// File        : apb_switch_reg_block.sv
// Description : UVM Register Block mapping all APB Switch Registers
// ============================================================================

`include "defines.svh"

class apb_switch_reg_block extends uvm_reg_block;
    `uvm_object_utils(apb_switch_reg_block)

    // ---------------------------------------------------------
    // Register Handles
    // ---------------------------------------------------------
    rand device_id_reg device_id;
    rand version_reg version;
    rand switch_status_reg switch_status;
    rand port_status_reg port_status;
    rand gen_status_reg gen_status;
    rand stat_rx_reg stat_rx;
    rand stat_tx_reg stat_tx;
    rand stat_drop_reg stat_drop;
    rand switch_ctrl_reg switch_ctrl;
    rand port_enable_reg port_enable;
    rand fwd_enable_reg fwd_enable;
    rand gen_ctrl_reg gen_ctrl;
    rand gen_pkt_cfg_reg gen_pkt_cfg;
    rand gen_interval_reg gen_interval;
    rand gen_count_reg gen_count;
    rand irq_status_reg irq_status;
    rand irq_enable_reg irq_enable;
    rand irq_force_reg irq_force;
    rand err_status_reg err_status;
    rand err_enable_reg err_enable;
    rand err_inject_reg err_inject;
    rand err_count_reg err_count;
    rand err_info_reg err_info;
    rand lock_reg lock;
    rand soft_reset_reg soft_reset;

    // ---------------------------------------------------------
    // Constructor
    // ---------------------------------------------------------
    function new(string name = "apb_switch_reg_block");
        super.new(name, UVM_NO_COVERAGE);
    endfunction

    // ---------------------------------------------------------
    // Build Phase
    // ---------------------------------------------------------
    virtual function void build();
        // create_map(name, base_addr, n_bytes, endian, byte_addressing)
        default_map = create_map("default_map", 0, 4, UVM_LITTLE_ENDIAN, 1);

        device_id = device_id_reg::type_id::create("device_id");
        device_id.configure(this, null);
        device_id.build();
        default_map.add_reg(device_id, `ADDR_DEVICE_ID, "RO");

        version = version_reg::type_id::create("version");
        version.configure(this, null);
        version.build();
        default_map.add_reg(version, `ADDR_VERSION, "RO");

        switch_status = switch_status_reg::type_id::create("switch_status");
        switch_status.configure(this, null);
        switch_status.build();
        default_map.add_reg(switch_status, `ADDR_SWITCH_STATUS, "RO");

        port_status = port_status_reg::type_id::create("port_status");
        port_status.configure(this, null);
        port_status.build();
        default_map.add_reg(port_status, `ADDR_PORT_STATUS, "RO");

        gen_status = gen_status_reg::type_id::create("gen_status");
        gen_status.configure(this, null);
        gen_status.build();
        default_map.add_reg(gen_status, `ADDR_GEN_STATUS, "RO");

        stat_rx = stat_rx_reg::type_id::create("stat_rx");
        stat_rx.configure(this, null);
        stat_rx.build();
        default_map.add_reg(stat_rx, `ADDR_STAT_RX, "RO");

        stat_tx = stat_tx_reg::type_id::create("stat_tx");
        stat_tx.configure(this, null);
        stat_tx.build();
        default_map.add_reg(stat_tx, `ADDR_STAT_TX, "RO");

        stat_drop = stat_drop_reg::type_id::create("stat_drop");
        stat_drop.configure(this, null);
        stat_drop.build();
        default_map.add_reg(stat_drop, `ADDR_STAT_DROP, "RO");

        switch_ctrl = switch_ctrl_reg::type_id::create("switch_ctrl");
        switch_ctrl.configure(this, null);
        switch_ctrl.build();
        default_map.add_reg(switch_ctrl, `ADDR_SWITCH_CTRL, "RW");

        port_enable = port_enable_reg::type_id::create("port_enable");
        port_enable.configure(this, null);
        port_enable.build();
        default_map.add_reg(port_enable, `ADDR_PORT_ENABLE, "RW");

        fwd_enable = fwd_enable_reg::type_id::create("fwd_enable");
        fwd_enable.configure(this, null);
        fwd_enable.build();
        default_map.add_reg(fwd_enable, `ADDR_FWD_ENABLE, "RW");

        gen_ctrl = gen_ctrl_reg::type_id::create("gen_ctrl");
        gen_ctrl.configure(this, null);
        gen_ctrl.build();
        default_map.add_reg(gen_ctrl, `ADDR_GEN_CTRL, "RW");

        gen_pkt_cfg = gen_pkt_cfg_reg::type_id::create("gen_pkt_cfg");
        gen_pkt_cfg.configure(this, null);
        gen_pkt_cfg.build();
        default_map.add_reg(gen_pkt_cfg, `ADDR_GEN_PKT_CFG, "RW");

        gen_interval = gen_interval_reg::type_id::create("gen_interval");
        gen_interval.configure(this, null);
        gen_interval.build();
        default_map.add_reg(gen_interval, `ADDR_GEN_INTERVAL, "RW");

        gen_count = gen_count_reg::type_id::create("gen_count");
        gen_count.configure(this, null);
        gen_count.build();
        default_map.add_reg(gen_count, `ADDR_GEN_COUNT, "RW");

        irq_status = irq_status_reg::type_id::create("irq_status");
        irq_status.configure(this, null);
        irq_status.build();
        default_map.add_reg(irq_status, `ADDR_IRQ_STATUS, "RW");

        irq_enable = irq_enable_reg::type_id::create("irq_enable");
        irq_enable.configure(this, null);
        irq_enable.build();
        default_map.add_reg(irq_enable, `ADDR_IRQ_ENABLE, "RW");

        irq_force = irq_force_reg::type_id::create("irq_force");
        irq_force.configure(this, null);
        irq_force.build();
        default_map.add_reg(irq_force, `ADDR_IRQ_FORCE, "WO");

        err_status = err_status_reg::type_id::create("err_status");
        err_status.configure(this, null);
        err_status.build();
        default_map.add_reg(err_status, `ADDR_ERR_STATUS, "RW");

        err_enable = err_enable_reg::type_id::create("err_enable");
        err_enable.configure(this, null);
        err_enable.build();
        default_map.add_reg(err_enable, `ADDR_ERR_ENABLE, "RW");

        err_inject = err_inject_reg::type_id::create("err_inject");
        err_inject.configure(this, null);
        err_inject.build();
        default_map.add_reg(err_inject, `ADDR_ERR_INJECT, "WO");

        err_count = err_count_reg::type_id::create("err_count");
        err_count.configure(this, null);
        err_count.build();
        default_map.add_reg(err_count, `ADDR_ERR_COUNT, "RO");

        err_info = err_info_reg::type_id::create("err_info");
        err_info.configure(this, null);
        err_info.build();
        default_map.add_reg(err_info, `ADDR_ERR_INFO, "RO");

        lock = lock_reg::type_id::create("lock");
        lock.configure(this, null);
        lock.build();
        default_map.add_reg(lock, `ADDR_LOCK, "RW");

        soft_reset = soft_reset_reg::type_id::create("soft_reset");
        soft_reset.configure(this, null);
        soft_reset.build();
        default_map.add_reg(soft_reset, `ADDR_SOFT_RESET, "WO");

        lock_model();
    endfunction
endclass