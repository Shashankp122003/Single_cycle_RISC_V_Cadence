module ProgramCounter_TB;

  // Inputs
  reg clk;
  reg rst;
  reg [31:0] branch_offset;
  reg branch_en;
  reg increment_en;

  // Outputs
  wire [31:0] pc;

  // Instantiate the module under test
  ProgramCounter uut (
    .clk(clk),
    .rst(rst),
    .branch_offset(branch_offset),
    .branch_en(branch_en),
    .increment_en(increment_en),
    .pc(pc)
  );

  // Clock generation
  always begin
    clk = 0;
    #5; // 10 time units period for a 2x clock
    clk = 1;
    #5;
  end

  // Test scenario
  initial begin
    // Initialize inputs
    rst = 1;
    branch_offset = 32'h12341234;

    branch_en = 0;
    increment_en = 0;

    // Reset sequence
    #10;
    rst = 0;
    #10;
    // Test case 2: Branch to a new address
    branch_en = 1;
    #10;
    branch_en = 0;

    // Test case 1: Increment the PC
    increment_en = 1;
    #10;
    increment_en = 0;

   

    // Finish simulation
    $finish;
  end

  // Display PC value
  always @(posedge clk) begin
    $display("PC = %h", pc);
  end

endmodule
