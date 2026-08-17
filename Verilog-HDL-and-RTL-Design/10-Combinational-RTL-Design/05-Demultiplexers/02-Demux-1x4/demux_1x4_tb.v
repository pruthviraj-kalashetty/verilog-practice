module demux_1to4_tb;
   
   reg D, S1, S0;

   wire Y3, Y2, Y1, Y0;

   demux_1to4 DUT(
    .D(D),
    .S1(S1),
    .S0(S0),
    
    .Y0(Y0),
    .Y1(Y1),
    .Y2(Y2),
    .Y3(Y3)

   );

   initial begin
      $dumpfile("demux_1to4.vcd");
      $dumpvars(0, demux_1to4_tb);

       // D = 0, S1S0 = 00 . Y0 = 0, Y1 = 0, Y2 = 0, Y3 = 0

        D = 0;
        S1 = 0;
        S0 = 0;

        #10;

        // D = 0, S1S0 = 01 . Y0 = 0, Y1 = 0, Y2 = 0, Y3 = 0

        D = 0;
        S1 = 0;
        S0 = 1;

        #10;

        // D = 0, S1S0 = 10 . Y0 = 0, Y1 = 0, Y2 = 0, Y3 = 0

        D = 0;
        S1 = 1;
        S0 = 0;

        #10;

        // D = 0, S1S0 = 11 . Y0 = 0, Y1 = 0, Y2 = 0, Y3 = 0

        D = 0;
        S1 = 1;
        S0 = 1;

        #10;

        // D = 1, S1S0 = 00 . D goes to Y0

        D = 1;
        S1 = 0;
        S0 = 0;

        #10;

        // D = 1, S1S0 = 01 . D goes to Y1

        D = 1;
        S1 = 0;
        S0 = 1;

        #10;

        // D = 1, S1S0 = 10 . D goes to Y2

        D = 1;
        S1 = 1;
        S0 = 0;

        #10;

        // D = 1, S1S0 = 11 . D goes to Y3

        D = 1;
        S1 = 1;
        S0 = 1;

        #10;

        $finish;

    end

endmodule