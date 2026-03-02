//design
module seq_101_nonoverlap (
    input clk,
    input rst,
    input x,
    output reg y
);

reg [1:0] state, next_state;

parameter S0 = 2'b00,
          S1 = 2'b01,
          S2 = 2'b10,
          S3 = 2'b11;

always @(posedge clk or posedge rst)
begin
    if (rst)
        state <= S0;
    else
        state <= next_state;
end

always @(*)
begin
    case(state)
        S0: next_state = x ? S1 : S0;
        S1: next_state = x ? S1 : S2;
        S2: next_state = x ? S3 : S0;
        S3: next_state = x ? S1 : S0;
        default: next_state = S0;
    endcase
end

always @(*)
begin
    case(state)
        S3: y = 1'b1;
        default: y = 1'b0;
    endcase
end

endmodule

//Testbench
module tb_seq_101_nonoverlap;

reg clk;
reg rst;
reg x;
wire y;

seq_101_nonoverlap dut (
    .clk(clk),
    .rst(rst),
    .x(x),
    .y(y)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    rst = 1;
    x = 0;
    #10 rst = 0;

    #10 x = 1;
    #10 x = 0;
    #10 x = 1;
    #10 x = 1;
    #10 x = 0;
    #10 x = 1;
    #10 x = 0;
    #20 $finish;
end

endmodule
