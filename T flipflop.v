//Design
module t_ff(input clk,input rst,input t,output reg q);
always @(posedge clk or posedge rst)
begin
if(rst)
q<=1'b0;
else if(t)
q<=~q;
else
q<=q;
end
endmodule

//Testbench
module t_ff_tb;
reg clk;
reg rst;
reg t;
wire q;

t_ff dut(.clk(clk),.rst(rst),.t(t),.q(q));

initial
begin
clk=0;
forever #5 clk=~clk;
end

initial
begin
rst=1; t=0;
#10 rst=0;
#10 t=1;
#10 t=0;
#10 t=1;
#20 $finish;
end
endmodule
