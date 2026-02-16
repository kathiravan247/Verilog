//Design
module jk_ff(input clk,input rst,input j,input k,output reg q);
always @(posedge clk or posedge rst)
begin
if(rst)
q<=1'b0;
else if(j & ~k)
q<=1'b1;
else if(~j & k)
q<=1'b0;
else if(j & k)
q<=~q;
else
q<=q;
end
endmodule

//Testbench
module jk_ff_tb;
reg clk;
reg rst;
reg j;
reg k;
wire q;

jk_ff dut(.clk(clk),.rst(rst),.j(j),.k(k),.q(q));

initial
begin
clk=0;
forever #5 clk=~clk;
end

initial
begin
rst=1; j=0; k=0;
#10 rst=0;
#10 j=1; k=0;
#10 j=0; k=1;
#10 j=1; k=1;
#10 j=0; k=0;
#20 $finish;
end
endmodule
