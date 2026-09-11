module binary_encoding_tb;

reg clk;
reg x;
wire y;

binary_encoding DUT(
    .clk(clk),
    .x(x),
    .y(y)
);

initial begin
    clk = 0;
    forever #5 clk <= ~clk;
end

initial begin
    $dumpfile("binary_encoding.vcd");
    $dumpvars(0, binary_encoding_tb);
end

initial begin
    x = 0;
    #10 x = 1;
    #10 x = 0;
    #10 x = 1;
    #10 x = 1;
    #10 x = 0;
    #10;

    $finish;
end

endmodule