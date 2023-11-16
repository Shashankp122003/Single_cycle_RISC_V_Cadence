module mux2_tb ;

reg [1:0] d0,d1;
reg s;
wire y;

mux2 u1(.d0(d0) , .d1(d1) , .s(s) , .y(y));

initial begin 
d0 = 2'b01;
d1 = 2'b11;
s = 1'b0;
#10 s = 1'b1;
end 
endmodule
