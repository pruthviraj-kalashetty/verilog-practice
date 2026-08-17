module demux_1to8_tb;

    reg D;
    reg S3, S2, S1;

    wire Y7, Y6, Y5, Y4, Y3, Y2, Y1, Y0;

    demux_1to8 DUT(
        .D(D),
        .S3(S3),
        .S2(S2),
        .S1(S1),

        .Y0(Y0),
        .Y1(Y1),
        .Y2(Y2),
        .Y3(Y3),
        .Y4(Y4),
        .Y5(Y5),
        .Y6(Y6),
        .Y7(Y7)
    );

    initial begin

        $dumpfile("demux_1to8.vcd");
        $dumpvars(0, demux_1to8_tb);

        // D = 0, S3S2S1 = 000 → All outputs = 0

        D = 0;
        S3 = 0;
        S2 = 0;
        S1 = 0;

        #10;

        // D = 0, S3S2S1 = 001 → All outputs = 0

        D = 0;
        S3 = 0;
        S2 = 0;
        S1 = 1;

        #10;

        // D = 0, S3S2S1 = 010 → All outputs = 0

        D = 0;
        S3 = 0;
        S2 = 1;
        S1 = 0;

        #10;

        // D = 0, S3S2S1 = 011 → All outputs = 0

        D = 0;
        S3 = 0;
        S2 = 1;
        S1 = 1;

        #10;

        // D = 0, S3S2S1 = 100 → All outputs = 0

        D = 0;
        S3 = 1;
        S2 = 0;
        S1 = 0;

        #10;

        // D = 0, S3S2S1 = 101 → All outputs = 0

        D = 0;
        S3 = 1;
        S2 = 0;
        S1 = 1;

        #10;

        // D = 0, S3S2S1 = 110 → All outputs = 0

        D = 0;
        S3 = 1;
        S2 = 1;
        S1 = 0;

        #10;

        // D = 0, S3S2S1 = 111 → All outputs = 0

        D = 0;
        S3 = 1;
        S2 = 1;
        S1 = 1;

        #10;

        // D = 1, S3S2S1 = 000 → D goes to Y0

        D = 1;
        S3 = 0;
        S2 = 0;
        S1 = 0;

        #10;

        // D = 1, S3S2S1 = 001 → D goes to Y1

        D = 1;
        S3 = 0;
        S2 = 0;
        S1 = 1;

        #10;

        // D = 1, S3S2S1 = 010 → D goes to Y2

        D = 1;
        S3 = 0;
        S2 = 1;
        S1 = 0;

        #10;

        // D = 1, S3S2S1 = 011 → D goes to Y3

        D = 1;
        S3 = 0;
        S2 = 1;
        S1 = 1;

        #10;

        // D = 1, S3S2S1 = 100 → D goes to Y4

        D = 1;
        S3 = 1;
        S2 = 0;
        S1 = 0;

        #10;

        // D = 1, S3S2S1 = 101 → D goes to Y5

        D = 1;
        S3 = 1;
        S2 = 0;
        S1 = 1;

        #10;

        // D = 1, S3S2S1 = 110 → D goes to Y6

        D = 1;
        S3 = 1;
        S2 = 1;
        S1 = 0;

        #10;

        // D = 1, S3S2S1 = 111 → D goes to Y7

        D = 1;
        S3 = 1;
        S2 = 1;
        S1 = 1;

        #10;

        $finish;

    end

endmodule
