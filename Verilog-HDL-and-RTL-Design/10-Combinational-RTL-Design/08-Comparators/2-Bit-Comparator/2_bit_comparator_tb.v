module 2_bit_comparator_tb;
   reg A0, A1, B0, B1;

   wire A_greater_B;
   wire A_equal_B;
   wire A_less_B;

   2_bit_comparator DUT(
    .A0(A0),
    .A1(A1),
    .B0(B0),
    .B1(B1)
   );

   initial begin 
   $dumpfile("1_bit_comparator");
   $dumpvars(0, 1_bit_comparator_tb);

   // A = 00, B = 00  A = B
        A1 = 0;
        A0 = 0;
        B1 = 0;
        B0 = 0;

        #10;

        // A = 00, B = 01  A < B
        A1 = 0;
        A0 = 0;
        B1 = 0;
        B0 = 1;

        #10;

        // A = 00, B = 10  A < B
        A1 = 0;
        A0 = 0;
        B1 = 1;
        B0 = 0;

        #10;

        // A = 00, B = 11  A < B
        A1 = 0;
        A0 = 0;
        B1 = 1;
        B0 = 1;

        #10;

        // A = 01, B = 00  A > B
        A1 = 0;
        A0 = 1;
        B1 = 0;
        B0 = 0;

        #10;

        // A = 01, B = 01  A = B
        A1 = 0;
        A0 = 1;
        B1 = 0;
        B0 = 1;

        #10;

        // A = 01, B = 10  A < B
        A1 = 0;
        A0 = 1;
        B1 = 1;
        B0 = 0;

        #10;

        // A = 01, B = 11  A < B
        A1 = 0;
        A0 = 1;
        B1 = 1;
        B0 = 1;

        #10;

        // A = 10, B = 00  A > B
        A1 = 1;
        A0 = 0;
        B1 = 0;
        B0 = 0;

        #10;

        // A = 10, B = 01  A > B
        A1 = 1;
        A0 = 0;
        B1 = 0;
        B0 = 1;

        #10;

        // A = 10, B = 10  A = B
        A1 = 1;
        A0 = 0;
        B1 = 1;
        B0 = 0;

        #10;

        // A = 10, B = 11  A < B
        A1 = 1;
        A0 = 0;
        B1 = 1;
        B0 = 1;

        #10;

        // A = 11, B = 00  A > B
        A1 = 1;
        A0 = 1;
        B1 = 0;
        B0 = 0;

        #10;

        // A = 11, B = 01  A > B
        A1 = 1;
        A0 = 1;
        B1 = 0;
        B0 = 1;

        #10;

        // A = 11, B = 10  A > B
        A1 = 1;
        A0 = 1;
        B1 = 1;
        B0 = 0;

        #10;

        // A = 11, B = 11  A = B
        A1 = 1;
        A0 = 1;
        B1 = 1;
        B0 = 1;

        #10;

        $finish;

    end

endmodule