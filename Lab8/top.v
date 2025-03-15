module top(
    input [15:0] sw,
    input btnL,
    input btnU,
    input btnD,
    input btnR,
    input btnC,
    output [15:0] led
);

    internetSystem uut (
        .sw(sw[3:0]),
        .sw1(sw[7:4]),
        .sw2(sw[11:8]),
        .sw3(sw[15:12]),
        .btnL(btnL),
        .btnU(btnU),
        .btnD(btnD),
        .btnR(btnR),
        .btnC(btnC),
        .led(led[3:0]),
        .led1(led[7:4]),
        .led2(led[11:8]),
        .led3(led[15:12])
    );

endmodule
