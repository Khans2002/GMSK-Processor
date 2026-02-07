// GMSK-P1: Instruction Memory (The Sheet Music)
// Author: Gooty Mohammed Sameer Khan

module instruction_memory (
    input wire [31:0] addr,   // Address wanted (PC)
    output reg [31:0] inst    // Instruction at that address
);

    // 1024 lines of code capacity (4KB)
    reg [31:0] memory [0:1023];

    // Load "Fake" Program for testing
    initial begin
        // Instruction 1 (Addr 0): ADD x1, x0, x0 (Binary: 00000000...)
        memory[0] = 32'h00000033; 
        
        // Instruction 2 (Addr 4): ADDI x1, x1, 1 (Add 1 to x1)
        // Note: In Verilog simulation, array index 1 = Address 4? 
        // No, usually index aligns with words if addr is word-aligned.
        // Simplified for P1: We use word-indexing internally.
        
        memory[1] = 32'h00108093; // ADDI x1, x1, 1
        memory[2] = 32'h00108133; // ADD x2, x1, x1 (rs2=x1, rs1=x1, rd=x2)
        memory[3] = 32'hDEADBEEF; // Marker
    end

    // Read Logic
    // Convert Byte Address (0, 4, 8) to Word Index (0, 1, 2)
    always @(*) begin
        inst = memory[addr[31:2]]; // Divide by 4
    end

endmodule
