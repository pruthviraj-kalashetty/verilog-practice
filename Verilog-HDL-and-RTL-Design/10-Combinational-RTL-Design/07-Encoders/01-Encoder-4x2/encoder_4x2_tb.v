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

        A = 4'b0001;
        #10;

        A = 4'b0010;
        #10;

        A = 4'b0100;
        #10;

        A = 4'b1000;
        #10;

        $finish;

    end

endmodule