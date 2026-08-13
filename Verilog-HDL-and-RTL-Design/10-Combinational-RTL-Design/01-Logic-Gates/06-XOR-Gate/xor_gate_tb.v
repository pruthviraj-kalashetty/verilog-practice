module xor_gate_tb;
     
     reg A;
     reg B;
     wire Y ;

     xor_gate DUT(
        .A(A),
        .B(B),
        .Y(Y)

     );

     initial begin
       $dumpfile("xor_gate.vcd");
       $dumpvars(0, xor_gate_tb);

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
