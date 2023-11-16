module regfile_tb;

  // Declare signals for connecting to the Register File module
  reg clk;
  reg we3;
  reg [5:0] a1;
  reg [5:0] a2;
  reg [5:0] a3;
  reg [31:0] wd3;
  wire [31:0] rd1;
  wire [31:0] rd2;

  // Instantiate the Register File module
  regfile dut (
    .clk(clk),
    .we3(we3),
    .a1(a1),
    .a2(a2),
    .a3(a3),
    .wd3(wd3),
    .rd1(rd1),
    .rd2(rd2)
  );
initial begin 
clk=0;
forever #5 clk=~clk;
end 

  // Initialize signals and provide stimulus
  initial begin
    
    we3 = 0;
    a1 = 6'b000000;
    a2 = 6'b000000;
    a3 = 6'b000000;
    wd3 = 32'h00000000;
#10
    // Set up test cases
    we3 = 1; // Enable write
    a3 = 6'b001001; // Write to register 9 (x9)
    wd3 = 32'hABCDEF01; // Data to be written

    a1 = 6'b001001; // Read from register 9 (x9)
   
#10
we3=1;
   a3 = 6'b000011;
    wd3 = 32'hBABEFACE;
 a2 = 6'b000011; // Read from register 3 (x3)
  end

endmodule
