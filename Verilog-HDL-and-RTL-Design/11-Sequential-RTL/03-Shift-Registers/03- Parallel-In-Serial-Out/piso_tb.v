module piso_tb;

reg CLK;
reg clear;
reg load;
reg [3:0] P;

wire SO;

piso DUT(
    .CLK(CLK),
    .clear(clear),
    .load(load),
    .P(P),
    .SO(SO)
);

initial begin

    $dumpfile("piso.vcd");
    $dumpvars(0, piso_tb);

    // Initial values
    CLK = 0;
    clear = 1;
    load = 0;
    P = 4'b0000;

    #10;

    // Release clear
    clear = 0;

    // Parallel load
    P = 4'b1011;
    load = 1;

    #10;

    // Start shifting
    load = 0;

    #10;
    #10;
    #10;
    #10;

    $finish;

end

// Clock generation
always #5 CLK = ~CLK;

endmodule
