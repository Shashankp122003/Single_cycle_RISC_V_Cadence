module flopr 
 (input wire clk, reset,
 input wire [31:0] d,
 output reg [31:0] q);
 always@(posedge clk, posedge reset)
 if (reset) q <= 32'b0;
 else q <= d;
endmodule
