//Design
module clk_div2(input clk, rst,
                output reg q
               );
  always @(posedge clk or posedge rst)
  begin
    
    if(rst)
      q <= 0;
    else
      q <= ~q;
  end
endmodule

//testbench
module clk_div2_tb;
  reg clk, rst;
  wire q;
  
  clk_div2 uut(
    .clk(clk),
    .rst(rst),
    .q(q)
  );
  
  initial begin
    $monitor("time=%0t | clk=%b, rst=%b, q=%b", $time, q, clk, rst);
    
    clk = 0;
    rst = 1;
    
    #1 rst = 0;
    #10 $finish;
    
    
  end
  always #5 clk = ~clk;
    
endmodule
    
    
    
    
    
    
    
    

