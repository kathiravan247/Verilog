//Design
module master_slave_tff (
    input t,
    input clk,
    input rst,
    output q,
    output q_bar
);

    reg master;
    reg slave;

    always @(*) begin
        if (rst)
            master = 1'b0;
        else if (clk)
            master = t ? ~slave : slave;
    end

    always @(*) begin
        if (rst)
            slave = 1'b0;
        else if (!clk)
            slave = master;
    end

    assign q = slave;
    assign q_bar = ~slave;

endmodule


//Test bench
module tb_master_slave_tff;

    reg t;
    reg clk;
    reg rst;
    
    wire q;
    wire q_bar;

    master_slave_tff uut (
        .t(t),
        .clk(clk),
        .rst(rst),
        .q(q),
        .q_bar(q_bar)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        t = 0;
        
        #10;
        rst = 0;
        
        #15;
        t = 1;
        
        #40;
        t = 0;
        
        #20;
        t = 1;
        
        #30;
        $finish;
    end

    initial begin
        $monitor($time, " clk=%b rst=%b t=%b q=%b q_bar=%b", clk, rst, t, q, q_bar);
    end

endmodule
