`timescale 1ns / 1ps // Set simulation time unit to 1ns and precision to 1ps

module and_gate_tb;

    // 1. Declare testbench signals
    reg  tb_a;       // Inputs to DUT must be declared as registers ('reg')
    reg  tb_b;
    wire tb_y;       // Outputs from DUT must be declared as wires ('wire')

    // 2. Instantiate the Device Under Test (DUT)
    // Named port connection links testbench signals to module ports
    and_gate dut (
        .a(tb_a),
        .b(tb_b),
        .y(tb_y)
    );

    // 3. Generate stimulus to test all combinations
    initial begin
        // Optional: Generate waveform dump file for tools like GTKWave or ModelSim
        $dumpfile("and_gate_dump.vcd");
        $dumpvars(0, and_gate_tb);

        // Print header for simulation text logs
        $display("Time\t A \t B \t Y");
        $display("-------------------");
        
        // Monitor changes dynamically throughout the execution
        $monitor("%0dns\t %b \t %b \t %b", $time, tb_a, tb_b, tb_y);

        // Test Case 1: 0 AND 0 = 0
        tb_a = 0; tb_b = 0;
        #10; // Wait 10 time units

        // Test Case 2: 0 AND 1 = 0
        tb_a = 0; tb_b = 1;
        #10;

        // Test Case 3: 1 AND 0 = 0
        tb_a = 1; tb_b = 0;
        #10;

        // Test Case 4: 1 AND 1 = 1
        tb_a = 1; tb_b = 1;
        #10;

        // End simulation execution
        $finish;
    end

endmodule
