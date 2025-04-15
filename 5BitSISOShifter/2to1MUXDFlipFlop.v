module TwoToOneMUXDFlipFlop(
    input in0,
    input in1,
    input sel,
    input clk,
    output reg Q,
    output wire Qn
);
    wire D;
    assign D = sel ? in1 : in0; // Assign D to the output of the MUX if sel is high

    always @(posedge clk) begin
        Q <= D;
    end

    assign Qn = ~Q;
endmodule
