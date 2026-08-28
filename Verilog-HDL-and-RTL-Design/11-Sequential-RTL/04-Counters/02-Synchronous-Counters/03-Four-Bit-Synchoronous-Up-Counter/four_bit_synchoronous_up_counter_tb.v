module sync_4bit_up_counter_tb;
  reg clk;
  wire [2:0] Q;

  sync_4bit_up_counter DUT(
    .clk(clk),
    .Q(Q)
  );

  initial begin
    clk = 0;
    forever #5 clk <= ~clk;
  end

  initial begin
    $dumpfile("sync_4bit_up_counter.vcd");
    $dumpvars(0, sync_4bit_up_counter_tb);

    #1000;
    $finish;
  end
endmodule  



