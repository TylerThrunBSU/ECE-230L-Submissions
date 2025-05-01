module top
#(
    parameter DIVIDE_BY = 17
)
(
    input [7:0] sw,    // A and B inputs
    input clk,         // 100 MHz board clock
    input btnC,        // Reset button
    output [3:0] an,   // 7seg anodes
    output [6:0] seg   // 7seg segments
);

    wire [3:0] A = sw[3:0];
    wire [3:0] B = sw[7:4];
    
    wire div_clk;
    wire [3:0] AplusB, AminusB;
    
    clock_div #(.DIVIDE_BY(DIVIDE_BY)) clk_divider (
        .clock(clk),
        .reset(btnC),
        .clk_out(div_clk)
    );

    
    math_block math (
        .A(A),
        .B(B),
        .AplusB(AplusB),
        .AminusB(AminusB)
    );
    
    // Seven segment scanner to cycle through anodes
    seven_seg_scanner scanner (
        .div_clock(div_clk),
        .reset(btnC),
        .anode(an)
    );
    
    // Seven segment decoder to display the values
    seven_seg_decoder decoder (
        .A(A),
        .B(B),
        .AplusB(AplusB),
        .AminusB(AminusB),
        .anode(an),
        .segs(seg)
    );
    
endmodule
