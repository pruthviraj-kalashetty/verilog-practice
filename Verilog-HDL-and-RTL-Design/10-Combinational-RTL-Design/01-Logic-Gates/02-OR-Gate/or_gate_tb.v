module or_gate_tb;

     reg A;
     reg B;
     wire Y;

     or_gate DUT(
        .A(A),
        .B(B),
        .Y(Y)
    );

    initial begin
        $dumpfile("or_gate.vcd");
        $dumpvars(0, or_gate_tb);

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
