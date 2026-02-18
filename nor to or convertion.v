//Design
module nor_or(
    input a, 
    input b,
    output y_nor, 
    output y_or  
);

    
    assign y_nor = ~(a | b); 
    
    
    assign y_or = ~y_nor;

endmodule

//Test bench
module nor_or_tb;
    reg a, b;
    wire y_nor, y_or;

    nor_or uut(
       .a(a),
       .b(b),
       .y_nor(y_nor),
       .y_or(y_or)
    );
       
    initial begin
       
        $dumpfile("nor_or.vcd");
        $dumpvars(0, nor_or_tb);

        
        #10; a = 0; b = 0;
        #10; a = 0; b = 1;
        #10; a = 1; b = 0;
        #10; a = 1; b = 1;

        #10; $finish;
    end
endmodule
