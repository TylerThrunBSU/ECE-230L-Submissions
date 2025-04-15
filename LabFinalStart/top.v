module top
#(
    parameter DIVIDE_BY = 17  // Clock divider value
)
(
    input [7:0] sw,           // sw[3:0] = A, sw[7:4] = B
    input clk,                // 100MHz system clock
    input btnC,               // Reset button
    output [3:0] an,          // Seven-segment anodes (active-low)
    output [6:0] seg          // Seven-segment segments (active-high)
);

    // Clock Divider Output
    wire slow_clk;

    // Clock Divider: slows down the board clock
    clock_div #(.DIVIDE_BY(DIVIDE_BY)) clk_div_inst (
        .clock(clk),
        .reset(btnC),
        .div_clock(slow_clk)
    );

    // Detect switch value change
    reg [7:0] sw_prev;
    always @(posedge clk) begin
        sw_prev <= sw;
    end
    wire new_data = (sw != sw_prev);

    wire scanner_reset = btnC | new_data;

    wire [3:0] scanned_anode;

    // Anode scanner to rotate through display segments
    seven_seg_scanner scanner (
        .div_clock(slow_clk),
        .reset(scanner_reset),
        .anode(scanned_anode)
    );

    // Math Logic: computes A+B and A-B
    wire [3:0] AplusB, AminusB;
    math_block math_inst (
        .A(sw[3:0]),
        .B(sw[7:4]),
        .AplusB(AplusB),
        .AminusB(AminusB)
    );

    // Segment Decoder: chooses which value to display based on `anode`
    seven_seg_decoder decoder (
        .A(sw[3:0]),
        .B(sw[7:4]),
        .AplusB(AplusB),
        .AminusB(AminusB),
        .anode(scanned_anode),
        .seg(seg)  // fixed here
    );

    // Pass through the active-low anode signal
    assign an = scanned_anode;

endmodule
