//Design
module reg4(clk,rst,d,q);

input clk;
input rst;
  input [7:0] d;
  output [7:0] q;

  reg [7:0] q;

always @(posedge clk or posedge rst)
begin
    if(rst)
        q <= 7'b00000000;
    else
        q <= d;
end

endmodule

//testbench
module reg4_tb;

reg clk,rst;
  reg [7:0] d;
  wire [7:0] q;

reg4 uut(clk,rst,d,q);

initial
begin
clk=0;
forever #5 clk=~clk;
end

initial
begin
rst=1; d=7'b00000000;
#10 rst=0; d=7'b10100000;
#10 d=7'b11000000;
#10 d=7'b11111111;
#10 $finish;
end

initial
$monitor("time=%0t d=%b q=%b",$time,d,q);

endmodule



