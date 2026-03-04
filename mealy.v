//design
module mealy_1010_non_overlapping (
    input clk,
    input rst,
    input x,
    output reg y
);

    reg [1:0] current_state, next_state;

    parameter S0 = 2'b00,
              S1 = 2'b01,
              S2 = 2'b10,
              S3 = 2'b11;

    always @(posedge clk or posedge rst) begin
        if (rst)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    always @(*) begin
        case (current_state)
            S0: next_state = x ? S1 : S0;
            S1: next_state = x ? S1 : S2;
            S2: next_state = x ? S3 : S0;
            S3: next_state = x ? S1 : S0;
            default: next_state = S0;
        endcase
    end

    always @(*) begin
        case (current_state)
            S0: y = 0;
            S1: y = 0;
            S2: y = 0;
            S3: y = (x == 0) ? 1 : 0;
            default: y = 0;
        endcase
    end

endmodule



//testbench
module tb_mealy_1010_non_overlapping;

    reg clk;
    reg rst;
    reg x;
    wire y;

    mealy_1010_non_overlapping uut (
        .clk(clk),
        .rst(rst),
        .x(x),
        .y(y)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        x = 0;

        #12 rst = 0;

        #10 x = 1;
        #10 x = 0;
        #10 x = 1;
        #10 x = 0;

        #10 x = 1;
        #10 x = 0;
        #10 x = 1;
        #10 x = 0;

        #10 x = 0;
        #10 x = 1;

        #20 $finish;
    end

endmodule
