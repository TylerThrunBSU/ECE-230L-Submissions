module four_bit_subtractor(
    input [3:0] A,
    input [3:0] B,
    output [3:0] Diff
);
    wire [3:0] not_B;
    wire c1, c2, c3, unused;
    
    // One's complement of B
    assign not_B = ~B;
    
    // A + (~B) + 1
    full_adder fa0(.A(A[0]), .B(not_B[0]), .Cin(1'b1), .Sum(Diff[0]), .Cout(c1));
    full_adder fa1(.A(A[1]), .B(not_B[1]), .Cin(c1), .Sum(Diff[1]), .Cout(c2));
    full_adder fa2(.A(A[2]), .B(not_B[2]), .Cin(c2), .Sum(Diff[2]), .Cout(c3));
    full_adder fa3(.A(A[3]), .B(not_B[3]), .Cin(c3), .Sum(Diff[3]), .Cout(unused));
endmodule
