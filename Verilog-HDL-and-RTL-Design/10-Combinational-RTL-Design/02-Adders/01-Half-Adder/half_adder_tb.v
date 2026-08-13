module half_adder_tb.v;

    reg A;
    reg B;
    wire sum;
    wire carry;

    half_adder DUT(
        .A(A),
        .B(B),
        .sum(sum),
        .carry(carry)

    );

    initial begin
        $dumpfile("half_adder.vcd")
        $dumpvars(0, half_adder_tb);

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
