//Design
module mux2to1(
    input i0,
    input i1,
    input sel,
    output y
);

    assign y = sel ? i1 : i0;

endmodule

//Test bench
module mux2to1_tb;

    reg i0;
    reg i1;
    reg sel;
    wire y;

    mux2to1 uut (
        .i0(i0),
        .i1(i1),
        .sel(sel),
        .y(y)
    );

    initial begin
        $monitor("Time=%0t | sel=%b i0=%b i1=%b | y=%b", $time, sel, i0, i1, y);

        sel = 0; i0 = 0; i1 = 0;
        #10;
        sel = 0; i0 = 1; i1 = 0;
        #10;
        sel = 0; i0 = 0; i1 = 1;
        #10;
        sel = 0; i0 = 1; i1 = 1;
        #10;
        sel = 1; i0 = 0; i1 = 0;
        #10;
        sel = 1; i0 = 1; i1 = 0;
        #10;
        sel = 1; i0 = 0; i1 = 1;
        #10;
        sel = 1; i0 = 1; i1 = 1;
        #10;
        
        $finish;
    end

endmodule
