module pipo_tb;

reg CLK;
reg clear;
reg [3:0] D;

wire [3:0] Q;

pipo DUT(
    .CLK(CLK),
    .clear(clear),
    .D(D),
    .Q(Q)
);

initial begin

    $dumpfile("pipo.vcd");
    $dumpvars(0, pipo_tb);

    // Initial values
    CLK = 0;
    clear = 1;
    D = 4'b0000;

    #10;

    // Release clear
    clear = 0;

    // Load 1010
    D = 4'b1010;

    #10;

    // Load 1100
    D = 4'b1100;

    #10;

    // Load 0111
    D = 4'b0111;

    #10;

    // Clear
    clear = 1;

    #10;

    $finish;

end

// Clock generation
always #5 CLK = ~CLK;

endmodule
