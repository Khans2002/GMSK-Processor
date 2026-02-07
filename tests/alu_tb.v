// GMSK-P1: Testbench for ALU
// Author: Gooty Mohammed Sameer Khan

`timescale 1ns / 1ps

module alu_tb;

    // Signals
    reg [31:0] a;
    reg [31:0] b;
    reg [1:0] op;
    wire [31:0] result;
    wire zero;

    // Instantiate ALU
    alu uut (
        .a(a),
        .b(b),
        .op(op),
        .result(result),
        .zero(zero)
    );

    initial begin
        $dumpfile("tests/alu.vcd");
        $dumpvars(0, alu_tb);

        // Test 1: ADD (3 + 2 = 5)
        a = 32'd3; b = 32'd2; op = 2'b00;
        #10;
        $display("ADD: %d + %d = %d (Expected 5)", a, b, result);

        // Test 2: SUB (5 - 3 = 2)
        a = 32'd5; b = 32'd3; op = 2'b01;
        #10;
        $display("SUB: %d - %d = %d (Expected 2)", a, b, result);

        // Test 3: AND (1100 & 1010 = 1000)
        a = 32'b1100; b = 32'b1010; op = 2'b10;
        #10;
        $display("AND: %b & %b = %b (Expected 1000)", a, b, result);

        // Test 4: OR (1100 | 1010 = 1110)
        a = 32'b1100; b = 32'b1010; op = 2'b11;
        #10;
        $display("OR : %b | %b = %b (Expected 1110)", a, b, result);

        #10;
        $finish;
    end

endmodule
