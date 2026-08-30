module t_flip_flop_tb;

    reg T, CLK;

    wire Q;
    wire Q_bar;

    t_flip_flop DUT(
        .T(T),
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

        $dumpfile("t_flip_flop.vcd");
        $dumpvars(0, t_flip_flop_tb);

        // T = 1 → TOGGLE
        T = 1;

        #20;

        // T = 0 → HOLD
        T = 0;

        #20;

        // T = 1 → TOGGLE
        T = 1;

        #20;

        $finish;

    end

endmodule