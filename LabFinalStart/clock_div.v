module clock_div #(parameter DIVIDE_BY = 17) (
    input clock,
    input reset,
    output wire div_clock
);
    // For DIVIDE_BY=1 (test bench case), just pass through the clock
    generate
        if (DIVIDE_BY == 1) begin
            assign div_clock = clock;
        end else begin
            // For actual implementation
            reg [DIVIDE_BY-1:0] counter;
            reg clk_out;
            
            always @(posedge clock or posedge reset) begin
                if (reset) begin
                    counter <= 0;
                    clk_out <= 0;
                end else begin
                    if (counter == {DIVIDE_BY{1'b1}}) begin
                        clk_out <= ~clk_out;
                        counter <= 0;
                    end else begin
                        counter <= counter + 1;
                    end
                end
            end
            
            assign div_clock = clk_out;
        end
    endgenerate
endmodule
