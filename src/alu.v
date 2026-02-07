// GMSK-P1: Arithmetic Logic Unit (The Brain)
// Author: Gooty Mohammed Sameer Khan

module alu (
    input wire [31:0] a,      // Input A (32-bit)
    input wire [31:0] b,      // Input B (32-bit)
    input wire [1:0] op,     // Operation Code (00=ADD, 01=SUB, 10=AND, 11=OR)
    output reg [31:0] result, // Result (32-bit)
    output reg zero          // Zero Flag (1 if result is 0)
);

    always @(*) begin
        case (op)
            2'b00: result = a + b; // ADD
            2'b01: result = a - b; // SUB
            2'b10: result = a & b; // AND
            2'b11: result = a | b; // OR
            default: result = 32'b0000;
        endcase

        // Set Zero Flag
        if (result == 32'b0000)
            zero = 1'b1;
        else
            zero = 1'b0;
    end

endmodule
