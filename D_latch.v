//Design

module d_latch (
    input wire d,
    input wire en,
    output reg q
);

    always @(d or en) begin
        if (en) begin
            q <= d;
        end
    end

endmodule

//Testbench
module tb_d_latch;
    reg d;
    reg en;
    wire q;

    d_latch uut (
        .d(d),
        .en(en),
        .q(q)
    );

    initial begin
        d = 0; en = 0;
        #10 d = 1;
        #10 en = 1;
        #10 d = 0;
        #10 d = 1;
        #10 en = 0;
        #10 d = 0;
        #10 d = 1;
        #10 $finish;
    end

    initial begin
        $monitor("Time=%0t | EN=%b | D=%b | Q=%b", $time, en, d, q);
    end
endmodule
