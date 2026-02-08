//Design
module mux4_to_1 (
    input [3:0] I,
    input [1:0] S,
    output reg Y
);

    always @(*) begin
        case (S)
            2'b00: Y = I[0];
            2'b01: Y = I[1];
            2'b10: Y = I[2];
            2'b11: Y = I[3];
            default: Y = 1'bx;
        endcase
    end

endmodule

//Test bench
module tb_mux4_to_1;

    reg [3:0] I;
    reg [1:0] S;
    wire Y;

    mux4_to_1 uut (
        .I(I), 
        .S(S), 
        .Y(Y)
    );

    initial begin
        $monitor("Time = %0t | Sel = %b | Input = %b | Output = %b", $time, S, I, Y);

        I = 4'b1010;
        S = 2'b00;

        #10 S = 2'b01;
        #10 S = 2'b10;
        #10 S = 2'b11;

        #10 I = 4'b0101;
        S = 2'b00;
        
        #10 S = 2'b01;
        #10 S = 2'b10;
        #10 S = 2'b11;

        #10 $finish;
    end

endmodule
