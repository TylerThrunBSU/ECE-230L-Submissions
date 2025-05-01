module math_block(
    input [3:0] A,
    input [3:0] B,
    output [3:0] AplusB,
    output [3:0] AminusB
);
    wire carry_out_add;
    four_bit_adder adder(
        .A(A),
        .B(B),
        .Cin(1'b0),
        .Sum(AplusB),
        .Cout(carry_out_add) // Unused because we only want 4-bits. Cout = 1 means A+B > 15 which is an overflow.
    );
    
    four_bit_subtractor subtractor(
        .A(A),
        .B(B),
        .Diff(AminusB)
    );
endmodule
