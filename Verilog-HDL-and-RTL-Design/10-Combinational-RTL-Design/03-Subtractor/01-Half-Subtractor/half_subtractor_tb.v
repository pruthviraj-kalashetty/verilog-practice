module half_subtractor_tb;

    reg A;
    reg B;
    wire difference;
    wire borrow;

    half_subtractor DUT(
        .A(A),
        .B(B),
        .difference(difference),
        .borrow(borrow)

    );

    initial begin
        $dumpfile("half_subtractor.vcd");
        $dumpvars(0, half_subtractor_tb);

        A = 0;
        B = 0;

        #10;

        A = 0;
        B = 1;

        #10;

        A = 1;
        B = 0;

        #10;

        A = 1;
        B = 1;

        #10;

        $finish;

    end

endmodule        
