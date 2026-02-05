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

module full_subtractor(
    input a,
    input b,
    input bin,
    output diff,
    output bout
);

    wire w_diff;
    wire w_borrow1;
    wire w_borrow2;

    half_subtractor hs1 (
        .a(a), 
        .b(b), 
        .diff(w_diff), 
        .borrow(w_borrow1)
    );

    half_subtractor hs2 (
        .a(w_diff), 
        .b(bin), 
        .diff(diff), 
        .borrow(w_borrow2)
    );

    assign bout = w_borrow1 | w_borrow2;

endmodule

//test bench
module full_subtractor_tb;

    reg a;
    reg b;
    reg bin;
    wire diff;
    wire bout;

    full_subtractor uut (
        .a(a),
        .b(b),
        .bin(bin),
        .diff(diff),
        .bout(bout)
    );

    initial begin
        $monitor("Time=%0t | a=%b b=%b bin=%b | diff=%b bout=%b", $time, a, b, bin, diff, bout);

        a = 0; b = 0; bin = 0;
        #10;
        a = 0; b = 0; bin = 1;
        #10;
        a = 0; b = 1; bin = 0;
        #10;
        a = 0; b = 1; bin = 1;
        #10;
        a = 1; b = 0; bin = 0;
        #10;
        a = 1; b = 0; bin = 1;
        #10;
        a = 1; b = 1; bin = 0;
        #10;
        a = 1; b = 1; bin = 1;
        #10;

        $finish;
    end

endmodule
