//Design
module traffic_fsm(
    input clk,
    input rst,
    output reg [1:0] state,
    output reg red,
    output reg green,
    output reg yellow
);

reg [1:0] next_state;

parameter S0 = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b10;

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
        S0: next_state = S1;
        S1: next_state = S2;
        S2: next_state = S0;
        default: next_state = S0;
    endcase
end

always @(*)
begin
    case(state)
        S0: begin red = 1; green = 0; yellow = 0; end
        S1: begin red = 0; green = 1; yellow = 0; end
        S2: begin red = 0; green = 0; yellow = 1; end
        default: begin red = 1; green = 0; yellow = 0; end
    endcase
end

  //testbench
  module traffic_fsm_tb;

reg clk;
reg rst;
wire [1:0] state;
wire red;
wire green;
wire yellow;

traffic_fsm uut(
    .clk(clk),
    .rst(rst),
    .state(state),
    .red(red),
    .green(green),
    .yellow(yellow)
);

always #5 clk = ~clk;

initial
begin
  $monitor("Time=%0t, clk=%b, rst=%b, state=%b, red=%b, green=%b, yellow=%b ", $time, clk, rst, state, red, green, yellow);
  $dumpfile("traffic_fsm.vcd");
  $dumpvars(0,traffic_fsm_tb);
    clk = 0;
    rst = 1;
    #10 rst = 0;
    #100 $finish;
end

endmodule

endmodule
