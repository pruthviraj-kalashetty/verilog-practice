# **Verilog RTL code**

```verilog
`timescale 1ns / 1ps

module and_gate (
    input a,
    input b,
    output y

);

assign y = a & b;

endmodule

```

# **Truth table**

| **Inputs** |  | **Output** |
|:---:|:---:|:---:|
| **A** | **B** | **Y** |
| 0 | 0 | 0 |
| 0 | 1 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | **1** |

# **Testbench**

# **RTL Schematics**

![AND Gate RTL Schematic](rtl-schematic.png)

# **Simulation Result
![AND Gate Waveform](waveform.png)
