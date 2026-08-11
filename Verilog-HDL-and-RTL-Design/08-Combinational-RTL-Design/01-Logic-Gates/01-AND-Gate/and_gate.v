// 2-Input AND Gate Module
module and_gate (
    input  wire a, // First input signal
    input  wire b, // Second input signal
    output wire y  // Output signal (a AND b)
);

    // Continuous assignment implementing the logical AND function
    assign y = a & b;

endmodule
