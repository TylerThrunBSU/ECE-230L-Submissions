module math_block(
    input [3:0] A,
    input [3:0] B,
    output [3:0] AplusB,
    output [3:0] AminusB
);
    // Simple addition
    four_bit_adder adder(.A(A), .B(B), .Cin(1'b0), .Sum(AplusB), .Cout());
    
    // Subtraction using two's complement
    four_bit_subtractor subtractor(.A(A), .B(B), .Diff(AminusB));
endmodule
