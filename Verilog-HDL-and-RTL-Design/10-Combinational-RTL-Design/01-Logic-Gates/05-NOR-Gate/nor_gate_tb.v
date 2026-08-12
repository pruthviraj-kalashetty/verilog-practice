module nor_gate_tb;
     
     reg A;
     reg B;
     wire Y;

     nor_gate DUT(
        .A(A),
        .B(B),
        .Y(Y)
     );

     initial begin

        $dumpfile("nor_gate.vcd");
        $dumpvars(0, nor_gate_tb);

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
