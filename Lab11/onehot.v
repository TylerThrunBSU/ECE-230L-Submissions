module onehot(
    input w,
    input clk,
    input reset,
    output z,
    output [4:0] state_leds
);
    // Wire declarations for next state and current state
    wire Anext, Bnext, Cnext, Dnext, Enext;
    wire Astate, Bstate, Cstate, Dstate, Estate;

    // D flip-flops for each state
    dff Adff(
        .Default(1'b1), // Start in state A
        .D(Anext),
        .clk(clk),
        .reset(reset),
        .Q(Astate)
    );

    dff Bdff(
        .Default(1'b0),
        .D(Bnext),
        .clk(clk),
        .reset(reset),
        .Q(Bstate)
    );

    dff Cdff(
        .Default(1'b0),
        .D(Cnext),
        .clk(clk),
        .reset(reset),
        .Q(Cstate)
    );

    dff Ddff(
        .Default(1'b0),
        .D(Dnext),
        .clk(clk),
        .reset(reset),
        .Q(Dstate)
    );

    dff Edff(
        .Default(1'b0),
        .D(Enext),
        .clk(clk),
        .reset(reset),
        .Q(Estate)
    );

  
    // A(00001) -> B(00010) if w=0, D(01000) if w=1
    assign Anext = 1'b0; // A is never a next state in this system

    // Go to B when w=0 from A, D, E
    assign Bnext = (~w & (Astate | Dstate | Estate));

    // Go to C when w=0 from B, or stay in C when w=0
    assign Cnext = (~w & (Bstate | Cstate));

    // Go to D when w=1 from A, B, C
    assign Dnext = (w & (Astate | Bstate | Cstate));

    // Go to E when w=1 from D or stay E
    assign Enext = (w & (Dstate | Estate));

    // z is high only in states C and E
    assign z = Cstate | Estate;
  
    assign state_leds = {Estate, Dstate, Cstate, Bstate, Astate};

endmodule
