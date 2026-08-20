module encoder_8to3_tb;

    reg [7:0] A;

    wire [2:0] Y;

    encoder_8to3 DUT(
        .A(A),
        .Y(Y)
    );

    initial begin

        $dumpfile("encoder_8to3.vcd");
        $dumpvars(0, encoder_8to3_tb);

        // A = 00000001 → Y = 000

        A = 8'b00000001;

        #10;

        // A = 00000010 → Y = 001

        A = 8'b00000010;

        #10;

        // A = 00000100 → Y = 010

        A = 8'b00000100;

        #10;

        // A = 00001000 → Y = 011

        A = 8'b00001000;

        #10;

        // A = 00010000 → Y = 100

        A = 8'b00010000;

        #10;

        // A = 00100000 → Y = 101

        A = 8'b00100000;

        #10;

        // A = 01000000 → Y = 110

        A = 8'b01000000;

        #10;

        // A = 10000000 → Y = 111

        A = 8'b10000000;

        #10;

        $finish;

    end

endmodule
