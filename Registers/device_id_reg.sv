`include defines.svh

class device_id_reg extends uvm_reg;
    `uvm_object_utils(device_id_reg)
    
    rand uvm_reg_field [7:0] revision;
    rand uvm_reg_field [7:0] vendor_id;
    rand uvm_reg_field [15:0] product_id;

    function new(string name = "device_id_reg");
        super.new(name, 32, );
    endfunction

    function void build();
        revision = uvm_reg_field::type_id::create("revision");
        revision.configure(this,8,24,"RO",0,8'h02,1,1,0);

        vendor_id = uvm_reg_field::type_id::create("vendor_id");
        vendor_id.configure(this,8,16,"RO",0,8'hA5,1,1,0);

        product_id = uvm_reg_field::type_id::create("product_id");
        product_id.configure(this,16,0,"RO",0,16'h5357,1,1,0);
    endfunction
endclass

    
