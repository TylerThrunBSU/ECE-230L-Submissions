`timescale 1ns/1ps

module seven_seg_decoder(
    input [3:0] A,
    input [3:0] B,
    input [3:0] AplusB,
    input [3:0] AminusB,
    input [3:0] anode,
    output [6:0] seg  // active-high segment output for testbench
);

    reg [3:0] selected_sig;
    reg [6:0] segs;

    // Choose the proper 4-bit value based on the active anode.
    always @(*) begin
        case (anode)
            4'b1110: selected_sig = A;         // an[0] = 0 → Right
            4'b1101: selected_sig = B;         // an[1] = 0 → RC
            4'b1011: selected_sig = AplusB;    // an[2] = 0 → LC
            4'b0111: selected_sig = AminusB;   // an[3] = 0 → Left
            default: selected_sig = 4'b0000;
        endcase
    end

    // 7-segment decoder
    always @(*) begin
        case(selected_sig)
            //            GFEDCBA
            0: segs  = 7'b1000000;
            1: segs  = 7'b1111001;
            2: segs  = 7'b0100100;
            3: segs  = 7'b0110000;
            4: segs  = 7'b0011001;
            5: segs  = 7'b0010010;
            6: segs  = 7'b0000010;
            7: segs  = 7'b1111000;
            8: segs  = 7'b0000000;
            9: segs  = 7'b0010000;
            10: segs = 7'b0001000;
            11: segs = 7'b0000011;
            12: segs = 7'b1000110;
            13: segs = 7'b0100001;
            14: segs = 7'b0000110;
            15: segs = 7'b0001110;
        endcase
    end

    // Convert to active-high output expected by the testbench
    assign seg = ~segs;

endmodule
