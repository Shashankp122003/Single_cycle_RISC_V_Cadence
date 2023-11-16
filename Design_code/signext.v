module extend(input wire [31:7] instr,
input wire [1:0] immsrc,
output reg [31:0] immext);
always@ * begin
case(immsrc)
	2'b00: immext = {20{instr[31]}, instr[31:20]};
	2'b01: immext = {20{instr[31]}, instr[31:25],instr[11:7]};
	2'b10: immext = {20{instr[31]}, instr[7],instr[30:25], instr[11:8], 0};
	2'b11: immext = {12{instr[31]}, instr[19:12],instr[20], instr[30:21], 0};
	default: immext = 32'bx; 
	endcase
end
endmodule
