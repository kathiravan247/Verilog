//design
module dual_port_ram #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 4
) (
    input wire clk_a,
    input wire we_a,
    input wire [ADDR_WIDTH-1:0] addr_a,
    input wire [DATA_WIDTH-1:0] din_a,
    output reg [DATA_WIDTH-1:0] dout_a,

    input wire clk_b,
    input wire we_b,
    input wire [ADDR_WIDTH-1:0] addr_b,
    input wire [DATA_WIDTH-1:0] din_b,
    output reg [DATA_WIDTH-1:0] dout_b
);

    reg [DATA_WIDTH-1:0] ram [0:(1<<ADDR_WIDTH)-1];

    always @(posedge clk_a) begin
        if (we_a) begin
            ram[addr_a] <= din_a;
        end
        dout_a <= ram[addr_a];
    end

    always @(posedge clk_b) begin
        if (we_b) begin
            ram[addr_b] <= din_b;
        end
        dout_b <= ram[addr_b];
    end

endmodule

//testbench
module tb_dual_port_ram;

    parameter DATA_WIDTH = 8;
    parameter ADDR_WIDTH = 4;

    reg clk_a;
    reg we_a;
    reg [ADDR_WIDTH-1:0] addr_a;
    reg [DATA_WIDTH-1:0] din_a;
    wire [DATA_WIDTH-1:0] dout_a;

    reg clk_b;
    reg we_b;
    reg [ADDR_WIDTH-1:0] addr_b;
    reg [DATA_WIDTH-1:0] din_b;
    wire [DATA_WIDTH-1:0] dout_b;

    dual_port_ram #(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH)
    ) dut (
        .clk_a(clk_a), .we_a(we_a), .addr_a(addr_a), .din_a(din_a), .dout_a(dout_a),
        .clk_b(clk_b), .we_b(we_b), .addr_b(addr_b), .din_b(din_b), .dout_b(dout_b)
    );

    always #5 clk_a = ~clk_a;
    always #5 clk_b = ~clk_b;

    initial begin
        clk_a = 0; we_a = 0; addr_a = 0; din_a = 0;
        clk_b = 0; we_b = 0; addr_b = 0; din_b = 0;

        #10;
        
        we_a = 1; addr_a = 4'h0; din_a = 8'h11; #10;
        we_a = 1; addr_a = 4'h1; din_a = 8'h22; #10;
        we_a = 0;

        we_b = 1; addr_b = 4'h2; din_b = 8'h33; #10;
        we_b = 1; addr_b = 4'h3; din_b = 8'h44; #10;
        we_b = 0;

        addr_b = 4'h0; #10;
        addr_b = 4'h1; #10;
        
        addr_a = 4'h2; #10;
        addr_a = 4'h3; #10;
        
        #20 $finish;
    end

    initial begin
        $monitor("Time=%0t | A: we=%b addr=%h din=%h dout=%h | B: we=%b addr=%h din=%h dout=%h", 
                 $time, we_a, addr_a, din_a, dout_a, we_b, addr_b, din_b, dout_b);
    end

endmodule




