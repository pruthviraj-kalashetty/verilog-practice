`timescale 1ns/1ps

module and_gate_tb;

    reg a;
    reg b;
    wire y;

    // Instantiate the AND Gate
    and_gate uut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin

        // Create VCD waveform file
        $dumpfile("and_gate.vcd");
        $dumpvars(0, and_gate_tb);

        // Test Case 1
        a = 0; b = 0;
        #10;

        // Test Case 2
        a = 0; b = 1;
        #10;

        // Test Case 3
        a = 1; b = 0;
        #10;

        // Test Case 4
        a = 1; b = 1;
        #10;

        $finish;

    end

endmodule
