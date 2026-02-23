//design
module o_p(
  input a, b,
  output y
);
  xnor (y,a,b);
endmodule

//Testbench
module o_p_tb;
  reg a, b;
  wire y;
  
  o_p uut(
    .a(a),
    .b(b),
    .y(y)
  );
  
  initial begin
    $monitor("Time=0%t | a=%b, b=%b, y=%b",$time,a,b,y);
     #10; a = 0; b = 0;
     #10; a = 0; b = 1;
     #10; a = 1; b = 0;
     #10; a = 1; b = 1;
    $finish;
  end
endmodule
