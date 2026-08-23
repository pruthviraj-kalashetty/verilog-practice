module sr_flip_flop_tb;

    reg S, R, CLK;

    wire Q;
    wire Q_bar;

    sr_flip_flop DUT(
        .S(S),
        .R(R),
        .CLK(CLK),
        .Q(Q),
        .Q_bar(Q_bar)
    );

    // Clock generation

    initial begin

        CLK = 0;

        forever #5 CLK = ~CLK;

    end


    initial begin

        $dumpfile("sr_flip_flop.vcd");
        $dumpvars(0, sr_flip_flop_tb);


        // 10 → SET
        S = 1;
        R = 0;

        #10;


        // 00 → HOLD
        S = 0;
        R = 0;

        #10;


        // 01 → RESET
        S = 0;
        R = 1;

        #10;


        // 00 → HOLD
        S = 0;
        R = 0;

        #10;


        // 10 → SET again
        S = 1;
        R = 0;

        #10;


        $finish;

    end

endmodule
