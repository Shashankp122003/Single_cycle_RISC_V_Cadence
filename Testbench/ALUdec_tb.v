module aludec_tb;

  // Define the signals for connecting to the aludec module
  reg opb5;
  reg [2:0] funct3;
  reg funct7b5;
  reg [1:0] ALUOp;
  wire [2:0] ALUControl;

  // Instantiate
  aludec uut (
    .opb5(opb5),
    .funct3(funct3),
    .funct7b5(funct7b5),
    .ALUOp(ALUOp),
    .ALUControl(ALUControl)
  );

  // Create a clock signal
  reg clk = 0;
  always begin
    #5 clk = ~clk;
  end

  
  initial begin
    // Test case 1: Addition
    opb5 = 1'b0;
    funct3 = 3'b000;
    funct7b5 = 1'b0;
    ALUOp = 2'b00;
    #20;

    // Test case 2: Subtraction
    opb5 = 1'b1;
    funct3 = 3'b000;
    funct7b5 = 1'b0;
    ALUOp = 2'b01;
    #20;

    // Test case 3: R-type Subtraction
    opb5 = 1'b1;
    funct3 = 3'b000;
    funct7b5 = 1'b1;
    ALUOp = 2'b01;
    #20;

  

    $finish;
  end

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

endmodule
