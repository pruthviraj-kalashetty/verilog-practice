module sipo_tb;

reg CLK;
reg clear;
reg SI;

wire [3:0] Q;

sipo DUT(
    .CLK(CLK),
    .clear(clear),
    .SI(SI),
    .Q(Q)
);

initial begin

    $dumpfile("sipo.vcd");
    $dumpvars(0, sipo_tb);

    // Initial values
    CLK = 0;
    clear = 1;
    SI = 0;

    #10;

    // Release clear
    clear = 0;

    // Send 1
    SI = 1;
    #10;

    // Send 0
    SI = 0;
    #10;

    // Send 1
    SI = 1;
    #10;

    // Send 1
    SI = 1;
    #10;

    $finish;

end

// Clock generation
always #5 CLK = ~CLK;

endmodule
