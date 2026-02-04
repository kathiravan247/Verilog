//Design
module not_gate(
    input a, 
    output y
);
    assign y = ~a; 
endmodule

//Test bench
module not_gatetb;
  reg a;
  wire y;

 
  not_gate Dut(
    .a(a),
    .y(y)
  );

  initial begin
    $monitor("Time=%0t, a=%b | y=%b", $time, a, y);
    
    a = 0; #10;
    a = 1; #10;
    
    $finish;
  end
endmodule

