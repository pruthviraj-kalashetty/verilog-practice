```verilog
`timescale 1ns / 1ps
// OR Gate Design

module and_gate (
    input a,
    input b,
    output y
);

assign y = a + b;

endmodule
```