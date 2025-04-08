module top(
    input sw,
    input btnC,
    input btnU,
    output [10:0] led
);
    wire z_onehot, z_binary;
    wire [4:0] onehot_state;
    wire [2:0] binary_state;
    
    onehot oh_inst(
        .w(sw),
        .clk(btnC),
        .reset(btnU),
        .z(z_onehot),
        .state_leds(onehot_state)
    );
    
    binary bin_inst(
        .w(sw),
        .clk(btnC),
        .reset(btnU),
        .z(z_binary),
        .state_leds(binary_state)
    );
    
    assign led = {binary_state, onehot_state, z_binary, z_onehot};
    
endmodule
