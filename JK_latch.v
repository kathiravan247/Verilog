//Design
module jk_latch(
    input j,
    input k,
    input en,
    output reg q,
    output qbar
);
assign qbar = ~q;

always @ (j or k or en)
begin
    if (en)
        case ({j,k})
            2'b00: q = q;
            2'b01: q = 1'b0;
            2'b10: q = 1'b1;
            2'b11: q = ~q;
        endcase
end
endmodule

//Test bench
module tb_jk_latch;
reg j;
reg k;
reg en;
wire q;
wire qbar;

jk_latch uut(
    .j(j),
    .k(k),
    .en(en),
    .q(q),
    .qbar(qbar)
);

initial begin
    en = 0; j = 0; k = 0;
    #10 en = 1; j = 0; k = 0;
    #10 j = 0; k = 1;
    #10 j = 1; k = 0;
    #10 j = 1; k = 1;
    #10 j = 0; k = 0;
    #10 en = 0; j = 1; k = 1;
    #10 $finish;
end
endmodule
