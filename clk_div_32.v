//Design
module clk_div32_case_tb;

reg clk;
reg rst;
wire clk_out;

clk_div32_case uut(
.clk(clk),
.rst(rst),
.clk_out(clk_out)
);

initial
begin
clk = 0;
forever #5 clk = ~clk;
end

initial
begin
rst = 1;
#10 rst = 0;
#200 $finish;
end

initial
begin
$monitor("time=%0t clk=%b rst=%b clk_out=%b",$time,clk,rst,clk_out);
end

initial
begin
$dumpfile("dump.vcd");
$dumpvars(0,clk_div32_case_tb);
end

endmodule

//testbench
module clk_div32_case_tb;

reg clk;
reg rst;
wire clk_out;

clk_div32_case uut(
.clk(clk),
.rst(rst),
.clk_out(clk_out)
);

initial
begin
clk = 0;
forever #5 clk = ~clk;
end

initial
begin
rst = 1;
#10 rst = 0;
#200 $finish;
end

initial
begin
$monitor("time=%0t clk=%b rst=%b clk_out=%b",$time,clk,rst,clk_out);
end

initial
begin
$dumpfile("dump.vcd");
$dumpvars(0,clk_div32_case_tb);
end

endmodule



