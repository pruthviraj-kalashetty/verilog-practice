module encoder_16to4_tb;
   reg A, B;
   wire A_greater_B;
   wire A_equal_B;
   wire A_less_B;

   encoder_16to4 DUT(
    .A(A),
    .B(A),
    .A_greater_B(A_greater_B),
    .A_equal_B(A_equal_B),
    .A_less_B(A_less_B)
   );

   initial begin
     $dumpfile("encoder_16to4.vcd");
     $dumpvars(0, encoder_16to4_tb);

     
        // A = 0, B = 0 → A = B

        A = 0;
        B = 0;

        #10;

        // A = 0, B = 1 → A < B

        A = 0;
        B = 1;

        #10;

        // A = 1, B = 0 → A > B

        A = 1;
        B = 0;

        #10;

        // A = 1, B = 1 → A = B

        A = 1;
        B = 1;

        #10;

        $finish;

    end

endmodule 
