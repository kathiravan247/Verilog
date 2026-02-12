//Design
module sr_latch(
  input S, 
  input R,
  output reg Q
);
  always @(S or R)begin
    if(S && !R)
      Q=1;
    else if(!S && R )
      Q=0;
    else if(!S && !R)
      Q=Q;
    else
      Q=1'bx;
  end
endmodule

//Testbench
module sr_latch_tb;
  reg S;
  reg R;
  wire Q;
  
  sr_latch uut (
    .S(S),
    .R(R),
    .Q(Q)
  );
  
  initial begin
    $dumpfile("sr_latch.vcd");
    $dumpvars(0,sr_latch_tb);
    $monitor("Time=%0t | S=%b R=%b| Q=%b", $time, S, R, Q);
    
    S = 0; R = 0; #10;
    S = 1; R = 0; #10;
    S = 0; R = 0; #10;
    S = 0; R = 1; #10;
    S = 0; R = 0; #10;
    S = 1; R = 1; #10; 
    $finish;
  end
endmodule
