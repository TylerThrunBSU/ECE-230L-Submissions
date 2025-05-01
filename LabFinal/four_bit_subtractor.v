module four_bit_subtractor(
    input [3:0] A,
    input [3:0] B,
    output [3:0] Diff
);
    wire [3:0] not_B;
    wire c1, c2, c3, unused;

    // Invert B for two's complement
    assign not_B = ~B;

    full_adder fa0(
        .A(A[0]),
        .B(not_B[0]),
        .Cin(1'b1), // Add 1 for two's complement
        .Sum(Diff[0]),
        .Cout(c1)
    );

    full_adder fa1(
        .A(A[1]),
        .B(not_B[1]),
        .Cin(c1),
        .Sum(Diff[1]),
        .Cout(c2)
    );

    full_adder fa2(
        .A(A[2]),
        .B(not_B[2]),
        .Cin(c2),
        .Sum(Diff[2]),
        .Cout(c3)
    );

    full_adder fa3(
        .A(A[3]),
        .B(not_B[3]),
        .Cin(c3),
        .Sum(Diff[3]),
        .Cout(unused) // Final carry out is unused because of subtraction
    );
endmodule
