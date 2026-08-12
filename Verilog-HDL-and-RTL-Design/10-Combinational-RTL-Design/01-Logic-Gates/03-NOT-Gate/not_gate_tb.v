module not_gate_tb;
     
     reg A;
     wire Y;

     not_gate DUT(
        .A(A),
        .Y(Y)
     );

     initial begin
        $dumpfile("not_gate.vcd");
        $dumpvars(0, not_gate_tb);

        A = 0;

        #10;

        A = 1;

        #10;

        $finish;

    end
endmodule         
