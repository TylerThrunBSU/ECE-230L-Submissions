module internetSystem(
    input [3:0] sw,       // CEO data
    input [3:0] sw1,      // Your data
    input [3:0] sw2,      // Fred's data
    input [3:0] sw3,      // Jill's data
    input btnL,           // MUX Select 0
    input btnU,           // MUX Select 1
    input btnD,           // DEMUX Select 0
    input btnR,           // DEMUX Select 1
    input btnC,           // Enable
    output [3:0] led,     // Data at local_lib
    output [3:0] led1,    // Data at fire department
    output [3:0] led2,    // Data at school
    output [3:0] led3     // Data at rib shack
);

    wire [3:0] mux_out;   // Output of the multiplexer
    wire [1:0] mux_sel = {btnU, btnL};
    wire [1:0] demux_sel = {btnR, btnD};

    // 4-to-1 Multiplexer
    assign mux_out = (mux_sel == 2'b00) ? sw :
                     (mux_sel == 2'b01) ? sw1 :
                     (mux_sel == 2'b10) ? sw2 :
                     (mux_sel == 2'b11) ? sw3 : 4'b0000;

    // 1-to-4 Demultiplexer
    assign led  = (btnC && demux_sel == 2'b00) ? mux_out : 4'b0000;
    assign led1 = (btnC && demux_sel == 2'b01) ? mux_out : 4'b0000;
    assign led2 = (btnC && demux_sel == 2'b10) ? mux_out : 4'b0000;
    assign led3 = (btnC && demux_sel == 2'b11) ? mux_out : 4'b0000;
    
endmodule
