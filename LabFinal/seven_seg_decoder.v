module seven_seg_decoder(
    input [3:0] A,
    input [3:0] B,
    input [3:0] AplusB,
    input [3:0] AminusB,
    input [3:0] anode,
    output reg [6:0] segs
);
    reg [3:0] value_to_display;
    
    // Multiplexer to select which value to display
    always @(*) begin
        case(anode)
            4'b1110: begin
                value_to_display = A;
            end
            4'b1101: begin
                value_to_display = B;
            end
            4'b1011: begin
                value_to_display = AplusB;
            end
            4'b0111: begin
                value_to_display = AminusB;
            end
            default: begin
                value_to_display = 4'b0000;
            end
        endcase
    end
    
    // Decode 4-bit value to 7-segment display
    always @(*) begin
        case(value_to_display)
            //             GFEDCBA
            4'd0: segs = 7'b1000000;  // 0
            4'd1: segs = 7'b1111001;  // 1
            4'd2: segs = 7'b0100100;  // 2
            4'd3: segs = 7'b0110000;  // 3
            4'd4: segs = 7'b0011001;  // 4
            4'd5: segs = 7'b0010010;  // 5
            4'd6: segs = 7'b0000010;  // 6
            4'd7: segs = 7'b1111000;  // 7
            4'd8: segs = 7'b0000000;  // 8
            4'd9: segs = 7'b0010000;  // 9
            4'd10: segs = 7'b0001000; // A
            4'd11: segs = 7'b0000011; // b
            4'd12: segs = 7'b1000110; // C
            4'd13: segs = 7'b0100001; // d
            4'd14: segs = 7'b0000110; // E
            4'd15: segs = 7'b0001110; // F
            default: segs = 7'b1111111; // All off
        endcase
    end
endmodule
