module extend_tb;

  // Define the signals for connecting to the extend module
  reg [31:7] instr;
  reg [1:0] immsrc;
  wire [31:0] immext;

  // Instantiate the extend module
  extend uut (
    .instr(instr),
    .immsrc(immsrc),
    .immext(immext)
  );

  // Create a clock signal
  reg clk = 0;
  always begin
    #5 clk = ~clk;
  end

  
  initial begin
    // Test case 1: I-type
    instr = 32'b00000000000000000000111111000000;
    immsrc = 2'b00;
    #20;

    // Test case 2: S-type (stores)
    instr = 32'b00000000000011111000001110000000;
    immsrc = 2'b01;
    #20;

    // Test case 3: B-type (branches)
    instr = 32'b00000001001110000000100000100000;
    immsrc = 2'b10;
    #20;

    // Test case 4: J-type (jal)
    instr = 32'b00001000000010000111000010000000;
    immsrc = 2'b11;
    #20;


    $finish;
  end

  // Clock generation
  always begin
    #5 clk = ~clk;
  end

endmodule
