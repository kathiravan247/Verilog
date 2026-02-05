//Design
module half_subtractor(
    input a,
    input b,
    output diff,
    output borrow
);

    assign diff = a ^ b;
    assign borrow = (~a) & b;

endmodule

//Test bench
module half_subtractor_tb;

    reg a;
    reg b;
    wire diff;
    wire borrow;

    half_subtractor uut (
        .a(a),
        .b(b),
        .diff(diff),
        .borrow(borrow)
    );

    initial begin
        $monitor("Time=%0t | a=%b b=%b | diff=%b borrow=%b", $time, a, b, diff, borrow);

        a = 0; b = 0;
        #10;
        a = 0; b = 1;
        #10;
        a = 1; b = 0;
        #10;
        a = 1; b = 1;
        #10;

        $finish;
    end

endmodule
