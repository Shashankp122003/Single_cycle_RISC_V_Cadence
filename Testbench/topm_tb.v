module top_tb;

  // Parameters
  parameter CLK_PERIOD = 10; // Clock period in nanoseconds

  // Inputs
  reg clk;
  reg reset;

  // Outputs
  reg [31:0] WriteData, DataAdr;
  reg MemWrite;

  // Instantiate the top module
  top uut (
    .clk(clk),
    .reset(reset),
    .WriteData(WriteData),
    .DataAdr(DataAdr),
    .MemWrite(MemWrite)
  );

  // Clock generation
  initial begin 
  clk=0;
  forever #5 clk=~clk;
  end 

  // Stimulus generation
  initial begin
    // Initialize inputs
    clk = 0;
    reset = 1; // Active low reset

    // Apply reset
    #10 reset = 0;
    #10 reset = 1;

    // Test scenario
    #10; // Add test scenarios as needed

    #100 $finish; // End simulation
  end

  // Monitor signals
  always @(posedge clk) begin
    $display("Time=%t, PC=%h, Instr=%h, MemWrite=%b, DataAdr=%h, WriteData=%h",
             $time, uut.PC, uut.Instr, uut.MemWrite, uut.DataAdr, uut.WriteData);
  end

endmodule
