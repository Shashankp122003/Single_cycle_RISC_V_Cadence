module IMEM(
    input wire [31:0] PC,            // Program Counter
    output reg [31:0] Instruction,  // Fetched Instruction
    input wire MemRead,             // Control signal to trigger read
    input wire CLK,
    input wire RST                  // Reset signal
);

// Internal ROM for instruction storage
reg [31:0] Memory [0:31] = {
    32'h01234567, 32'h89ABCDEF, 32'hAABBCCDD, 32'hDEADBEEF,
    32'h12345678, 32'h87654321, 32'hABCDEF01, 32'hFEDCBA98,
    32'h55555555, 32'hAAAAAAAA, 32'h44444444, 32'hBBBBBBBB,
    32'h99999999, 32'hCCCCCCCC, 32'h77777777, 32'h88888888,
    32'h11111111, 32'h22222222, 32'h33333333, 32'h44444444,
    32'h55555555, 32'h66666666, 32'h77777777, 32'h88888888,
    32'h99999999, 32'hAAAAAAAA, 32'hBBBBBBBB, 32'hCCCCCCCC,
    32'hDDDDDDDD, 32'hEEEEEEEE, 32'hFFFFFFFF, 32'hDEADCAFE
};

// reg [4:0] MemoryLocation; 
// integer i;

// always @(posedge CLK or posedge RST) begin
//     if (RST) begin
//         Instruction <= 32'h01234567;
//         MemoryLocation <= 5'b0; 
//     end
//     else if (MemRead) begin
//      MemoryLocation = 5'b0;
//             for (i = 0; i < 32; i = i + 1) begin
//                 if (Memory[i] == PC) begin
//                     MemoryLocation = i;
//                     break;
//                 end
//             end
//       MemoryLocation = MemoryLocation + 1; 
//       Instruction = Memory[MemoryLocation];
//     end
// end
always @(posedge CLK or posedge RST) begin
    if (RST) begin
        Instruction <= 32'h01234567;
    end
    else if(MemRead) begin
        assign Instruction = Memory[PC];
    end

endmodule


