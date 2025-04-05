module d_flipflop(
    input D,
    input clk,
    output reg Q,
    output Qn
);
    initial begin
        Q <= 0;
    end
    
    always @(posedge clk) begin
        Q <= D;
    end
    
    assign Qn = ~Q;
endmodule
