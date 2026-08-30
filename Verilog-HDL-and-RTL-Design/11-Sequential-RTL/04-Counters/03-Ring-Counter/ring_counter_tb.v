module ring_counter_4bit_tb;
  reg clk;
  wire [3:0] Q;

  ring_counter_4bit DUT(
    .clk(clk)'
    .Q(Q),
  );

initial begin
  clk = 0;
  forever #5 clk <= ~clk;
end  

initial begin 
  $dumpfile("ring_counter_4bit.vcd");
  $dumpvers(0, ring_counter_4bit_tb);

  #100;

  $finish;
end
endmodule  