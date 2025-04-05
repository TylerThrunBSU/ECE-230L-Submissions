module t_flipflop(
    input T,
    input clk,
    output reg Q,
    output Qn
);
    initial begin
        Q <= 0;
    end
    
    always @(posedge clk) begin
        if (T)
            Q <= ~Q;
        else
            Q <= Q;
    end
    
    assign Qn = ~Q;
endmodule
