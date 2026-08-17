module mux_2to1_tb;

    reg I0;
    reg I1;
    reg S;

    wire Y;

    mux_2to1 DUT(
        .I0(I0),
        .I1(I1),
        .S(S),
        .Y(Y)
    );

    initial begin
        $dumpfile("mux_2to1.vcd");
        $dumpvars(0, mux_2to1_tb);

        // taken S =0

        I0 = 0;
        I1 = 0;
        S = 0;

        #10;

        I0 = 0;
        I1 = 1;
        S = 0;

        #10;

        I0 = 1;
        I1 = 0;
        S = 0;

        #10;

        I0 = 1;
        I1 = 1;
        S = 0;

        #10;

       // here S = 1

        I0 = 0;
        I1 = 0;
        S = 1;

        #10;

        I0 = 0;
        I1 = 1;
        S = 1;

        #10;

        I0 = 1;
        I1 = 0;
        S = 1;

        #10;

        I0 = 1;
        I1 = 1;
        S = 1;

        #10;

        $finish;

    end

endmodule        