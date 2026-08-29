module siso_tb;

reg CLK;
reg clear;
reg SI;

wire SO;

siso DUT(
    .CLK(CLK),
    .clear(clear),
    .SI(SI),
    .SO(SO)
);

initial begin

    $dumpfile("siso.vcd");
    $dumpvars(0, siso_tb);

    // Reset
    CLK = 0;
    clear = 1;
    SI = 0;

    #10;

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

always #5 CLK = ~CLK;

endmodule
