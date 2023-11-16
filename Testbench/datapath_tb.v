module testbench();

    // Inputs
    reg clk;
    reg reset;
    reg [1:0] ResultSrc;
    reg PCSrc;
    reg ALUSrc;
    reg RegWrite;
    reg [1:0] ImmSrc;
    reg [2:0] ALUControl;
    reg [31:0] Instr;
    reg [31:0] ReadData;
    
    // Outputs
    wire Zero;
    wire [31:0] PC;
    wire [31:0] ALUResult;
    wire [31:0] WriteData;
    
    // Instantiate the datapath module
    datapath dut (
        .clk(clk),
        .reset(reset),
        .ResultSrc(ResultSrc),
        .PCSrc(PCSrc),
        .ALUSrc(ALUSrc),
        .RegWrite(RegWrite),
        .ImmSrc(ImmSrc),
        .ALUControl(ALUControl),
        .Zero(Zero),
        .PC(PC),
        .Instr(Instr),
        .ALUResult(ALUResult),
        .WriteData(WriteData),
        .ReadData(ReadData)
    );
    
    // Clock generation
    always begin
        clk = 0;
        #5;  // Adjust the delay to half the desired clock period
        clk = 1;
        #5;  // Adjust the delay to half the desired clock period
    end
    
    initial begin
        // Initialize inputs
        reset = 1; // Start with reset high
        // Other inputs initialization
        
        // Wait for a few clock cycles after releasing reset
        #10;
        
        // Release reset
        reset = 0;
        
        // Test Case: Sample Test Case Covering All Inputs
        // Provide values to all inputs for a specific scenario
        
        ResultSrc = 2'b10; // Example value for ResultSrc
        PCSrc = 1'b1; // Example value for PCSrc
        ALUSrc = 1'b0; // Example value for ALUSrc
        RegWrite = 1'b1; // Example value for RegWrite
        ImmSrc = 2'b11; // Example value for ImmSrc
        ALUControl = 3'b010; // Example value for ALUControl
        Instr = 32'h01234567; // Example value for Instr
        ReadData = 32'h89ABCDEF; // Example value for ReadData
        
#10
	ResultSrc = 2'b10;
        PCSrc = 1'b1;
        ALUSrc = 1'b0;
        RegWrite = 1'b1;
        ImmSrc = 2'b11;
        ALUControl = 3'b100;
        Instr = 32'hABCDEF12;
        ReadData = 32'h12345678;
        // Simulation duration
        #1000; // Adjust simulation time accordingly
        $finish; // End simulation
    end
    
    

endmodule
