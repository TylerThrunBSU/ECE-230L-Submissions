module twos_compliment (
    input [7:0] A,
    output [7:0] Y
);

wire [7:0] ones_compl;
wire [6:0] carry;

assign ones_compl = ~A;

// Add 1 using a ripple-carry adder
full_adder FA0 (
    .A(ones_compl[0]),
    .B(1'b1),
    .Cin(1'b0),
    .Y(Y[0]),
    .Cout(carry[0])
);

full_adder FA1 (
    .A(ones_compl[1]),
    .B(1'b0),
    .Cin(carry[0]),
    .Y(Y[1]),
    .Cout(carry[1])
);

full_adder FA2 (
    .A(ones_compl[2]),
    .B(1'b0),
    .Cin(carry[1]),
    .Y(Y[2]),
    .Cout(carry[2])
);

full_adder FA3 (
    .A(ones_compl[3]),
    .B(1'b0),
    .Cin(carry[2]),
    .Y(Y[3]),
    .Cout(carry[3])
);

full_adder FA4 (
    .A(ones_compl[4]),
    .B(1'b0),
    .Cin(carry[3]),
    .Y(Y[4]),
    .Cout(carry[4])
);

full_adder FA5 (
    .A(ones_compl[5]),
    .B(1'b0),
    .Cin(carry[4]),
    .Y(Y[5]),
    .Cout(carry[5])
);

full_adder FA6 (
    .A(ones_compl[6]),
    .B(1'b0),
    .Cin(carry[5]),
    .Y(Y[6]),
    .Cout(carry[6])
);

full_adder FA7 (
    .A(ones_compl[7]),
    .B(1'b0),
    .Cin(carry[6]),
    .Y(Y[7]),
    .Cout()
);

endmodule
