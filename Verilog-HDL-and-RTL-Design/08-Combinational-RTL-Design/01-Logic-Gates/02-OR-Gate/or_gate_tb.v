// or_gate_tb.v
`timescale 1ns / 1ps

module or_gate_tb;

    // 1. Declare inputs as registers and outputs as wires
    reg a;
    reg b;
    wire y;

    // 2. Instantiate the Unit Under Test (UUT)
    or_gate uut (
        .a(a),
        .b(b),
        .y(y)
    );

    // 3. Generate stimulus to test all input combinations
    initial begin
        // Optional: Setup file dumping for waveform analysis (e.g., GTKWave)
        $dumpfile("or_gate_dump.vcd");
        $dumpvars(0, or_gate_tb);
        
        // Monitor outputs in the simulation console
        $monitor("Time = %0t | Input a = %b, b = %b | Output y = %b", $time, a, b, y);

        // Test Case 1: 0 OR 0 = 0
        a = 0; b = 0;
        #10; // Wait 10 time units

        // Test Case 2: 0 OR 1 = 1
        a = 0; b = 1;
        #10;

        // Test Case 3: 1 OR 0 = 1
        a = 1; b = 0;
        #10;

        // Test Case 4: 1 OR 1 = 1
        a = 1; b = 1;
        #10;

        // End simulation
        $finish;
    end

endmodule

