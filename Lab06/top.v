module top(
    input [9:0] sw,
    output [13:0] led
);

    half_sub init (
        .A(sw[0]),
        .B(sw[1]),
        .Y(led[0]),
        .Borrow(led[1])
    );

    ones_compliment ones_init (
        .A(sw[5:2]),
        .B(sw[9:6]),
        .Sum(led[5:2])
    );

    twos_compliment twos_init (
        .A(sw[9:2]),
        .Y(led[13:6])
    );

endmodule
