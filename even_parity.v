//Design
module e_p(
  input a, b, c,
  output y
);
  xor = y(a,b,c);
endmodule

//Testbench
module e_p_tb;
  reg a,b,c;
  wire y;
  
  e_p uut(
    .a(a),
    .b(b),
    .c(c),
    .y(y)
  );
  
  initial begin
    $dumpfile("e_p.vcd");
    $dumpvars(0,e_p_tb);
    
    #10; a = 0; b = 0;
    #10; a = 0; b = 1;
    #10; a = 1; b = 0;
    #10; a = 1; b = 1;
    $display;
  end
endmodule
