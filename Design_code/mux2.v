module mux2 
 (input wire [31:0] d0, d1,
 input wire s,
 output wire [31:0] y);
 assign y = s ? d1 : d0;
endmodule
