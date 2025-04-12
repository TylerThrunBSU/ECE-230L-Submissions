module binary(
    input  w,
    input  clk,
    input  reset,
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


    assign Next[2] = w & ( (~State[2] & State[1] & State[0]) | (State[2] & ~State[1] & ~State[0]) );
    
    assign Next[1] = ((~State[2] & ~State[1] & State[0]) | 
                      (~State[2] & State[1] & ~State[0]) | 
                      ((~State[2] & ~State[1] & ~State[0]) & w));
    
    assign Next[0] = ((~State[2] & ~State[1] & ~State[0]) ) |
                     ( ((~State[2] & ~State[1] & State[0]) | 
                        (~State[2] & State[1] & ~State[0]) ) & w ) |
                     ( ((~State[2] & State[1] & State[0]) | 
                        (State[2] & ~State[1] & ~State[0]) ) & (~w) );
    
    // The output z is high when the current state is C or E 
    assign z = ((~State[2] & State[1] & ~State[0]) | (State[2] & ~State[1] & ~State[0]));
    
    assign state_leds = State;
    
endmodule
