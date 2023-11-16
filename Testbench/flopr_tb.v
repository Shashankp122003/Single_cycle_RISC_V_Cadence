module flopr_tb();

reg clk,reset;
reg [31:0] d;
wire [31:0] q;

flopr u1(.clk(clk) , .reset(reset) , .d(d) , .q(q) );

initial begin 
clk = 1'b1;
forever #5 clk = ~clk;
end 

initial begin
reset=1'b1;
#10 reset = 1'b0;
#10 d = 32'hBABEFACE;
#10 reset = 1'b1;
d = 32'hCAFECAFE;
#10 reset = 1'b0;
d = 32'hAABBCCDD;
end 
endmodule
