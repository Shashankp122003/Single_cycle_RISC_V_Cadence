module dmem_tb;

  // Declare signals for connecting to the dmem module
  reg clk;
  reg we;
  reg [31:0] a;
  reg [31:0] wd;
  wire [31:0] rd;

  // Instantiate the dmem module
  dmem dut (
    .clk(clk),
    .we(we),
    .a(a),
    .wd(wd),
    .rd(rd)
  );
  initial begin 
  clk=0;
  forever #5 clk=~clk;
  end 


  // Initialize signals and provide stimulus
  initial begin
    clk = 0;
    we = 0;
    a = 32'h00000000;
    wd = 32'h00000000;

    // Set up test cases
    a = 32'h00000004; // Access memory address 0x00000004
    we = 1; // Enable write
    wd = 32'hABCDEF01; // Data to be written

    // Clock generation
  end

endmodule
