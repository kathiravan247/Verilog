//Design
module and_gate(
  input a,b,
  output y
);
  assign y = a & b;
endmodule

//Test bench
module tb_and_gate;
  reg a, b;
  wire y;
  
  and_gate DUT(
    .a(a),
    .b(b),
    .y(y)
 );
  
  initial begin
    $display("Time a b | y");
    $monitor( "Time=%0t a=%b,b=%b|y=%b", $time, a, b, y);
    
    a = 0; b = 0; #10;
    a = 0; b = 1; #10;
    a = 1; b = 0; #10;
    a = 1; b = 1; #10;
    
    $finish;
  end
endmodule
