# Parameters in Verilog

## What is a Parameter?

A **parameter** is a constant value used in Verilog design.

It allows us to define a value once and use it throughout the design.

**Simple Definition:**

> **A parameter is a constant that can be used to make Verilog designs flexible and reusable.**

---

# Why Do We Use Parameters?

Parameters are used to:

- Avoid repeating fixed values
- Make designs easy to modify
- Create reusable modules
- Configure hardware designs

---

# Normal Value vs Parameter

### Without Parameter

```verilog
module counter(
    input clk,
    output [7:0] count
);
```

Here:

```text
8
```

is fixed.

If we want a 16-bit counter, we must manually change it.

---

### With Parameter

```verilog
module counter #(parameter WIDTH = 8)(
    input clk,
    output [WIDTH-1:0] count
);
```

Now we can easily change the width.

---

# Parameter Syntax

## Module Parameter

```verilog
module module_name #(parameter parameter_name = value)
(
    ports
);
```

Example:

```verilog
module adder #(parameter SIZE = 8)
(
    input [SIZE-1:0] a,
    input [SIZE-1:0] b,
    output [SIZE-1:0] sum
);

assign sum = a + b;

endmodule
```

Here:

```text
SIZE = 8
```

means an 8-bit adder.

---

# Changing Parameter Value During Instantiation

Default value:

```verilog
SIZE = 8
```

can be changed while using the module.

Example:

```verilog
adder #(16) my_adder(
    .a(a),
    .b(b),
    .sum(sum)
);
```

Now:

```text
SIZE = 16
```

The same module becomes a 16-bit adder.

---

# Parameter Example: Counter

```verilog
module counter #(parameter WIDTH = 4)
(
    input clk,
    output reg [WIDTH-1:0] count
);

always @(posedge clk)
begin
    count <= count + 1;
end

endmodule
```

If:

```text
WIDTH = 4
```

Counter range:

```text
0000 to 1111
```

If:

```text
WIDTH = 8
```

Counter range:

```text
00000000 to 11111111
```

---

# Local Parameter

## What is localparam?

`localparam` is a constant that **cannot be changed from outside the module**.

It is only used inside the module.

---

## Syntax

```verilog
localparam name = value;
```

Example:

```verilog
localparam IDLE = 2'b00;
localparam START = 2'b01;
localparam STOP = 2'b10;
```

Used commonly in:

- FSM designs
- State encoding
- Fixed values

---

# Parameter vs Localparam

| Parameter | Localparam |
|-----------|------------|
| Can be changed during module instantiation | Cannot be changed |
| Used for configurable designs | Used for internal constants |
| Makes modules reusable | Protects fixed values |

---

# Parameter vs Variable

| Parameter | Variable (`reg`, `wire`) |
|-----------|--------------------------|
| Constant value | Value can change |
| Fixed during simulation | Changes during operation |
| Used for configuration | Used for data storage/transfer |

---

# Real-Life Example

Think about a mobile phone.

### Parameter

Screen size option:

```text
6 inch
6.5 inch
7 inch
```

The manufacturer can change the design configuration.

---

### Localparam

Battery voltage:

```text
3.7V
```

It is fixed inside the design.

---

# Important Rules

- Parameter values cannot change during simulation.
- Parameters are declared using the `parameter` keyword.
- Parameters improve code reusability.
- Localparam is used for internal fixed values.

---

# Common Uses in RTL Design

Parameters are commonly used for:

- Data width
- Memory size
- FIFO depth
- Counter size
- Number of channels
- FSM states

---

# Interview Questions

### What is a parameter in Verilog?

A parameter is a constant used to configure and customize a Verilog design.

---

### Can a parameter value be changed?

Yes, during module instantiation.

---

### What is localparam?

A constant that can only be used inside the module and cannot be modified externally.

---

### Why are parameters used?

To make designs flexible, reusable, and easy to modify.

---

### Difference between parameter and reg?

Parameter is a fixed constant, while reg stores changing values.

---

# Easy Summary

- Parameter = constant value.
- Used to make modules configurable.
- Helps create reusable RTL designs.
- `parameter` can be overridden.
- `localparam` cannot be overridden.
- Commonly used for widths, sizes, and FSM states.

---

# One-Line Interview Answer

**"A parameter in Verilog is a constant used to customize and make RTL designs reusable, while localparam is a fixed internal constant that cannot be modified externally."**
