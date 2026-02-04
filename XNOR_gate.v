//Design
module xnor_gate(
  input a, b,
  output y
);
  assign y = a ~^ b;
endmodule

//Test bench
module xnor_gatetb;
  reg a, b;
  wire y;
  
  
  xnor_gate Dut(
    .a(a),
    .b(b),
    .y(y)
  );

  initial begin
    $monitor("Time=%0t, a=%b, b=%b | y=%b", $time, a, b, y);
    
    a = 0; b = 0; #10;
    a = 0; b = 1; #10;
    a = 1; b = 0; #10;
    a = 1; b = 1; #10;
    
    $finish;
  end
endmodule
  
