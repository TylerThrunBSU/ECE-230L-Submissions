`timescale 1ns/1ps

module test();

    reg [15:0] sw;
    wire [15:0] led;

    top uut(
        .led(led),
        .sw(sw)
    );

    initial begin
        $dumpvars(0,test);
        sw = 16'h0000;
        #15;
        if (led != 16'hffff) $display("Test failed!");
        sw = 16'hFFFF;
        #15;
        if (led != 16'haaaa) $display("Test failed!");
        $finish;
    end

endmodule
