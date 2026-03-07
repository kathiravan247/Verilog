module shift_reg(clk,d,q);

input clk;
input d;
output [3:0] q;

reg [3:0] q;

always @(posedge clk)
begin
q <= {d,q[3:1]};
end

endmodule

//testbench
module shift_reg_tb;

reg clk;
reg d;
wire [3:0] q;

shift_reg uut(clk,d,q);

initial
begin
clk = 0;
forever #5 clk = ~clk;
end

initial
begin
d = 1;
#10 d = 0;
#10 d = 1;
#10 d = 1;
#20 $finish;
end

initial
$monitor("time=%0t d=%b q=%b",$time,d,q);

endmodule




