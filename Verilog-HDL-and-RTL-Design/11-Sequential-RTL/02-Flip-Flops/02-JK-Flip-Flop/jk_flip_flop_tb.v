module jk_flip_flop_tb;
   reg J, K, CLK;

   wire Q, Q_bar;

   jk_flip_flop DUT(
    .J(J),
    .K(K),
    .CLK(CLK),
    .Q(Q),
    .Q_bar(Q_bar)

   );

   //clock generation

   initial begin
   CLK = 0;
     forever #5 CLK = ~CLK;
    end 

    initial begin
      $dumpfile("jk_flip_flop.vcd");
      $dumpvars(0, jk_flip_flop_tb);

        J = 1;
        K = 0;

        #10;

        // 00 - HOLD
        J = 0;
        K = 0;

        #10;

        // 01 - RESET
        J = 0;
        K = 1;

        #10;

        // 10 - SET
        J = 1;
        K = 0;

        #10;

        // 11 - TOGGLE
        J = 1;
        K = 1;

        #10;

        // 11 - TOGGLE again
        J = 1;
        K = 1;

        #10;

        $finish;

    end

endmodule


