//Design
module moore_10110 (
    input clk,
    input rst,
    input x,
    output y
);

    reg [2:0] current_state, next_state;

    parameter S0 = 3'b000,
              S1 = 3'b001,
              S2 = 3'b010,
              S3 = 3'b011,
              S4 = 3'b100,
              S5 = 3'b101;

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
            S3: next_state = x ? S4 : S2;
            S4: next_state = x ? S1 : S5;
            S5: next_state = x ? S3 : S0;
            default: next_state = S0;
        endcase
    end

    assign y = (current_state == S5);

endmodule

//Testbench
module tb_moore_10110;

    reg clk;
    reg rst;
    reg x;
    wire y;

    moore_10110 uut (
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
        #10 x = 1;
        #10 x = 0; 

        #10 x = 1; 
        #10 x = 0;
        #10 x = 1;
        #10 x = 1;
        #10 x = 0; 
        
        #10 x = 0;
        #10 x = 1;

        #20 $finish;
    end

endmodule
