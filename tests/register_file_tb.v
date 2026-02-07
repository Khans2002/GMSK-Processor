// GMSK-P1: Testbench for Register File
// Author: Gooty Mohammed Sameer Khan

`timescale 1ns / 1ps

module register_file_tb;

    reg clk;
    reg we;
    reg [4:0] rs1, rs2, rd;
    reg [31:0] wdata;
    wire [31:0] rdata1, rdata2;

    register_file uut (
        .clk(clk),
        .we(we),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .wdata(wdata),
        .rdata1(rdata1),
        .rdata2(rdata2)
    );

    // Clock Generation
    always #5 clk = ~clk;

    initial begin
        $dumpfile("tests/register_file.vcd");
        $dumpvars(0, register_file_tb);

        // Init
        clk = 0; we = 0; rs1 = 0; rs2 = 0; rd = 0; wdata = 0;
        #10;

        // Test 1: Write 42 to x1
        $display("Test 1: Writing 42 to x1...");
        we = 1; rd = 5'd1; wdata = 32'd42;
        #10; // Wait for Clock Tick
        we = 0; // Disable Write

        // Test 2: Read x1
        rs1 = 5'd1;
        #5; // Wait for logic
        if (rdata1 == 42) $display("PASS: x1 contains 42");
        else $display("FAIL: x1 = %d (Expected 42)", rdata1);

        // Test 3: Try to write to x0 (The "Hardwired Zero" Rule)
        $display("Test 3: Trying to write 99 to x0...");
        we = 1; rd = 5'd0; wdata = 32'd99;
        #10;
        we = 0;

        // Test 4: Read x0
        rs1 = 5'd0;
        #5;
        if (rdata1 == 0) $display("PASS: x0 is still 0 (Good!)");
        else $display("FAIL: x0 = %d (Expected 0)", rdata1);

        #10;
        $finish;
    end

endmodule
