# Blocking (`=`) vs Non-Blocking (`<=`) Assignment in Verilog

## What is the Difference?

Verilog has **two assignment operators**:

- **Blocking Assignment (`=`)**
- **Non-Blocking Assignment (`<=`)**

The main difference is **how and when the assignments are executed**.

---

# Simple Definition

### Blocking Assignment (`=`)

> **Statements execute one after another. The next statement waits until the current statement finishes.**

### Non-Blocking Assignment (`<=`)

> **All right-hand side values are evaluated first, then all left-hand side values are updated together.**

---

# Why Do We Need Two Assignment Types?

Digital circuits are of two types:

1. **Combinational Logic**
2. **Sequential Logic**

Different hardware requires different assignment behavior.

- **Blocking (`=`)** models combinational logic.
- **Non-Blocking (`<=`)** models sequential logic (flip-flops and registers).

---

# Syntax

### Blocking

```verilog id="6y4p2a"
a = b;
```

### Non-Blocking

```verilog id="x3m7vk"
a <= b;
```

---

# Example 1: Blocking Assignment

```verilog id="q5n8rd"
always @(*)
begin
    a = b;
    c = a;
end
```

Assume:

```text id="v8j2qs"
b = 5
```

Execution:

```text id="k6w4py"
Step 1

a = 5

↓

Step 2

c = 5
```

Each statement uses the **updated value** from the previous statement.

---

# Example 2: Non-Blocking Assignment

```verilog id="u7r1mh"
always @(posedge clk)
begin
    a <= b;
    c <= a;
end
```

Assume before the clock edge:

```text id="g2p9xk"
a = 1
b = 5
```

Execution:

```text id="h9m5zf"
Read old values

↓

Schedule updates

↓

a = 5

c = 1
```

Both updates happen together after evaluation.

---

# Visual Comparison

## Blocking (`=`)

```text id="w4n8tv"
Statement 1
      ↓
Statement 2
      ↓
Statement 3
```

The next statement waits.

---

## Non-Blocking (`<=`)

```text id="m3q7xy"
Read All Values
       ↓
Schedule Updates
       ↓
Update All Together
```

Everything updates simultaneously.

---

# Real-Life Example

## Blocking

Imagine standing in a queue.

```text id="f2v6pk"
Person 1
    ↓
Person 2
    ↓
Person 3
```

Each person waits for the previous person.

---

## Non-Blocking

Imagine a school bell.

```text id="z8r5nm"
Bell Rings
      ↓
All Students Leave Together
```

Everyone moves at the same time.

---

# Where Are They Used?

## Blocking (`=`)

Used in:

- Combinational Logic
- Arithmetic calculations
- Temporary variables
- `always @(*)`

---

## Non-Blocking (`<=`)

Used in:

- Flip-Flops
- Registers
- Counters
- Shift Registers
- FSMs
- `always @(posedge clk)`
- `always @(negedge clk)`

---

# Comparison Table

| Feature | Blocking (`=`) | Non-Blocking (`<=`) |
|---------|----------------|---------------------|
| Operator | `=` | `<=` |
| Execution | Sequential | Simultaneous update after evaluation |
| Next statement waits | ✅ Yes | ❌ No |
| Uses updated value immediately | ✅ Yes | ❌ No (uses old value during evaluation) |
| Best for | Combinational Logic | Sequential Logic |
| Common procedural block | `always @(*)` | `always @(posedge clk)` |
| Used for | Logic gates, MUX, Decoder | Flip-Flops, Registers, Counters, FSM |

---

# Common Beginner Mistakes

### Mistake 1

Using blocking assignment in flip-flops.

```verilog id="t5k3wh"
always @(posedge clk)
begin
    q = d;
end
```

This is legal Verilog, but it is **not the recommended RTL coding style**.

Preferred:

```verilog id="n2v8zr"
always @(posedge clk)
begin
    q <= d;
end
```

---

### Mistake 2

Using non-blocking assignment for simple combinational logic.

Preferred:

```verilog id="r6m1xp"
always @(*)
begin
    y = a & b;
end
```

---

# Easy Trick to Remember

```text id="c9q4vn"
Blocking (=)
↓

One by One

------------------------

Non-Blocking (<=)
↓

All Together
```

---

# Interview Questions

### What is the difference between blocking and non-blocking assignments?

Blocking executes statements one by one.

Non-blocking evaluates first and updates all assignments together.

---

### Which operator is used for blocking assignment?

```text id="x7p2mq"
=
```

---

### Which operator is used for non-blocking assignment?

```text id="b5v9rk"
<=
```

---

### Which assignment is preferred for combinational logic?

Blocking assignment (`=`).

---

### Which assignment is preferred for sequential logic?

Non-blocking assignment (`<=`).

---

### Why is non-blocking assignment used for flip-flops?

Because real flip-flops update their outputs simultaneously on the clock edge, and non-blocking assignment models that behavior correctly.

---

# Easy Summary

- **Blocking (`=`)** executes statements one after another.
- **Non-blocking (`<=`)** updates all assignments together after evaluation.
- Use **blocking** for combinational logic.
- Use **non-blocking** for sequential logic.
- Following this coding style helps create correct and reliable RTL designs.

---

# Easy Revision

```text id="m1k8zt"
Combinational Logic
        ↓
always @(*)
        ↓
Blocking (=)

--------------------------------

Sequential Logic
        ↓
always @(posedge clk)
        ↓
Non-Blocking (<=
