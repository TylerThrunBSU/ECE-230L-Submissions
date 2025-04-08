module binary(
    input w,
    input clk,
    input reset,
    output z,
    output [2:0] state_leds
);
    wire [2:0] Next;
    wire [2:0] State;

    dff bit0(
        .Default(1'b0),
        .D(Next[0]),
        .clk(clk),
        .reset(reset),
        .Q(State[0])
    );

    dff bit1(
        .Default(1'b0),
        .D(Next[1]),
        .clk(clk),
        .reset(reset),
        .Q(State[1])
    );

    dff bit2(
        .Default(1'b0),
        .D(Next[2]),
        .clk(clk),
        .reset(reset),
        .Q(State[2])
    );

    // State encoding: A=000, B=001, C=010, D=011, E=100
    
    reg [2:0] next_state_reg;
    always @(*) begin
        case (State)
            3'b000: next_state_reg = w ? 3'b011 : 3'b001; // State A -> D or B
            3'b001: next_state_reg = w ? 3'b011 : 3'b010; // State B -> D or C
            3'b010: next_state_reg = w ? 3'b011 : 3'b010; // State C -> D or C
            3'b011: next_state_reg = w ? 3'b100 : 3'b001; // State D -> E or B
            3'b100: next_state_reg = w ? 3'b100 : 3'b001; // State E -> E or B
            default: next_state_reg = 3'b000;             // Default to A
        endcase
    end
    
    assign Next = next_state_reg;
    
    // z is high only in states C and E
    assign z = (State == 3'b010) || (State == 3'b100);

    assign state_leds = State;

endmodule
