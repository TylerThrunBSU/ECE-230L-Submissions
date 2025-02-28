module top(
    input [15:0] sw,
    output [15:0] led
);
    assign led[0] = ~sw[0];
    assign led[1] = led[0] ^ sw[1];
    assign led[2] = led[1] ^ sw[2];
    assign led[3] = led[2] ^ sw[3];
    assign led[4] = led[3] ^ sw[4];
    assign led[5] = led[4] ^ sw[5];
    assign led[6] = led[5] ^ sw[6];
    assign led[7] = led[6] ^ sw[7];
    assign led[8] = led[7] ^ sw[8];
    assign led[9] = led[8] ^ sw[9];
    assign led[10] = led[9] ^ sw[10];
    assign led[11] = led[10] ^ sw[11];
    assign led[12] = led[11] ^ sw[12];
    assign led[13] = led[12] ^ sw[13];
    assign led[14] = led[13] ^ sw[14];
    assign led[15] = led[14] ^ sw[15];
    
endmodule
