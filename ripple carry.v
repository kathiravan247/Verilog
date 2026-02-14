//Design
module ripple_carry_adder_4bit (
    input  [3:0] A,
    input  [3:0] B,
    input  Cin,
    output [3:0] Sum,
    output Cout
);

wire C1, C2, C3;

full_adder FA0 (A[0], B[0], Cin, Sum[0], C1);
full_adder FA1 (A[1], B[1], C1,  Sum[1], C2);
full_adder FA2 (A[2], B[2], C2,  Sum[2], C3);
full_adder FA3 (A[3], B[3], C3,  Sum[3], Cout);

endmodule




//Testbench
module ripple_carry_adder_tb;

reg  [3:0] A;
reg  [3:0] B;
reg  Cin;

wire [3:0] Sum;
wire Cout;

ripple_carry_adder_4bit uut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout)
);

initial begin

    $dumpfile("ripple.vcd");
    $dumpvars(0, ripple_carry_adder_tb);

    $display("Time A B Cin | Sum Cout");

    A=4'b0000; B=4'b0000; Cin=0; #10;
    A=4'b0011; B=4'b0101; Cin=0; #10;
    A=4'b0110; B=4'b0011; Cin=1; #10;
    A=4'b1111; B=4'b0001; Cin=0; #10;
    A=4'b1010; B=4'b0101; Cin=1; #10;

    $finish;

end

initial begin
    $monitor("%0t %b %b %b | %b %b", $time, A, B, Cin, Sum, Cout);
end

endmodule
