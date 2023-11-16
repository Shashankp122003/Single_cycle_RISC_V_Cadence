module ALU_tb;

    // Inputs
    reg [6:0] funct3;
    reg [2:0] funct7;
    reg [4:0] ALUop;
    reg [31:0] A;
    reg [31:0] B;

    // Outputs
    wire [31:0] result;
    wire zero;

    // Instantiate the ALU
    ALU alu (
        .funct3(funct3),
        .funct7(funct7),
        .ALUop(ALUop),
        .A(A),
        .B(B),
        .result(result),
        .zero(zero)
    );

    // Stimulus generation
    initial begin
        $display("Testing ALU functionality");
        $display("ALU Inputs: funct3=%b funct7=%b ALUop=%b A=%h B=%h", funct3, funct7, ALUop, A, B);

        // Test case 1: ADD A + B
        funct3 = 3'b000;
        ALUop = 5'b00000;
        A = 32'h5;
        B = 32'h3;
        #10;
        $display("Result of ADD: result=%h zero=%b", result, zero);

        // Test case 2: SUB A - B
        funct3 = 3'b000;
        ALUop = 5'b01000;
        A = 32'h5;
        B = 32'h3;
        #10;
        $display("Result of SUB: result=%h zero=%b", result, zero);

        // Add more test cases for other ALU operations here

        // Finish the simulation
        $finish;
    end

endmodule
