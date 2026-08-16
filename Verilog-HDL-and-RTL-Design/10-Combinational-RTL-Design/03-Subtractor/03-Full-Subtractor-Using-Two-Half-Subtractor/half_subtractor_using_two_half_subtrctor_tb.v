module full_subtractor_using_Two_half_subtractor_tb;
     reg A;
     reg B;
     reg Bin;

     wire difference;
     wire borrow;

     full_subtractor_using_half_subtractor DUT(
        .A(A),
        .B(B),
        .Bin(Bin),
        .difference(difference),
        .borrow(borrow)

     );

     initial begin
        $dumpfile("full_subtractor_using_half_subtractor.vcd");
        $dumpvars(0, full_subtractor_using_half_subtractor_tb);

        A = 0;
        B = 0;
        Bin = 0;

        #10;

        A = 0;
        B = 0;
        Bin = 1;

        #10;

        A = 0;
        B = 1;
        Bin = 0;

        #10;

        A = 0;
        B = 1;
        Bin = 1;

        #10;

        A = 1;
        B = 0;
        Bin = 0;
         
        #10;

        A = 1;
        B = 0;
        Bin = 1;
         
        #10;

        A = 1;
        B = 1;
        Bin = 0;
         
        #10;

        A = 1;
        B = 1;
        Bin = 1;
         
        #10;

        $finish;

    end

endmodule