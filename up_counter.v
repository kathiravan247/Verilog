//design
module up_counter(clk,rst,q);
input clk,rst;
  output reg [1:0] q;

always @(posedge clk or posedge rst)
begin
if(rst)
q <= 2'b11;
else

q <= q - 1;
end

endmodule

//testbench
module tb;

reg clk,rst;
  wire [1:0] q;

up_counter uut(clk,rst,q);

initial
begin
clk=0;
forever #5 clk=~clk;
end

initial
begin
  $monitor("time=%0b | clk=%b, rst=%b, q=%b", $time, clk, q, rst);
rst=1;
#1 rst=0;
#50 $finish;
end

endmodule



