//Design
module d_ff (
    input d,
    input clk,
    input rst,
    output reg q,
    output q_bar
);
    assign q_bar = ~q;

    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule

module d_to_t_ff (
    input t,
    input clk,
    input rst,
    output q,
    output q_bar
);
    wire d_in;

    assign d_in = t ^ q;

    d_ff d_inst (
        .d(d_in),
        .clk(clk),
        .rst(rst),
        .q(q),
        .q_bar(q_bar)
    );
endmodule

//Testbench
module tb_d_to_t_ff;
    reg t;
    reg clk;
    reg rst;
    wire q;
    wire q_bar;

    d_to_t_ff uut (
        .t(t),
        .clk(clk),
        .rst(rst),
        .q(q),
        .q_bar(q_bar)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_d_to_t_ff);
        
        rst = 1;
        t = 0;
        #10;
        
        rst = 0;
        t = 0;
        #10;
        
        t = 1;
        #30;
        
        t = 0;
        #20;
        
        t = 1;
        #10;
        
        $finish;
    end
endmodule
