//Design
module load_reg(clk, load, d, q);

input clk;
input load;
input [3:0] d;
output [3:0] q;

reg [3:0] q;

always @(posedge clk)
begin
    if(load)
        q <= d;
end

endmodule

//Testbench
module load_reg_tb;

reg clk;
reg load;
reg [3:0] d;
wire [3:0] q;

load_reg uut(clk, load, d, q);

initial
begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial
begin
    load = 0; d = 4'b0000;
    #10 load = 1; d = 4'b1010;
    #10 load = 0; d = 4'b1111;
    #10 load = 1; d = 4'b1100;
    #20 $finish;
end

initial
$monitor("time=%0t load=%b d=%b q=%b", $time, load, d, q);

endmodule
