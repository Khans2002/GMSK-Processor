// GMSK-P1: 4-bit Up-Counter (The "Hello World" of Chip Design)
// Author: Gooty Mohammed Sameer Khan

module counter_4bit (
    input wire clk,      // Clock signal (Heartbeat)
    input wire rst,      // Reset signal (Restart from 0)
    output reg [3:0] count // 4-bit Output (0 to 15)
);

    // Initial block: Runs once at start (Simulation only)
    initial begin
        count = 4'b0000;
    end

    // Always block: Runs on every rising edge of the clock
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 4'b0000; // Reset to 0
        end else begin
            count <= count + 1; // Increment by 1
        end
    end

endmodule
