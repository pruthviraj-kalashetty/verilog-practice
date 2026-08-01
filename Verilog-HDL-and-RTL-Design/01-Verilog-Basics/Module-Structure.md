# Verilog Module Structure

## What is a Module?

A **module** is the **basic building block** of a Verilog program.

Think of a module as a **box** that performs a specific task.

**Simple definition:**

> **A module is a block of Verilog code that describes a digital circuit.**

---

# Why do we use a Module?

We use a module to:

- Design one digital circuit
- Organize the code
- Reuse the same design in other projects
- Make the design easy to understand

---

# Basic Module Structure

```verilog
module module_name(
    input input1,
    input input2,
    output output1
);

    // Verilog code

endmodule
```

---

# Parts of a Module

### 1. `module`

- Starts the module.
- Tells Verilog that a new hardware design begins.

Example:

```verilog
module and_gate
```

---

### 2. Module Name

- Name of the circuit.
- Can be any valid name.

Examples:

```verilog
and_gate
or_gate
mux2x1
full_adder
counter
```

---

### 3. Input Ports

- Receive signals from outside the module.

Example:

```verilog
input a;
input b;
```

---

### 4. Output Ports

- Send signals outside the module.

Example:

```verilog
output y;
```

---

### 5. Verilog Statements

These describe how the circuit works.

Example:

```verilog
assign y = a & b;
```

This creates an AND gate.

---

### 6. `endmodule`

Marks the end of the module.

```verilog
endmodule
```

---

# Complete Example

```verilog
module and_gate(
    input a,
    input b,
    output y
);

assign y = a & b;

endmodule
```

---

# How the Data Flows

```
      a ──┐
           │
           │
        AND Gate
           │
      b ──┘
           │
           ▼
           y
```

- `a` and `b` are **inputs**.
- The module performs the AND operation.
- `y` is the **output**.

---

# Real-Life Example

Think of a **calculator**.

- **Inputs** → Numbers you enter.
- **Module** → Calculator that performs the operation.
- **Output** → Result shown on the screen.

Similarly, a Verilog module takes **inputs**, processes them, and produces **outputs**.

---

# Easy Summary

- A **module** is the basic building block of Verilog.
- Every Verilog program starts with `module`.
- Inputs receive signals.
- Outputs send signals.
- Verilog statements describe the hardware.
- Every module ends with `endmodule`.

---

# One-Line Interview Answer

**"A module is the basic building block of Verilog that describes a digital circuit using inputs, outputs, and hardware logic."**
