# Non-Blocking Assignment (`<=`) in Verilog

## What is a Non-Blocking Assignment?

A **non-blocking assignment** uses the **`<=`** operator.

It evaluates the right-hand side (RHS) immediately, but **updates the left-hand side (LHS) only after all non-blocking assignments in the current time step have been evaluated**.

**Simple Definition:**

> **A non-blocking assignment schedules the new value to be updated later, allowing all assignments in the block to appear to happen simultaneously.**

---

# Why Do We Use Non-Blocking Assignment?

Non-blocking assignment is used to:

- Design flip-flops
- Design registers
- Design counters
- Design shift registers
- Design Finite State Machines (FSM)
- Model clocked sequential circuits

---

# Syntax

```verilog id="9l8v2a"
variable <= expression;
```

Example:

```verilog id="g2q4xm"
q <= d;
```

---

# How Non-Blocking Assignment Works

Suppose before the clock edge:

```text id="n5x4r8"
a = 1
b = 2
```

Code:

```verilog id="j4t8zc"
always @(posedge clk)
begin
    a <= b;
    b <= a;
end
```

### Step 1

Verilog reads the old values.

```text id="0t7h1m"
a = 1
b = 2
```

---

### Step 2

It schedules the updates.

```text id="5v6j8q"
a will become 2
b will become 1
```

---

### Step 3

Both values update together.

```text id="r1f3zk"
a = 2
b = 1
```

This behaves like two flip-flops capturing data on the same clock edge.

---

# Timing Flow

```text id="6m3q8b"
Clock Edge
      │
      ▼
Read Old Values
      │
      ▼
Schedule Updates
      │
      ▼
Update All Outputs Together
```

---

# Example 1: D Flip-Flop

```verilog id="k8m5zp"
module dff(
    input clk,
    input d,
    output reg q
);

always @(posedge clk)
begin
    q <= d;
end

endmodule
```

At every positive clock edge:

```text id="u9v7wc"
q takes the value of d
```

---

# Example 2: 4-Bit Counter

```verilog id="e3x6nr"
module counter(
    input clk,
    output reg [3:0] count
);

always @(posedge clk)
begin
    count <= count + 1;
end

endmodule
```

On every positive clock edge:

```text id="yn2w5d"
0000

↓

0001

↓

0010

↓

0011

↓

...
```

---

# Example 3: Shift Register

```verilog id="h4k9qs"
always @(posedge clk)
begin
    q1 <= d;
    q2 <= q1;
    q3 <= q2;
end
```

Each flip-flop captures the **previous value** from the stage before it.

This is exactly how a real hardware shift register works.

---

# Where is Non-Blocking Assignment Used?

Used in:

- Flip-flops
- Registers
- Counters
- Shift Registers
- FSMs
- Clocked Sequential Logic

---

# Real-Life Example

Imagine a classroom.

The teacher says:

> "Everyone, change seats when I clap."

Students first **remember** where they must move.

When the teacher claps:

```text id="q7m2xr"
All students move at the same time.
```

This is how non-blocking assignment works.

---

# Common Beginner Mistakes

### Mistake 1

Using blocking assignment for flip-flops.

Not recommended.

Use:

```verilog id="y5n3ht"
<=
```

---

### Mistake 2

Thinking updates happen immediately.

Wrong.

The update occurs after all non-blocking assignments have been evaluated for that simulation time.

---

### Mistake 3

Using non-blocking assignment in simple combinational logic.

For most combinational logic, blocking assignment (`=`) is the preferred coding style.

---

# Blocking vs Non-Blocking Example

## Blocking

```verilog id="j9r4mw"
always @(*)
begin
    a = b;
    b = a;
end
```

If:

```text id="o6t1py"
a = 1
b = 2
```

Result:

```text id="v8m2cz"
a = 2
b = 2
```

because the second statement sees the updated value of `a`.

---

## Non-Blocking

```verilog id="c4y8qa"
always @(posedge clk)
begin
    a <= b;
    b <= a;
end
```

If:

```text id="m3w6fn"
a = 1
b = 2
```

Result after the clock edge:

```text id="z1q9dk"
a = 2
b = 1
```

because both assignments use the old values before updating.

---

# Interview Questions

### What is a non-blocking assignment?

A non-blocking assignment uses the `<=` operator and updates variables after all non-blocking assignments in the current time step have been evaluated.

---

### Which operator is used?

```text id="r5k8vq"
<=
```

---

### Where is it commonly used?

Clocked sequential logic.

---

### Why is non-blocking assignment used for flip-flops?

Because all flip-flops capture their inputs simultaneously on the clock edge, and non-blocking assignments model this behavior correctly.

---

### Which procedural block commonly uses non-blocking assignment?

```verilog id="b8p3xj"
always @(posedge clk)
```

or

```verilog id="g6n2zr"
always @(negedge clk)
```

---

# Easy Summary

- Non-blocking assignment uses `<=`.
- It is mainly used in sequential logic.
- Updates occur together after evaluation.
- Models real flip-flop behavior.
- Best choice for clocked RTL designs.

---

# Easy Trick to Remember

```text id="x9j4qw"
Non-Blocking (<=)

Read Old Values
        ↓
Schedule Updates
        ↓
Update Everything Together
```

---

# Key Points for Interviews

- Operator: `<=`
- Used in: `always @(posedge clk)` or `always @(negedge clk)`
- Best for: Sequential Logic
- Models: Flip-flops and Registers
- All updates appear to happen simultaneously on the clock edge.

---

# One-Line Interview Answer

**"A non-blocking assignment (`<=`) schedules updates so that all left-hand side variables are updated together after evaluation, making it the preferred choice for clocked sequential logic in Verilog."**
