//Design
module single_port_ram #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 4
) (
    input wire clk,
    input wire we,
    input wire [ADDR_WIDTH-1:0] addr,
    input wire [DATA_WIDTH-1:0] din,
    output reg [DATA_WIDTH-1:0] dout
);

    reg [DATA_WIDTH-1:0] ram [0:(1<<ADDR_WIDTH)-1];

    always @(posedge clk) begin
        if (we) begin
            ram[addr] <= din;
        end
        dout <= ram[addr];
    end

endmodule

//testbench
module tb_single_port_ram;

    parameter DATA_WIDTH = 8;
    parameter ADDR_WIDTH = 4;

    reg clk;
    reg we;
    reg [ADDR_WIDTH-1:0] addr;
    reg [DATA_WIDTH-1:0] din;
    wire [DATA_WIDTH-1:0] dout;

    single_port_ram #(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH)
    ) dut (
        .clk(clk),
        .we(we),
        .addr(addr),
        .din(din),
        .dout(dout)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        we = 0;
        addr = 0;
        din = 0;

        #10;
        
        we = 1; addr = 4'h0; din = 8'hAA; #10;
        we = 1; addr = 4'h1; din = 8'hBB; #10;
        we = 1; addr = 4'h2; din = 8'hCC; #10;

        we = 0; addr = 4'h0; #10;
        we = 0; addr = 4'h1; #10;
        we = 0; addr = 4'h2; #10;
        
        #20 $finish;
    end

    initial begin
        $monitor("Time=%0t | we=%b | addr=%h | din=%h | dout=%h", $time, we, addr, din, dout);
    end

endmodule
