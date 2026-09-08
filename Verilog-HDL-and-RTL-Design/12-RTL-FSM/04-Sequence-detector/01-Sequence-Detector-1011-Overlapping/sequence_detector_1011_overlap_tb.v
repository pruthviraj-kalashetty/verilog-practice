module sequence_detector_1011_overlap_tb;
   reg clk;
   reg x;

   wire y;

   sequence_detector_1011_overlap DUT(
    .clk(clk),
    .x(x),
    .y(y)
   );

initial begin 
  clk = 0;
  forever #5 clk <= ~clk;    
end 

initial begin
   $dumpfile("sequence_detector_1011_overlap.vcd");
   $dumpvars(0, sequence_detector_1011_overlap_tb);
end

initial begin

    x = 0;
  #10 x = 1;
  #10 x = 0;
  #10 x = 1;
  #10 x = 1;

  $finish;
end     

endmodule
