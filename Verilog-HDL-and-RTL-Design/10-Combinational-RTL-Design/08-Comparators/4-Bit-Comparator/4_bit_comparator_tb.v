module four_bit_comparator_tb;

    reg A0, A1, A2, A3;
    reg B0, B1, B2, B3;

    wire A_greater_B;
    wire A_equal_B;
    wire A_less_B;

    four_bit_comparator DUT(
        .A0(A0),
        .A1(A1),
        .A2(A2),
        .A3(A3),

        .B0(B0),
        .B1(B1),
        .B2(B2),
        .B3(B3),

        .A_greater_B(A_greater_B),
        .A_equal_B(A_equal_B),
        .A_less_B(A_less_B)
    );

    initial begin

        $dumpfile("four_bit_comparator.vcd");
        $dumpvars(0, four_bit_comparator_tb);

        // A = 0000, B = 0000 → A = B

        A3 = 0;
        A2 = 0;
        A1 = 0;
        A0 = 0;

        B3 = 0;
        B2 = 0;
        B1 = 0;
        B0 = 0;

        #10;

        // A = 0001, B = 0000 → A > B

        A3 = 0;
        A2 = 0;
        A1 = 0;
        A0 = 1;

        B3 = 0;
        B2 = 0;
        B1 = 0;
        B0 = 0;

        #10;

        // A = 0000, B = 0001 → A < B

        A3 = 0;
        A2 = 0;
        A1 = 0;
        A0 = 0;

        B3 = 0;
        B2 = 0;
        B1 = 0;
        B0 = 1;

        #10;

        // A = 1010, B = 0111 → A > B

        A3 = 1;
        A2 = 0;
        A1 = 1;
        A0 = 0;

        B3 = 0;
        B2 = 1;
        B1 = 1;
        B0 = 1;

        #10;

        // A = 0101, B = 0101 → A = B

        A3 = 0;
        A2 = 1;
        A1 = 0;
        A0 = 1;

        B3 = 0;
        B2 = 1;
        B1 = 0;
        B0 = 1;

        #10;

        // A = 0011, B = 1000 → A < B

        A3 = 0;
        A2 = 0;
        A1 = 1;
        A0 = 1;

        B3 = 1;
        B2 = 0;
        B1 = 0;
        B0 = 0;

        #10;

        // A = 1111, B = 0000 → A > B

        A3 = 1;
        A2 = 1;
        A1 = 1;
        A0 = 1;

        B3 = 0;
        B2 = 0;
        B1 = 0;
        B0 = 0;

        #10;

        // A = 0000, B = 1111 → A < B

        A3 = 0;
        A2 = 0;
        A1 = 0;
        A0 = 0;

        B3 = 1;
        B2 = 1;
        B1 = 1;
        B0 = 1;

        #10;

        $finish;

    end

endmodule