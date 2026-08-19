module decoder_2to4_tb;

    reg A, B;
    
    wire[3:0]  Y;


    decoder_2to4 DUT(
        .A(A),
        .B(B),
        .Y(Y)

    );

    initial begin 
      $dumpfile("decoder_2to4.vcd");
      $dumpvars(0, decoder_2to4_tb);
      
      // A B = 00 → Y = 0001

      A = 0;
      B = 0;

      #10;

      // A B = 01 → Y = 0010

      A = 0;
      B = 1;

      // A B = 10 → Y = 0100

      #10;

      A = 1;
      B = 0;

      #10;

      // A B = 11 → Y = 1000

      A = 1;
      B = 1;

      #10;

      $finish;

    end

endmodule      