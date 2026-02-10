//Design
module decoder_3to8 (
    input  [2:0] binary_in,
    input        enable,
    output [7:0] decoder_out
);

    assign decoder_out = (enable) ? (1'b1 << binary_in) : 8'b0;

endmodule



//Testbench
module tb_decoder;

    reg [2:0] binary_in;
    reg enable;
    wire [7:0] decoder_out;

    decoder_3to8 uut (
        .binary_in(binary_in), 
        .enable(enable), 
        .decoder_out(decoder_out)
    );

    initial begin
        enable = 0;
        binary_in = 0;
        #100;
        
        enable = 0; 
        binary_in = 3'b101; 
        #10;
        
        enable = 1;
        for (integer i = 0; i < 8; i = i + 1) begin
            binary_in = i;
            #10;
        end

        #20;
        $stop;
    end
      
    initial begin
        $monitor("%0t\t %b\t %b\t %b", $time, enable, binary_in, decoder_out);
    end

endmodule
