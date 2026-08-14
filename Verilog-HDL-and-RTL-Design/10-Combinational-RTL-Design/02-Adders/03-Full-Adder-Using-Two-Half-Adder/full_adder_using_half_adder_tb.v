module full_adder_using_half_adder_tb;
     reg A;
     reg B;
     reg Cin;

     wire sum;
     wire carry;

     full_adder_using_half_adder DUT(
        .A(A),
        .B(B),
        .Cin(Cin),
        .sum(sum),
        .carry(carry)

     );

     initial begin
        $dumpfile("full_adder_using_half_adder.vcd");
        $dumpvars(0, full_adder_using_half_adder_tb);

        A = 0;
        B = 0;
        Cin = 0;

        #10;

        A = 0;
        B = 0;
        Cin = 1;

        #10;

        A = 0;
        B = 1;
        Cin = 0;

        #10;

        A = 0;
        B = 1;
        Cin = 1;

        #10;

        A = 1;
        B = 0;
        Cin = 0;
         
        #10;

        A = 1;
        B = 0;
        Cin = 1;
         
        #10;

        A = 1;
        B = 1;
        Cin = 0;
         
        #10;

        A = 1;
        B = 1;
        Cin = 1;
         
        #10;

        $finish;

    end

endmodule