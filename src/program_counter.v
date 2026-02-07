// GMSK-P1: Program Counter (The Finger)
// Author: Gooty Mohammed Sameer Khan

module program_counter (
    input wire clk,           // Clock
    input wire rst,           // Reset
    output reg [31:0] pc      // Current Address (Where are we?)
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            pc <= 32'b0;      // Start at line 0
        end else begin
            pc <= pc + 4;     // Move to next line (Instructions are 4 bytes wide)
        end
    end

endmodule
