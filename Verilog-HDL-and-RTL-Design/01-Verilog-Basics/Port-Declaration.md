# Verilog Port Declaration

## What is a Port?

A **port** is a connection between a Verilog module and the outside world.

It allows the module to **receive inputs** and **send outputs**.

**Simple definition:**

> **A port is used to transfer signals into and out of a module.**

---

# Why do we use Ports?

Ports are used to:

- Receive input signals
- Send output signals
- Connect one module to another
- Allow communication with external hardware

---

# Types of Ports

There are **three types of ports** in Verilog.

## 1. Input

- Receives data from outside the module.
- The value comes **into** the module.
- Declared using the keyword `input`.

Example:

```verilog
input a;
input b;
```

---

## 2. Output

- Sends data from the module to the outside.
- The value goes **out of** the module.
- Declared using the keyword `output`.

Example:

```verilog
output y;
```

---

## 3. Inout

- Can both receive and send data.
- Used for **bidirectional** communication.
- Less common in basic digital design.

Example:

```verilog
inout data;
```

---

# Port Declaration Syntax

```verilog
module module_name(
    input a,
    input b,
    output y
);

    // Verilog code

endmodule
```

---

# Example: AND Gate

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

# Data Flow Through Ports

```
       Inputs
     a --------\
                \
                 >  Module  -----> y (Output)
                /
     b --------/
```

- `a` and `b` enter the module.
- The module performs the logic.
- `y` leaves the module.

---

# Rules for Port Names

- Use meaningful names.
- Names can contain letters, numbers, and `_`.
- The first character must be a letter or `_`.
- Do not use Verilog keywords as names.

**Good examples:**

```verilog
clk
reset
data_in
data_out
enable
sum
```

**Bad examples:**

```verilog
1data      // Starts with a number
module     // Verilog keyword
```

---

# Real-Life Example

Think of a **TV**.

- Power cable = Input
- HDMI cable = Input
- Screen = Output

The TV receives signals through its inputs and displays the result through its output.

---

# Easy Summary

- A **port** connects a module to the outside world.
- `input` receives signals.
- `output` sends signals.
- `inout` can both receive and send signals.
- Every Verilog module uses ports for communication.

---

# Interview Questions

### 1. What is a port?

**Answer:** A port is a connection that allows signals to enter or leave a Verilog module.

### 2. How many types of ports are
