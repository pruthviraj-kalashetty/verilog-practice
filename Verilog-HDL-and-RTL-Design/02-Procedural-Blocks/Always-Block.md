# Always Block in Verilog

## What is an Always Block?

An **always block** is a **procedural block** that executes **continuously** during simulation.

It starts at **simulation time = 0** and executes again whenever an event in its **sensitivity list** occurs.

**Simple Definition:**

> **An always block is a procedural block that repeatedly executes whenever the signals in its sensitivity list change.**

---

# Why Do We Use an Always Block?

The always block is used to:

- Design combinational logic
- Design sequential logic
- Model flip-flops
- Build registers
- Create counters
- Design Finite State Machines (FSM)

It is the **most commonly used procedural block in RTL Design**.

---

# Syntax

## Combinational Logic

```verilog
always @(*)
begin
    // Combinational logic
end
```

---

## Sequential Logic

```verilog
always @(posedge clk)
begin
    // Sequential logic
end
```

---

# How Does an Always Block Work?

```text
Simulation Starts
        │
        ▼
Always Block Starts
        │
        ▼
Wait for an Event
        │
        ▼
Event Occurs
        │
        ▼
Execute Statements
        │
        ▼
Wait for the Next Event
```

The block **never ends** during simulation.

---

# Example 1: Combinational Logic

```verilog
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

If:

```text
a = 1
b = 1
```

Then:

```text
y = 1
```

Whenever `a` or `b` changes, the always block executes again.

---

# Example 2: D Flip-Flop

```verilog
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

At every **positive edge** of the clock:

```text
q = d
```

---

# Types of Always Blocks

## 1. Combinational Always Block

```verilog
always @(*)
```

Used for:

- Logic gates
- Multiplexers
- Encoders
- Decoders

---

## 2. Sequential Always Block

```verilog
always @(posedge clk)
```

or

```verilog
always @(negedge clk)
```

Used for:

- Flip-flops
- Registers
- Counters
- FSMs

---

# Sensitivity List

The sensitivity list tells Verilog **when the always block should execute**.

Example:

```verilog
always @(a or b)
```

The block runs whenever:

- `a` changes
- `b` changes

Modern Verilog usually uses:

```verilog
always @(*)
```

which automatically includes all signals used inside the block.

---

# Always Block vs Initial Block

| Always Block | Initial Block |
|---------------|---------------|
| Executes repeatedly | Executes only once |
| Runs whenever triggered | Runs only at simulation start |
| Used in RTL design | Mainly used in testbenches |
| Models hardware behavior | Used for initialization |

---

# Real-Life Example

Think of a security guard.

```text
Guard On Duty
      │
      ▼
Wait for Someone
      │
      ▼
Person Arrives
      │
      ▼
Check ID
      │
      ▼
Wait Again
```

The guard keeps checking every new person.

Similarly, the always block waits for an event, executes, and waits again.

---

# Common Beginner Mistakes

### Mistake 1

Using `=` in sequential logic.

For flip-flops, use:

```verilog
q <= d;
```

Non-blocking assignment (`<=`) is recommended.

---

### Mistake 2

Forgetting a signal in the sensitivity list.

Wrong:

```verilog
always @(a)
```

if the logic also depends on `b`.

Better:

```verilog
always @(*)
```

---

### Mistake 3

Thinking the always block runs only once.

❌ Wrong

It executes every time its sensitivity list is triggered.

---

# Interview Questions

### What is an always block?

An always block is a procedural block that repeatedly executes whenever an event in its sensitivity list occurs.

---

### When does an always block execute?

Whenever the signals in its sensitivity list change.

---

### What is `always @(*)`?

It automatically includes all signals read inside the block, making it ideal for combinational logic.

---

### Where is the always block used?

- Combinational logic
- Sequential logic
- Flip-flops
- Registers
- Counters
- FSMs

---

### Which procedural block is used for RTL hardware design?

The **always block**.

---

# Easy Summary

- `always` is a procedural block.
- Executes repeatedly.
- Waits for events in the sensitivity list.
- Used for combinational and sequential logic.
- Most important procedural block in RTL design.

---

# Easy Trick to Remember

```text
ALWAYS

Starts at Time = 0
       ↓
Waits for an Event
       ↓
Executes
       ↓
Waits Again
       ↓
Repeats Forever
```

---

# Key Points for Interviews

- `always @(*)` → Combinational Logic
- `always @(posedge clk)` → Positive-edge triggered sequential logic
- `always @(negedge clk)` → Negative-edge triggered sequential logic
- Use **non-blocking assignment (`<=`)** for sequential logic.
- Prefer **`always @(*)`** over manually listing signals for combinational logic.

---

# One-Line Interview Answer

**"The `always` block is a procedural block that continuously executes whenever an event in its sensitivity list occurs, and it is used to describe combinational and sequential hardware in RTL design."**
