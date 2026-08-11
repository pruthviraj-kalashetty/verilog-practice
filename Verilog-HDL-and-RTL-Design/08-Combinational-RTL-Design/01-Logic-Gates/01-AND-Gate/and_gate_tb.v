module and_gate_tb;

    reg A;
    reg B;
    wire y;

    and_gate DUT (
        .A(A),
        .B(B),
        .y(y)
    );

    initial begin

        $dumpfile("and_gate.vcd");
        $dumpvars(0, and_gate_tb);

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

    initial begin
        $dumpfile("Time%0t | A=%b B=%b y=%b" , $time, A, B, y)
    end    

endmodule