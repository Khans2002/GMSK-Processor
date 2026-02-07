// GMSK-P1: Testbench for the Conductor
// Author: Gooty Mohammed Sameer Khan

`timescale 1ns / 1ps

module conductor_tb;

    reg clk;
    reg rst;
    wire [31:0] pc;
    wire [31:0] instr;

    // Instantiate Program Counter
    program_counter my_pc (
        .clk(clk),
        .rst(rst),
        .pc(pc)
    );

    // Instantiate Instruction Memory
    instruction_memory my_imem (
        .addr(pc),
        .inst(instr)
    );

    // Clock
    always #5 clk = ~clk;

    initial begin
        $dumpfile("tests/conductor.vcd");
        $dumpvars(0, conductor_tb);

        clk = 0; rst = 1;
        #10;
        rst = 0; // Start!

        // Monitor
        $monitor("Time=%0t | PC=%d | Instruction=%h", $time, pc, instr);

        // Run for a few cycles
        #50;
        $finish;
    end

endmodule
