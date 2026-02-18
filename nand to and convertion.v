//Design
module nand_not(
input a, b,
output y
 );
 wire named_out;
    assign named_out = ~(a & b);
    assign y = ~(named_out);
endmodule

//Testbench
module nand_not_tb;
reg a, b;
wire y;

nand_not uut(
   .a(a),
   .b(b),
   .y(y)
   );
   
   initial begin
   #10; a = 0; b = 0;
   #10; a = 0; b = 1;
   #10; a = 1; b = 0;
   #10; a = 1; b = 1;
   #10; a = 1; b = 1;
   #20; $finish;
   end



endmodule



