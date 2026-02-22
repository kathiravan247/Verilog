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

module d_to_sr_ff (
    input s,
    input r,
    input clk,
    input rst,
    output q,
    output q_bar
);
    wire d_in;

    assign d_in = s | (~r & q);

    d_ff d_inst (
        .d(d_in),
        .clk(clk),
        .rst(rst),
        .q(q),
        .q_bar(q_bar)
    );
endmodule

//Test bench
module tb_d_to_sr_ff;
    reg s;
    reg r;
    reg clk;
    reg rst;
    wire q;
    wire q_bar;

    d_to_sr_ff uut (
        .s(s),
        .r(r),
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
        $dumpvars(0, tb_d_to_sr_ff);
        
        rst = 1;
        s = 0;
        r = 0;
        #10;
        
        rst = 0;
        s = 1;
        r = 0;
        #10;
        
        s = 0;
        r = 0;
        #10;
        
        s = 0;
        r = 1;
        #10;
        
        s = 0;
        r = 0;
        #10;
        
        $finish;
    end
endmodule
