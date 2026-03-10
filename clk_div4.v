//design
module clk_div4(
input clk,
input rst,
output reg clk_out
);

reg [1:0] count;

always @(posedge clk or posedge rst)
begin
    if(rst)
    begin
        count <= 0;
        clk_out <= 0;
    end
    else
    begin
        count <= count + 1;

        if(count == 2'b11)
        begin
            clk_out <= ~clk_out;
            count <= 0;
        end
    end
end

endmodule



//testbench
module clk_div4_tb;

reg clk;
reg rst;
wire clk_out;

clk_div4 uut(
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

endmodule






