module seven_seg_scanner(
    input div_clock,
    input reset,
    output [3:0] anode
);

    wire Q0, Q1;
    wire D0, D1;

    // Next state logic for a 2-bit counter
    assign D0 = ~Q0;           // Toggle LSB every cycle
    assign D1 = Q1 ^ Q0;       // XOR to handle carry for MSB

    // Instantiate D flip-flops for state storage
    dff ff0 (
        .reset(reset),
        .clock(div_clock),
        .D(D0),
        .Q(Q0),
        .NotQ()
    );

    dff ff1 (
        .reset(reset),
        .clock(div_clock),
        .D(D1),
        .Q(Q1),
        .NotQ()
    );

    // Combinatorial logic to decode state into anode signals
    reg [3:0] anode_reg;
    always @(*) begin
        case ({Q1, Q0})
            2'b00: anode_reg = 4'b1110; // R (Right)
            2'b01: anode_reg = 4'b1101; // RC (Right Center)
            2'b10: anode_reg = 4'b0111; // L (Left)
            2'b11: anode_reg = 4'b1011; // LC (Left Center)
            default: anode_reg = 4'b1110;
        endcase
    end
    assign anode = anode_reg;

endmodule
