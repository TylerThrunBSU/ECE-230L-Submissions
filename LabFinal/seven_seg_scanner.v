module seven_seg_scanner(
    input div_clock,
    input reset,
    output reg [3:0] anode
);
    // Two Bit Counter Register
    reg [1:0] counter;
    
    // Two Bit Counter: 00 -> 01 -> 10 -> 11
    always @(posedge div_clock or posedge reset) begin
        if (reset) begin
            counter <= 2'b00;
        end else begin
            counter <= counter + 1'b1;
        end
    end
    
    // Map counter to anode selection
    always @(*) begin
        case(counter)
            2'b00: begin
                anode = 4'b1110;  // Right segment
            end
            2'b01: begin
                anode = 4'b1101;  // Right Center segment
            end
            2'b10: begin
                anode = 4'b1011;  // Left Center segment
            end
            2'b11: begin
                anode = 4'b0111;  // Left segment
            end
            default: begin
                anode = 4'b1111;  // All segments off
            end
        endcase
    end
endmodule
