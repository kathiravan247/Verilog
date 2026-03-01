module jk_ff(input clk,input rst,input j,input k,output reg q);
always @(posedge clk or posedge rst)
begin
if(rst)
q<=0;
else
case({j,k})
2'b00: q<=q;
2'b01: q<=0;
2'b10: q<=1;
2'b11: q<=~q;
endcase
end
endmodule

module d_from_jk(input clk,input rst,input d,output q);
wire j,k;
assign j=d;
assign k=~d;
jk_ff u1(clk,rst,j,k,q);
endmodule

module tb;
reg clk,rst,d;
wire q;

d_from_jk dut(clk,rst,d,q);

always #5 clk=~clk;

initial
begin
clk=0;
rst=1;
d=0;
#10 rst=0;

#10 d=1;
#10 d=0;
#10 d=1;
#10 d=1;
#10 d=0;
#20 $finish;
end
endmodule
