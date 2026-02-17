//Design
module master_slave_dff(
  input d, clk,
  output reg q
);
  
  reg master;
  
  always@(posedge clk)begin
    master <=d;
  end
  
  always @(negedge clk)begin
    q <= master;
   end
endmodule  

//Testbench
module master_slave_dff_tb;
  reg d, clk;
  wire q;
  
 master_slave_dff uut(
    .d(d),
    .clk(clk),
    .q(q)
  );
    
  always #5 clk = ~clk;
  initial begin
    $dumpfile("master_slave_dff.vcd");
    $dumpvars(0,master_slave_dff_tb);
    clk = 0;
    d = 0;
    
    #10; d = 0;
    #10; d = 1;
    #10; d = 0;
    #10; d = 1;
    #10; d = 0;
    #10; d = 1;
    
    $finish;
    
  end
endmodule
  
  
