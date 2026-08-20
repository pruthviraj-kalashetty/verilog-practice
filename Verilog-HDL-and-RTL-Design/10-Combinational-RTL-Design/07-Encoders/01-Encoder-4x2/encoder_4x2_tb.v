module encoder_4to2_tb;

    reg [3:0] A;
    wire [1:0] Y;

    encoder_4to2 DUT(
        .A(A),
        .Y(Y)
    );

    initial begin

        $dumpfile("encoder_4to2.vcd");
        $dumpvars(0, encoder_4to2_tb);

        // A = 0001 → Y = 00

        A = 4'b0001;

        #10;

        // A = 0010 → Y = 01

        A = 4'b0010;

        #10;

        // A = 0100 → Y = 10

        A = 4'b0100;

        #10;

        // A = 1000 → Y = 11

        A = 4'b1000;

        #10;

        $finish;

    end

endmodule