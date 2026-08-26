module async_3bit_up_counter_tb;

reg clk;
wire [2:0] Q;

async_3bit_up_counter DUT(
    .clk(clk),
    .Q(Q)
);

// Clock

initial begin

    clk = 0;

    forever #5 clk <= ~clk;

end

initial begin

    $dumpfile("async_3bit_up_counter.vcd");
    $dumpvars(0, async_3bit_up_counter_tb);

    #100;

    $finish;

end

endmodule