//design
module sr_gatelatch(
  input s,r, e,
  output reg q, qn
);
  always @(*)begin
    if(e)begin
      case({s, r})
    2'b01 : begin
      q = 0;
      
    end
    2'b10: begin
      q = 1;
      
    end
    2'b11: begin
      q = 1;
      
    end
    2'b00: begin
      q = q;
      
    end
  endcase
 end
end
  assign qn=~q;
endmodule

//Testbench
module sr_gatelatchtb;
  reg s,r, e;
  wire q, qn;
  sr_gatelatch uut(.*);
  
  initial begin
    $dumpfile("sr_gatelatch.vcd");
    $dumpvars(0,sr_gatelatchtb);
    
    e = 1; s = 0; r = 0; #5;
    e = 1; s = 0; r = 1; #5;
    e = 1; s = 1; r = 0; #5;
    e = 1; s = 0; r = 0; #5;
    e = 1; s = 1; r = 1; #5;
    
    $finish;
  end
endmodule
  
