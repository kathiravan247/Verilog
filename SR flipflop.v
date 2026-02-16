//Design
module sr_ff(input clk,input rst,input s,input r,output reg q);
always @(posedge clk or posedge rst)
begin
if(rst)
q<=1'b0;
else if(s & ~r)
q<=1'b1;
else if(~s & r)
q<=1'b0;
else
q<=q;
end
endmodule

//Testbench
module sr_ff_tb;
reg clk;
reg rst;
reg s;
reg r;
wire q;

sr_ff dut(.clk(clk),.rst(rst),.s(s),.r(r),.q(q));

initial
begin
clk=0;
forever #5 clk=~clk;
end

initial
begin
rst=1; s=0; r=0;
#10 rst=0;
#10 s=1; r=0;
#10 s=0; r=1;
#10 s=0; r=0;
#10 s=1; r=0;
#20 $finish;
end
endmodule
