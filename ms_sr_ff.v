//Design
module ms_sr_ff (
  input s, r, clk,
  output reg q, q_bar
);
  
  reg master_q;
  
  always @(posedge clk) begin
  if(s && !r)
    master_q <= 1;
  else if(!s && r )
    master_q <= 0;
  end
  
  always @(negedge clk) begin
    q <= master_q;
    q_bar <= ~master_q;
  end
endmodule
  
//Testbench
module ms_sr_ff_tb;
  reg s, r, clk;
  wire q, q_bar;
  
 ms_sr_ff uut(
    .s(s),
    .r(r),
    .clk(clk),
    .q(q),
    .q_bar(q_bar)
  );
  
  always #5 clk = ~clk;
  initial begin
    clk = 0;
    s = 0; 
    r = 0;
    $dumpfile("ms_sr_ff.vcd");
    $dumpvars(0,ms_sr_ff_tb);
   
    
     #10; s = 0; r = 0;
     #10; s = 1; r = 0;
     #10; s = 1; r = 1;
     #10; s = 0; r = 0;
     #10; s = 1; r = 1;
    $finish;
  end
endmodule
