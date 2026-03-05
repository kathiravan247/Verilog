module universal_reg(clk,s,d,sl,sr,q);

input clk;
input [1:0] s;
input [3:0] d;
input sl,sr;
output [3:0] q;

reg [3:0] q;

always @(posedge clk)
begin
case(s)

2'b00: q <= q;

2'b01: q <= {sr,q[3:1]};

2'b10: q <= {q[2:0],sl};

2'b11: q <= d;

endcase
end

endmodule

//testbench
module universal_reg_tb;

reg clk;
reg [1:0] s;
reg [3:0] d;
reg sl,sr;
wire [3:0] q;

universal_reg uut(clk,s,d,sl,sr,q);

initial
begin
clk = 0;
forever #5 clk = ~clk;
end

initial
begin

s=2'b11; d=4'b1010; #10;

s=2'b01; sr=1; #10;

s=2'b10; sl=0; #10;

s=2'b00; #10;

$finish;

end

initial
$monitor("time=%0t s=%b d=%b q=%b",$time,s,d,q);

endmodule


