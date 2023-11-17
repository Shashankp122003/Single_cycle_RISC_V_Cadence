module ALU (
	input wire [6:0] funct7, // 7-bit function code
	input wire [2:0] funct3, // 3-bit function code
    input wire [4:0] ALUop,  // 5-bit ALU operation code
    input wire [31:0] A,     // Input operand A
    input wire [31:0] B,     // Input operand B
    output reg [31:0] result, // ALU result
    output reg zero          // Zero flag
);

 // ALU control signals
        wire add, sub, sll, slt, sltu, xorop, srl, sra, orop, andop;


assign add = (ALUop == 5'b00000);
assign sub = (ALUop == 5'b01000);
assign sll = (ALUop == 5'b00001);
assign slt = (ALUop == 5'b00100);
assign sltu = (ALUop == 5'b00101);
assign xorop = (ALUop == 5'b00110);
assign srl = (ALUop == 5'b00111);
assign sra = (ALUop == 5'b10111);
assign orop = (ALUop == 5'b01010);
assign andop = (ALUop == 5'b01100);
        
        always @* 
	begin
	result = 32'h0;
        zero = 1'b0;
        // ALU operations
            case(funct3)
                3'b000: begin // ADD / SUB
                    if (add) result = A + B;
                    else if (sub) result = A - B;
                end

                3'b001: begin // SLL
                    if (sll) result = A << B[4:0];
                end

                3'b010: begin // SLT
                    if (slt) result = (A < B) ? 32'h1 : 32'h0;
                end

                3'b011: begin // SLTU
                    if (sltu) result = (A < B) ? 32'h1 : 32'h0;
                end

                3'b100: begin // XOR
                    if (xorop) result = A ^ B;
                end

                3'b101: begin // SRL / SRA
                    if (srl) result = A >> B[4:0];
                    else if (sra) result = $signed(A) >>> B[4:0]; // Arithmetic shift right
                end

                3'b110: begin // OR
                    if (orop) result = A | B;
                end

                3'b111: begin // AND
                    if (andop) result = A & B;
                end
            endcase
        end

        // Set the zero flag
        always @* begin
            if (result == 32'h0) zero = 1'b1;
            else zero = 1'b0;
        end
endmodule
