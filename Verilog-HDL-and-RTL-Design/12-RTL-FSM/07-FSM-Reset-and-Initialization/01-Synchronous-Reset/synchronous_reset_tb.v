module synchronous_reset_tb;

reg clk;
reg reset;
reg x;
wire y;

synchronous_reset DUT(
    .clk(clk),
    .reset(reset),
    .x(x),
    .y(y)
);

initial begin
    clk = 0;
    forever #5 clk <= ~clk;
end

initial begin
    $dumpfile("synchronous_reset.vcd");
    $dumpvars(0, synchronous_reset_tb);
end

initial begin
    reset = 1;
    x = 0;

    #10 reset = 0;
    #10 x = 1;
    #10 x = 0;

    #10 reset = 1;
    #10 reset = 0;

    #10 x = 1;
    #10 x = 0;
    #10;

    $finish;
end

endmodule
