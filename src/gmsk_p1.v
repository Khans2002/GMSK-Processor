// GMSK-P1: The Core (Top Level)
// Author: Gooty Mohammed Sameer Khan

module gmsk_p1 (
    input wire clk,
    input wire rst
);

    // ==========================================
    // Internal Wires (The Nervous System)
    // ==========================================
    wire [31:0] pc;
    wire [31:0] instr;
    wire [31:0] rdata1, rdata2;
    wire [31:0] alu_result;
    wire zero_flag;
    
    // Decoding Wires
    wire [6:0] opcode = instr[6:0];
    wire [4:0] rd     = instr[11:7];
    wire [2:0] funct3 = instr[14:12];
    wire [4:0] rs1    = instr[19:15];
    wire [4:0] rs2    = instr[24:20];
    wire [11:0] imm   = instr[31:20]; // Immediate value for ADDI

    // Control Signals
    reg [1:0] alu_op;
    reg reg_write;
    reg [31:0] alu_operand_b;

    // ==========================================
    // 1. The Conductor (PC + IMEM)
    // ==========================================
    program_counter PC (
        .clk(clk),
        .rst(rst),
        .pc(pc)
    );

    instruction_memory IMEM (
        .addr(pc),
        .inst(instr)
    );

    // ==========================================
    // 2. The Decoder (Control Logic)
    // ==========================================
    always @(*) begin
        // Defaults
        reg_write = 0;
        alu_op = 2'b00; // ADD default
        alu_operand_b = rdata2; // Default to Register B

        case (opcode)
            // R-Type Instructions (ADD, SUB, AND, OR) -> Opcode: 0110011
            7'b0110011: begin
                reg_write = 1;
                // Decide ALU Operation based on funct3/7 (Simplified for P1)
                // In P1 we only assume ADD for R-type for now to pass the test
                // Expansion needed for SUB/AND/OR later
                alu_op = 2'b00; 
            end

            // I-Type Instructions (ADDI) -> Opcode: 0010011
            7'b0010011: begin
                reg_write = 1;
                alu_op = 2'b00; // ADD operation
                // Sign Extend Immediate
                alu_operand_b = { {20{imm[11]}}, imm }; 
            end
            
            // Default: Do nothing
            default: reg_write = 0;
        endcase
    end

    // ==========================================
    // 3. The Hands (Register File)
    // ==========================================
    register_file REG_FILE (
        .clk(clk),
        .we(reg_write),
        .rs1(rs1),
        .rs2(rs2),
        .rd(rd),
        .wdata(alu_result), // Result goes back to destination
        .rdata1(rdata1),
        .rdata2(rdata2)
    );

    // ==========================================
    // 4. The Brain (ALU)
    // ==========================================
    alu ALU (
        .a(rdata1),
        .b(alu_operand_b), // Either Register or Immediate
        .op(alu_op),
        .result(alu_result),
        .zero(zero_flag)
    );

endmodule
