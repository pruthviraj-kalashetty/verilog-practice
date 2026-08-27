module async_4bit_down_counter_tb;
   reg clk;
   wire [3:0] Q;

   async_4bit_down_counter DUT(
    .clk(clk),
    .Q(Q)
   );

// Clock

initial begin
   clk = 0;
   forever #5 clk <= ~clk;
end

initial begin 
  $dumpfile("async_4bit_down_counter.vcd");
  $dumpvars(0, async_4bit_down_counter_tb);

  #200;

  $finish;
end
endmodule       

