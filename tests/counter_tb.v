// GMSK-P1: Testbench for 4-bit Counter
// Author: Gooty Mohammed Sameer Khan

`timescale 1ns / 1ps

module counter_tb;

    // Signals
    reg clk;
    reg rst;
    wire [3:0] count;

    // Instantiate the Unit Under Test (UUT)
    counter_4bit uut (
        .clk(clk),
        .rst(rst),
        .count(count)
    );

    // Clock Generation: Toggle every 5ns (100MHz)
    always #5 clk = ~clk;

    // Test Sequence
    initial begin
        // Initialize Signals
        clk = 0;
        rst = 1; // Start in Reset

        // Setup Waveform Dumpping (for GTKWave)
        $dumpfile("tests/counter.vcd");
        $dumpvars(0, counter_tb);

        // Wait 20ns, then Release Reset
        #20;
        rst = 0;

        // Run for 200ns
        #200;

        // Finish Simulation
        $display("-------------------------------------------");
        $display("GMSK-P1 Simulation Completed Successfully!");
        $display("Check tests/counter.vcd for waveforms.");
        $display("-------------------------------------------");
        $finish;
    end

    // Monitor Output
    initial begin
        $monitor("Time=%0t | Reset=%b | Count=%d (%b)", $time, rst, count, count);
    end

endmodule
