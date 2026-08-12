module and_gate_tb;

    reg a;
    reg b;

    wire y;

    and_gate dut(
        .a(A),
        .b(B),
        .y(Y)
    );

    initial begin

       $dumpfile("and_gate.vcd");
       $dumpvars(0, and_gate_tb);

       a = 0;
       b = 0;

       #10;

       a = 0;
       b = 1;

       #10;

       a = 1;
       b = 0;

       #10;

       a = 1;
       b = 1;

       #10

       $finish;
    end
endmodule       