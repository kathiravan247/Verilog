//Design
module encoder_4to2 (
    input [3:0] i,
    output [1:0] y
);

    assign y[1] = i[2] | i[3];
    assign y[0] = i[1] | i[3];

endmodule

//Testbench
module encoder_tb;
    reg [3:0] i;
    wire [1:0] y;

    encoder_4to2 uut (
        .i(i),
        .y(y)
    );

    initial begin
        i = 4'b0001; #10;
        i = 4'b0010; #10;
        i = 4'b0100; #10;
        i = 4'b1000; #10;
        $finish;
    end

    initial begin
        $monitor("Input i=%b | Output y=%b", i, y);
    end
endmodule
