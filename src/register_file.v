// GMSK-P1: Register File (Short Term Memory)
// Author: Gooty Mohammed Sameer Khan

module register_file (
    input wire clk,           // Clock
    input wire we,            // Write Enable (1 = Write, 0 = Read Only)
    input wire [4:0] rs1,     // Read Source 1 (Selects x0-x31)
    input wire [4:0] rs2,     // Read Source 2 (Selects x0-x31)
    input wire [4:0] rd,      // Destination Register (Where to write)
    input wire [31:0] wdata,  // Data to Write
    output wire [31:0] rdata1,// Output Data 1
    output wire [31:0] rdata2 // Output Data 2
);

    // 32 Registers of 32-bits each
    reg [31:0] registers [31:0];
    integer i;

    // Initialize all to 0 (Simulation only)
    initial begin
        for (i = 0; i < 32; i = i + 1)
            registers[i] = 0;
    end

    // Read Logic (Asynchronous / Combintational)
    // "As soon as rs1 changes, rdata1 changes"
    assign rdata1 = (rs1 == 0) ? 32'b0 : registers[rs1]; // x0 is always 0
    assign rdata2 = (rs2 == 0) ? 32'b0 : registers[rs2]; // x0 is always 0

    // Write Logic (Synchronous / Clocked)
    // "Only write when the clock ticks AND write-enable is ON"
    always @(posedge clk) begin
        if (we && rd != 0) begin // Never write to x0
            registers[rd] <= wdata;
        end
    end

endmodule
