//Design
module comparator_2bit (
    input  wire A,
    input  wire B,
    output wire A_greater_B,
    output wire A_less_B,
    output wire A_equal_B
);

assign A_greater_B = A & ~B;
assign A_less_B    = ~A & B;
assign A_equal_B   = ~(A ^ B);

endmodule

//Test bench
module tb_comparator_2bit;
reg A;
reg B;
wire A_greater_B;
wire A_less_B;
wire A_equal_B;

comparator_2bit DUT (
    .A(A),
    .B(B),
    .A_greater_B(A_greater_B),
    .A_less_B(A_less_B),
    .A_equal_B(A_equal_B)
);

initial begin
 
    A = 0; B = 0; #10;
    A = 0; B = 1; #10;
    A = 1; B = 0; #10;
    A = 1; B = 1; #10;
    $finish;
end

endmodule
