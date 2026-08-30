module d_flip_flop_tb;
   reg D, CLK;

   wire Q;
   wire Q_bar;

   d_flip_flop DUT(
    .D(D),
    .CLK(CLK),
    .Q(Q),
    .Q_bar(Q_bar)

   );

    // Clock Generation
    initial begin 
      CLK = 0;
        forever #5 CLK = ~CLK;
    end

    initial begin
      $dumpfile("d_flip_flop.vcd");
      $dumpvars(0, d_flip_flop_tb);

      D = 0;

      #10;

      D = 1;

      #10;

      D = 0;

      #10;

      D = 1;

      #10;

      $finish;
    end
endmodule      


