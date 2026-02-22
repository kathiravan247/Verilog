//Design
module sr_ff (
    input s,
    input r,
    input clk,
    input rst,
    output reg q,
    output q_bar
);
    assign q_bar = ~q;

    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 1'b0;
        else begin
            case ({s, r})
                2'b00: q <= q;
                2'b01: q <= 1'b0;
                2'b10: q <= 1'b1;
                2'b11: q <= 1'bx;
            endcase
        end
    end
endmodule

module sr_to_t_ff (
    input t,
    input clk,
    input rst,
    output q,
    output q_bar
);
    wire s_in;
    wire r_in;

    assign s_in = t & q_bar;
    assign r_in = t & q;

    sr_ff sr_inst (
        .s(s_in),
        .r(r_in),
        .clk(clk),
        .rst(rst),
        .q(q),
        .q_bar(q_bar)
    );
endmodule

//test bench
module tb_sr_to_t_ff;
    reg t;
    reg clk;
    reg rst;
    wire q;
    wire q_bar;

    sr_to_t_ff uut (
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
        $dumpvars(0, tb_sr_to_t_ff);
        
        rst = 1;
        t = 0;
        #10;
        
        rst = 0;
        t = 0;
        #10;
        
        t = 1;
        #30;
        
        t = 0;
        #15;
        
        t = 1;
        #10;
        
        $finish;
    end
endmodule
