//Design
module d_ff(input clk,input rst,input d,output reg q);
always @(posedge clk or posedge rst)
begin
if(rst)
q<=1'b0;
else
q<=d;
end
endmodule

//Testbench
module d_ff_tb;
reg clk;
reg rst;
reg d;
wire q;

d_ff dut(.clk(clk),.rst(rst),.d(d),.q(q));

initial
begin
clk=0;
forever #5 clk=~clk;
end

initial
begin
rst=1; d=0;
#10 rst=0;
#10 d=1;
#10 d=0;
#10 d=1;
#20 $finish;
end
endmodule
