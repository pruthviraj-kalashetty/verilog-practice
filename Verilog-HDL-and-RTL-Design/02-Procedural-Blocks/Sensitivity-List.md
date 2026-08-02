# Sensitivity List in Verilog

## What is a Sensitivity List?

A **sensitivity list** is a list of signals that tells the **always block when to execute**.

Whenever any signal in the sensitivity list changes, the always block runs.

**Simple Definition:**

> **A sensitivity list tells the `always` block which signal changes should trigger its execution.**

---

# Why Do We Need a Sensitivity List?

Without a sensitivity list, Verilog would not know **when** to execute the `always` block.

The sensitivity list acts like a **trigger**.

It tells Verilog:

- "Watch these signals."
- "If any of them change, execute the always block."

---

# General Syntax

```verilog id="4m2d8x"
always @(signal1 or signal2)
begin
    // Statements
end
```

or (recommended)

```verilog id="pf7t3v"
always @(*)
begin
    // Statements
end
```

---

# Example 1: Manual Sensitivity List

```verilog id="6g1c9w"
module and_gate(
    input a,
    input b,
    output reg y
);

always @(a or b)
begin
    y = a & b;
end

endmodule
```

The always block executes whenever:

- `a` changes
- `b` changes

---

# Example 2: Automatic Sensitivity List

```verilog id="t4p8zk"
module and_gate(
    input a,
    input b,
    output reg y
);

always @(*)
begin
    y = a & b;
end

endmodule
```

`@(*)` automatically includes **all signals used inside the block**.

This is the preferred method for combinational logic.

---

# Event Types in Sensitivity Lists

## 1. Signal Change

```verilog id="31v4eh"
always @(a or b)
```

Runs when:

- `a` changes
- `b` changes

---

## 2. Positive Edge

```verilog id="iw88ci"
always @(posedge clk)
```

Runs only when the clock changes from:

```text id="wvk7y2"
0 → 1
```

Used for:

- D Flip-Flops
- Registers
- Counters

---

## 3. Negative Edge

```verilog id="w2fsjx"
always @(negedge clk)
```

Runs only when the clock changes from:

```text id="uzq21g"
1 → 0
```

---

## 4. Multiple Events

```verilog id="2zv3s6"
always @(posedge clk or posedge reset)
```

The block executes when:

- Clock has a positive edge
- OR Reset has a positive edge

Used for **asynchronous reset**.

---

# How a Sensitivity List Works

```text id="hqjlwm"
Signal Changes
      │
      ▼
Sensitivity List Detects Change
      │
      ▼
Always Block Executes
      │
      ▼
Output Updates
```

---

# Combinational Logic

Recommended:

```verilog id="hkg0gu"
always @(*)
```

Example:

```verilog id="89lrrr"
always @(*)
begin
    y = a & b;
end
```

The block runs whenever `a` or `b` changes.

---

# Sequential Logic

Example:

```verilog id="6fjlwm"
always @(posedge clk)
begin
    q <= d;
end
```

The block executes **only** on the positive edge of the clock.

Changing `d` alone does **not** execute the block.

---

# Real-Life Example

Think of a doorbell.

```text id="s4l5ke"
Someone Presses Doorbell
        │
        ▼
Bell Rings
```

The bell rings **only** when the button is pressed.

Similarly, the always block executes **only** when an event in the sensitivity list occurs.

---

# Common Beginner Mistakes

### Mistake 1

Forgetting a signal.

Wrong:

```verilog id="mlfwha"
always @(a)
begin
    y = a & b;
end
```

`b` is used
