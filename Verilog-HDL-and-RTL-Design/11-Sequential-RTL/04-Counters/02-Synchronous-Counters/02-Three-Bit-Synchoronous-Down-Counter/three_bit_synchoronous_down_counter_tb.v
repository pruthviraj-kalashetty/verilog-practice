module sync_3bit_down_counter_tb;

reg clk;
wire [2:0] Q;

sync_3bit_down_counter DUT(
    .clk(clk),
    .Q(Q)
);

// Clock

initial begin
    clk = 0;
    forever #5 clk <= ~clk;
end

initial begin
    $dumpfile("sync_3bit_down_counter.vcd");
    $dumpvars(0, sync_3bit_down_counter_tb);

    #100;

    $finish;
end

endmodule