module ones_compliment (
    input [3:0] A,
    input [3:0] B,
    output [3:0] Sum
);

wire carry0;
wire carry1;
wire carry2;
wire carry3;
wire [3:0] Partial_Sum;

full_adder F0 (
    .A(A[0]),
    .B(~B[0]),
    .Y(Partial_Sum[0]),
    .Cin(1'b0),
    .Cout(carry0)
);

full_adder F1 (
    .A(A[1]),
    .B(~B[1]),
    .Y(Partial_Sum[1]),
    .Cin(carry0),
    .Cout(carry1)
);

full_adder F2 (
    .A(A[2]),
    .B(~B[2]),
    .Y(Partial_Sum[2]),
    .Cin(carry1),
    .Cout(carry2)
);

full_adder F3 (
    .A(A[3]),
    .B(~B[3]),
    .Y(Partial_Sum[3]),
    .Cin(carry2),
    .Cout(carry3)
);

wire [3:0] sumWithCarry;
wire carry00;
wire carry01;
wire carry02;
wire carry03;

full_adder F4 (
.A(Partial_Sum[0]),
.B(carry3),
.Y(Sum[0]),
.Cin(1'b0),
.Cout(carry00)
);

full_adder F5 (
.A(Partial_Sum[1]),
.B(1'b0),
.Y(Sum[1]),
.Cin(carry00),
.Cout(carry01)
);

full_adder F6 (
.A(Partial_Sum[2]),
.B(1'b0),
.Y(Sum[2]),
.Cin(carry01),
.Cout(carry02)
);

full_adder F7 (
.A(Partial_Sum[3]),
.B(1'b0),
.Y(Sum[3]),
.Cin(carry02),
.Cout(carry03)
);


endmodule