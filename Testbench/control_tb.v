module controller_tb;

  // Define the signals for connecting to the controller module
  reg [6:0] op;
  reg [2:0] funct3;
  reg funct7b5;
  reg Zero;
  wire [1:0] ResultSrc;
  wire MemWrite;
  wire PCSrc, ALUSrc;
  wire RegWrite, Jump;
  wire [1:0] ImmSrc;
  wire [2:0] ALUControl;

  // Instantiate
  controller uut (
    .op(op),
    .funct3(funct3),
    .funct7b5(funct7b5),
    .Zero(Zero),
    .ResultSrc(ResultSrc),
    .MemWrite(MemWrite),
    .PCSrc(PCSrc),
    .ALUSrc(ALUSrc),
    .RegWrite(RegWrite),
    .Jump(Jump),
    .ImmSrc(ImmSrc),
    .ALUControl(ALUControl)
  );

  // Create a clock signal
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
    // Test case 1
    op = 7'b0000011;
    funct3 = 3'b100;
    funct7b5 = 1'b0;
    Zero = 1'b0;
    #20;

    // Test case 2
    op = 7'b0100011;
    funct3 = 3'b011;
    funct7b5 = 1'b1;
    Zero = 1'b1;
    #20;

  

    $finish;
  end

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

endmodule

