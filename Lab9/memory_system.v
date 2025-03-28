module memory_system(
    input [7:0] data,
    input store,
    input [1:0] addr,
    output [7:0] memory
);

    wire [3:0] en;
    wire [7:0] mem0, mem1, mem2, mem3;

    // Demultiplex based on address
    assign en[0] = (addr == 2'b00) ? store : 1'b0;
    assign en[1] = (addr == 2'b01) ? store : 1'b0;
    assign en[2] = (addr == 2'b10) ? store : 1'b0;
    assign en[3] = (addr == 2'b11) ? store : 1'b0;

    // 4 Byte memory
    byte_memory b0 (
        .data(data),
        .store(en[0]),
        .memory(mem0)
    );

    byte_memory b1 (
        .data(data),
        .store(en[1]),
        .memory(mem1)
    );

    byte_memory b2 (
        .data(data),
        .store(en[2]),
        .memory(mem2)
    );

    byte_memory b3 (
        .data(data),
        .store(en[3]),
        .memory(mem3)
    );

    // Multiplexer to select output
    reg [7:0] memory_out;
    always @(*) begin
        case(addr)
            2'b00: memory_out = mem0;
            2'b01: memory_out = mem1;
            2'b10: memory_out = mem2;
            2'b11: memory_out = mem3;
            default: memory_out = 8'b0;
        endcase
    end

    assign memory = memory_out;

endmodule
