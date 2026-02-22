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

module d_to_jk_ff (
    input j,
    input k,
    input clk,
    input rst,
    output q,
    output q_bar
);
    wire d_in;

    assign d_in = (j & ~q) | (~k & q);

    d_ff d_inst (
        .d(d_in),
        .clk(clk),
        .rst(rst),
        .q(q),
        .q_bar(q_bar)
    );
endmodule

//Testbench
module tb_d_to_jk_ff;
    reg j;
    reg k;
    reg clk;
    reg rst;
    wire q;
    wire q_bar;

    d_to_jk_ff uut (
        .j(j),
        .k(k),
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
        $dumpvars(0, tb_d_to_jk_ff);
        
        rst = 1;
        j = 0;
        k = 0;
        #10;
        
        rst = 0;
        j = 1;
        k = 0;
        #10;
        
        j = 0;
        k = 1;
        #10;
        
        j = 1;
        k = 1;
        #20;
        
        j = 0;
        k = 0;
        #10;
        
        $finish;
    end
endmodule
