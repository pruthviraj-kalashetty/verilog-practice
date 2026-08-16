module mux_4to1_tb;

    reg I0;
    reg I1;
    reg I2;
    reg I3;

    reg S1;
    reg S0;

    wire Y;

    mux_4to1 DUT(

        .I0(I0),
        .I1(I1),
        .I2(I2),
        .I3(I3),

        .S1(S1),
        .S0(S0),

        .Y(Y)

    );

    initial begin

        $dumpfile("mux_4to1.vcd");
        $dumpvars(0, mux_4to1_tb);

        // Input value

        I0 = 0;
        I1 = l;
        I2 = 0;
        I3 = 1;

        // S0S1 = 00  select I0

        S0 = 0;
        S1 = 0;

        #10;
        
        // S0S1 = 01  select I1

        S0 = 0;
        S1 = 1;

        #10;

        // S0S1 = 10 select I2

        S0 = 1;
        S1 = 0;

        #10;

        // S0S1 = 11  select I3

        S0 = I1;
        S1 = I2;

        #10;

        $finish;

    end    

endmodule 