//Design
module traffic_4way(
input clk, rst,
  output reg[2:0] a, b, c, d
   );
  
  
  reg [2:0] state;
  
  
   parameter s0 = 3'b000,
             s1 = 3'b001, 
             s2 = 3'b010, 
             s3 = 3'b011,
             s4 = 3'b100,
             s5 = 3'b101,
             s6 = 3'b110,
             s7 = 3'b111;
             
  
  always @(posedge clk or posedge rst) begin
    if(rst)
      state<=s0;
    else
      state <= state + 1;
  end
  
  
  always@(*) begin
    case(state)
      
      s0:
        begin
        a = 3'b001;  // GREEN = 001,
        b = 3'b100;  // YELLOW = 010,
        c = 3'b100;  // RED = 1OO
        d = 3'b100;  
        end
      s1:
        begin
          a = 3'b010;
          b = 3'b100;
          c = 3'b100;
          d = 3'b100;
        end
      s2:
        begin
          a = 3'b100;
          b = 3'b001; 
          c = 3'b100;
          d = 3'b100;
        end
      s3:
        begin
          a = 3'b100;
          b = 3'b010;
          c = 3'b100; 
          d = 3'b100;
        end
      s4:
        begin
          a = 3'b100; 
          b = 3'b100;
          c = 3'b001;
          d = 3'b100;
        end
      s5:
        begin
          a = 3'b100;
          b = 3'b100;
          c = 3'b010;
          d = 3'b100;
        end
      s6:
        begin
          a = 3'b100;
          b = 3'b100;
          c = 3'b100;
          d = 3'b001;
        end
      s7:
        begin
          a = 3'b100;
          b = 3'b100;
          c = 3'b100;
          d = 3'b010;
        end
      
   endcase
    
        end
  
  endmodule




//testbench
module traffic_4way_tb;

reg clk;
reg rst;
  wire [2:0] a;
  wire [2:0] b;
  wire [2:0] c;
  wire [2:0] d;

traffic_4way dut(
.clk(clk),
.rst(rst),
  .a(a),
  .b(b),
  .c(c),
  .d(d)
);

initial
begin
clk = 0;
forever #5 clk = ~clk;
end

initial
begin
rst = 1;
#10 rst = 0;

#500 $finish;
end

initial
begin
  $monitor("time=%0t a=%b b=%b c=%b d=%b", $time, a, b, c, d);
  
end

endmodule









        
        
     
