//Design
module demux_1to4 (
    input wire D,
    input wire [1:0] S,
    output reg [3:0] Y
);

    always @(*) begin
        Y = 4'b0000;
        
        case (S)
            2'b00 : Y[0] = D;
            2'b01 : Y[1] = D;
            2'b10 : Y[2] = D;
            2'b11 : Y[3] = D;
            default : Y = 4'b0000;
        endcase
    end

endmodule

//Test bench
module tb_demux_1to4;

    reg D;
    reg [1:0] S;
    wire [3:0] Y;

    demux_1to4 uut (
        .D(D), 
        .S(S), 
        .Y(Y)
    );

    initial begin
        $dumpfile("demux_waves.vcd");
        $dumpvars(0, tb_demux_1to4);

        $display("Time | S1 S0 | D | Y3 Y2 Y1 Y0");

        S = 2'b00; D = 0; #10;
        $display("%4t |  %b  | %b |    %b", $time, S, D, Y);
        S = 2'b00; D = 1; #10;
        $display("%4t |  %b  | %b |    %b", $time, S, D, Y);

        S = 2'b01; D = 0; #10;
        $display("%4t |  %b  | %b |    %b", $time, S, D, Y);
        S = 2'b01; D = 1; #10;
        $display("%4t |  %b  | %b |    %b", $time, S, D, Y);

        S = 2'b10; D = 0; #10;
        $display("%4t |  %b  | %b |    %b", $time, S, D, Y);
        S = 2'b10; D = 1; #10;
        $display("%4t |  %b  | %b |    %b", $time, S, D, Y);

        S = 2'b11; D = 0; #10;
        $display("%4t |  %b  | %b |    %b", $time, S, D, Y);
        S = 2'b11; D = 1; #10;
        $display("%4t |  %b  | %b |    %b", $time, S, D, Y);

        $finish;
    end

endmodule
