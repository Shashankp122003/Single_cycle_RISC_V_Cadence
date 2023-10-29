module ProgramCounter (
  input wire clk,          // Clock input
  input wire rst,          // Reset input
  input wire [31:0] branch_offset, // Input for branching
  input wire branch_en,    // Branch enable signal
  input wire increment_en, // Increment enable signal
  output wire [31:0] pc    // Output program counter value
);

  reg [31:0] next_pc;      // Next program counter value

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      next_pc <= 32'h00000000; // Reset the PC to 0 on reset
    end else if (branch_en) begin
      next_pc <= next_pc+(branch_offset<<2); // Update PC with branch address if branch_en is active
    end else if (increment_en) begin
      next_pc <= next_pc + 1; // Increment PC by 1 if increment_en is active
    end
  end

  assign pc = next_pc; // Output the PC value

endmodule
