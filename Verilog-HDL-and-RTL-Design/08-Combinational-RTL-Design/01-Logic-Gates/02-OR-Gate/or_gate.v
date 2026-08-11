// or_gate.v
module or_gate (
    input wire a,
    input wire b,
    output wire y
);

    // Continuous assignment implementing OR logic
    assign y = a | b;

endmodule

