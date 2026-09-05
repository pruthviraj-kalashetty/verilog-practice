module moore_fsm_tb;
  reg clk;
  reg x;

  wire y;

   moore_fsm DUT(
    .clk(clk),
    .x(x),
    .y(y)
   );

initial begin
  clk = 0;
  forever #5 clk <= ~clk;
end

initial begin
  $dumpfile("moore_fsm.vcd");
  $dumpvars(0, moore_fsm_tb);

end

initial begin
   #0 x = 0;

   #10 x = 1;

   #10 x = 0;

   #10 x = 1;

   #10 x = 1;

   #10 x = 0;

   $finish;
end
endmodule   
