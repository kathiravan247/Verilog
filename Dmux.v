//Design
module dmux_1to2 (
    input in,
    input sel,
    output out0,
    output out1
);
    assign out0 = in & (~sel);
    assign out1 = in & sel;
endmodule

//Test bench
module tb_dmux_1to2;
    reg in;
    reg sel;
    wire out0;
    wire out1;

    dmux_1to2 uut (
        .in(in),
        .sel(sel),
        .out0(out0),
        .out1(out1)
    );

    initial begin
        $monitor("Time=%0t | in=%b sel=%b | out0=%b out1=%b", $time, in, sel, out0, out1);
        
        in = 0; sel = 0;
        #10;
        in = 1; sel = 0;
        #10;
        in = 0; sel = 1;
        #10;
        in = 1; sel = 1;
        #10;
        
        $finish;
    end
endmodule
