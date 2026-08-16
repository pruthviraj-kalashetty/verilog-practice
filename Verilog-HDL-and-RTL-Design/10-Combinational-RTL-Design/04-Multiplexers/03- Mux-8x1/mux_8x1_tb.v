module mux_8to1_tb;
   
   reg I0, I1, I2,I3, I4, I5, I6, I7;
   
   reg S2, S1, S0;

   wire Y;

   mux_8to1 DUT(
    .I0(I0),
    .I1(I1),
    .I2(I2),
    .I3(I3),    
    .I4(I4),
    .I5(I5),
    .I6(I6),
    .I7(I7),
    .S1(S1),
    .S2(S2),
    .S3(S3),
    .Y(Y)
   
   );

   initial begin
      $dumpfile("mux_8to1.vcd");
      $dumpvars(0, mux_8to1_tb);

      //Input value

      I0 = 0;
      I1 = 1;
      I2 = 0;
      I3 = 1;
      I4 = 0;
      I5 = 1;
      I6 = 0;
      I7 = 1;

      // S2S1S0 = 000 → select I0

      S2 = 0;
      S1 = 0;
      S0 = 0;

      #10;

      // S2S1S0 = 001 → select I1

      S2 = 0;
      S1 = 0;
      S0 = 1;

      #10;

      // S2S1S0 = 010 → select I2

      S2 = 0;
      S1 = 1;
      S0 = 0;

      #10;

      // S2S1S0 = 011 → select I3

      S2 = 0;
      S1 = 1;
      S0 = 1;

      #10;

      // S2S1S0 = 100 → select I4

      S2 = 1;
      S1 = 0;
      S0 = 0;

      #10;

      // S2S1S0 = 101 → select I5

      S2 = 1;
      S1 = 0;
      S0 = 1;

      #10;

      // S2S1S0 = 110 → select I6

      S2 = 1;
      S1 = 1;
      S0 = 0;

      #10;

      // S2S1S0 = 111 → select I7

      S2 = 1;
      S1 = 1;
      S0 = 1;

      #10;

      $finish;

    end

endmodule

