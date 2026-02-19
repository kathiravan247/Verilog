//Design
module ms_jk_ff(
  input clk, j, k,
  output reg q, q_bar
);
  
  reg master_q;
  
  always @(posedge clk)begin
    if(!j && !k)
      master_q <= master_q;
    else if(!j && k)
      master_q <= 0;
    else if(j && !k)
      master_q <= 1;
    else
      master_q <= ~master_q;
  end
  
  always @(negedge clk)begin
    q <= master_q;
    q_bar <= ~master_q;
  end
endmodule

//Test bench
module ms_jk_ff_tb;
  reg clk, j ,k;
  wire q, q_bar;
  
  ms_jk_ff uut(
    .clk(clk),
    .j(j),
    .k(k),
    .q(q),
    .q_bar(q_bar)
  );
  
  always #5 clk = ~clk;
  initial begin
    dumpfile("ms_jk_ff.vcd");
    dumpvars(0,ms_jk_ff_tb);
    
    clk = 0;
    j = 0;
     k = 0;
    #10; j = 0; k = 0;
    #10; j = 0; k = 1;
    #10; j = 1; k = 0;
    #10; j = 1; k = 1;
    $finish;
  end
endmodule
