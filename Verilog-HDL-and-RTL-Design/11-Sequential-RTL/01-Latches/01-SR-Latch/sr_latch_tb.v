module sr_latch_tb;
  reg S, R;

  wire Q, Q_bar;

  sr_latch DUT(
    .S(S),
    .R(R),
    .Q(Q),
    .Q_bar(Q_bar)
  );

   initial begin

      $dumpfile("sr_latch.vcd");
      $dumpvars(0, sr_latch_tb);

      S = 0;
      R = 0;

      #10;

      S = 0;
      R = 1;

      #10;

      S = 1;
      R = 0;

      #10;

      S = 1;
      R = 1;

      #10;

      $finish;

     end

endmodule      

  
