// GMSK-P1: Final Core Testbench
// Author: Gooty Mohammed Sameer Khan

`timescale 1ns / 1ps

module gmsk_p1_tb;

    reg clk;
    reg rst;

    // Instantiate the Core
    gmsk_p1 core (
        .clk(clk),
        .rst(rst)
    );

    // Clock
    always #5 clk = ~clk;

    initial begin
        $dumpfile("tests/gmsk_p1.vcd");
        $dumpvars(0, gmsk_p1_tb);

        // --- Start Verification ---
        clk = 0; 
        rst = 1; // Hold Reset
        #10;
        
        $display("------------------------------------------------");
        $display(" GMSK-P1 Core Simulation Started");
        $display("------------------------------------------------");

        rst = 0; // Release Reset -> Processor Starts!

        // Wait for instructions to execute (PC 0, 4, 8)
        // Inst 1: ADD x1, x0, x0 (x1 = 0)
        // Inst 2: ADDI x1, x1, 1 (x1 = 1)
        // Inst 3: ADD x2, x1, x1 (x2 = 2)
        
        #50; // Run for 50ns

        $display("Checking Registers...");
        // Access internal signals for verification (Backdoor access)
        $display("Register x1 = %d (Expected 1)", core.REG_FILE.registers[1]);
        $display("Register x2 = %d (Expected 2)", core.REG_FILE.registers[2]);

        if (core.REG_FILE.registers[2] == 2) 
            $display("SUCCESS: GMSK-P1 passed the Math Test! 🚀");
        else 
            $display("FAILURE: Processor logic incorrect.");

        $finish;
    end

endmodule
