module siso_5bit_shifter (
    input wire clk,
    input wire sel,               
    input wire serial_in,         
    output wire serial_out        
);
    wire [4:0] q; 

    
    TwoToOneMUXDFlipFlop ff0 (
        .in0(1'b0),
        .in1(serial_in),
        .sel(sel),
        .clk(clk),
        .Q(q[0]),
        .Qn()
    );

    
    TwoToOneMUXDFlipFlop ff1 (
        .in0(1'b0),
        .in1(q[0]),
        .sel(sel),
        .clk(clk),
        .Q(q[1]),
        .Qn()
    );

    TwoToOneMUXDFlipFlop ff2 (
        .in0(1'b0),
        .in1(q[1]),
        .sel(sel),
        .clk(clk),
        .Q(q[2]),
        .Qn()
    );

    TwoToOneMUXDFlipFlop ff3 (
        .in0(1'b0),
        .in1(q[2]),
        .sel(sel),
        .clk(clk),
        .Q(q[3]),
        .Qn()
    );

    TwoToOneMUXDFlipFlop ff4 (
        .in0(1'b0),
        .in1(q[3]),
        .sel(sel),
        .clk(clk),
        .Q(q[4]),
        .Qn()
    );

    assign serial_out = q[4];
endmodule
