module datapath(input wire clk, 
					 input wire reset,
					 input wire [1:0] ResultSrc,
					 input wire PCSrc, 
					 input wire ALUSrc,
					 input wire RegWrite,
					 input wire [1:0] ImmSrc,
					 input wire [2:0] ALUControl,
					 output wire Zero,
					 output wire [31:0] PC,
					 input wire [31:0] Instr,
					 output wire [31:0] ALUResult, 
					 output wire [31:0] WriteData,
					 input wire [31:0] ReadData);
 
 wire [31:0] PCNext, PCPlus4, PCTarget;
 wire [31:0] ImmExt;
 wire [31:0] SrcA, SrcB;
 wire [31:0] Result;
 // next PC logic
 
flopr pcreg(.clk(clk), .reset(reset), .d(PCNext), .q(PC));
 adder pcadd4(.a(PC), .b(32'd4), .y(PCPlus4));
 adder pcaddbranch(PC, ImmExt, PCTarget);
 mux2  pcmux(PCPlus4, PCTarget, PCSrc, PCNext);


//add x1,x2,x3 <- PCSrc
//add x4,x5,x6 <-PCNext = PCSrc + 4


//add x1,x2,x3  <- PCSrc
//sw  x1,24(x4) <- PCnext = 24 + Src add of X4 = PCTarget 

 
 // register file logic
 
regfile rf(.clk(clk), .we3(RegWrite), .a1(Instr[19:15]), .a2(Instr[24:20]), .a3(Instr[11:7]), .wd3(Result), .rd1(SrcA), .rd2(WriteData));
 extend ext(Instr[31:7], ImmSrc, ImmExt);
 
 // ALU logic
 
 mux2 srcbmux(WriteData, ImmExt, ALUSrc, SrcB);
 alu alu(SrcA, SrcB, ALUControl, ALUResult, Zero);
 mux3 resultmux(ALUResult, ReadData, PCPlus4, ResultSrc, Result);

    assign Zero = Zero;
    assign PC = PC;
    assign ALUResult = ALUResult;
    assign WriteData = WriteData;


endmodule
