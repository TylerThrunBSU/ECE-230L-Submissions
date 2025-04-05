module jk_flipflop(
    input J,
    input K,
    input clk,
    output reg Q,
    output Qn
);
    wire D;
    
    assign D = (J & ~Q) | (~K & Q);
    
    initial begin
        Q <= 0;
    end
    
    always @(posedge clk) begin
        Q <= D;
    end
    
    assign Qn = ~Q;
endmodule
