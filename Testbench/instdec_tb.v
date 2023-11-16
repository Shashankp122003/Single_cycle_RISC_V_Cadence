module maindec_tb;

 
  reg [6:0] op;
  wire [1:0] ResultSrc;
  wire MemWrite;
  wire Branch, ALUSrc;
  wire RegWrite, Jump;
  wire [1:0] ImmSrc;
  wire [1:0] ALUOp;

  // Instantiate the maindec module
  maindec uut (
    .op(op),
    .ResultSrc(ResultSrc),
    .MemWrite(MemWrite),
    .Branch(Branch),
    .ALUSrc(ALUSrc),
    .RegWrite(RegWrite),
    .Jump(Jump),
    .ImmSrc(ImmSrc),
    .ALUOp(ALUOp)
  );

  
  reg clk = 0;
  always begin
    #5 clk = ~clk;
  end

  // Create a reset signal
  reg rst = 0;
  initial begin
    rst = 1;
    #10 rst = 0;
  end

  
  initial begin
    // Test case 1: lw
    op = 7'b0000011;
    #20;

    // Test case 2: sw
    op = 7'b0100011;
    #20;

    // Test case 3: R-type
    op = 7'b0110011;
    #20;

    // Test case 4: beq
    op = 7'b1100011;
    #20;

    // Test case 5: I-type ALU
    op = 7'b0010011;
    #20;

    // Test case 6: jal
    op = 7'b1101111;
    #20;

    // Test case 7: Default
    op = 7'b1111111;
    #20;

   

    $finish;
  end

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

endmodule
