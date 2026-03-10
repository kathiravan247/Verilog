//Design
module traffic_2way(
input clk, rst,
output reg[2:0] a, b
   );
  reg [1:0] state;
   parameter s0 = 2'b00,
             s1 = 2'b01, 
             s2 = 2'b10, 
             s3 = 2'b11; 
  always @(posedge clk or posedge rst) begin
    if(rst)
      state<=s0;
    else
      state = state + 1;
  end
  
  always@(*) begin
    case(state)
      
      s0:
        begin
        a = 3'b001;
        b = 3'b100;
        end
      s1:
        begin
          a = 3'b010;
          b = 3'b100;
        end
      s2:
        begin
          a = 3'b100;
          b = 3'b001;
        end
      s3:
        begin
          a = 3'b100;
          b = 3'b010;
        end
      
   endcase
    
        end
  
  endmodule

      

//Testbench
module traffic_2way_tb;
reg clk, rst;
wire [2:0] a, b;
 
traffic_2way uut(.clk(clk), .rst(rst), .a(a), .b(b));
  

initial
begin
clk = 0;
forever #5 clk = ~clk;
end

initial
begin
rst = 1;
#10 rst = 0;

#100 $finish;
end

initial
begin
  $monitor("time=%0t a=%b b=%b", $time, a, b);
end

endmodule



