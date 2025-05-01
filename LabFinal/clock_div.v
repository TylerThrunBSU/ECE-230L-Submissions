module clock_div #(
    parameter DIVIDE_BY = 17
)(
    input wire reset,
    input wire clock,
    output wire clk_out
);
    wire [DIVIDE_BY-1:0] q;
    wire [DIVIDE_BY-1:0] notq;

    dff ff0 (.reset(reset), .clock(clock),  .D(notq[0]), .Q(q[0]), .NotQ(notq[0]));

    genvar i;
    generate
        for (i = 1; i < DIVIDE_BY; i = i + 1) begin : dff_chain
            dff ff (
                .reset(reset),
                .clock(q[i-1]),
                .D(notq[i]),
                .Q(q[i]),
                .NotQ(notq[i])
            );
        end
    endgenerate

    assign clk_out = q[DIVIDE_BY-1];
endmodule
