# Case Statement in Verilog

## What is a Case Statement?

A **case statement** is a decision-making statement used inside an **`always` block**.

It compares one expression with multiple fixed values and executes the matching block.

**Simple Definition:**

> **A case statement selects one block of code to execute based on the value of an expression.**

---

# Why Do We Use a Case Statement?

The `case` statement is used to:

- Select one option from many choices.
- Write cleaner code than long `if-else` ladders.
- Design multiplexers.
- Design decoders.
- Design Finite State Machines (FSMs).
- Decode instructions in processors.

---

# Basic Syntax

```verilog id="h7v2mk"
always @(*)
begin
    case(expression)
        value1: statement;
        value2: statement;
        value3: statement;
        default: statement;
    endcase
end
```

---

# How a Case Statement Works

```text id="a3m9wx"
Expression
     │
     ▼
Compare with Values
     │
     ▼
Matching Value Found
     │
     ▼
Execute That Block
```

Only the matching block is executed.

---

# Example 1: 2-to-1 Multiplexer

```verilog id="g8x5pb"
module mux2x1(
    input a,
    input b,
    input sel,
    output reg y
);

always @(*)
begin
    case(sel)
        1'b0: y = a;
        1'b1: y = b;
        default: y = 1'b0;
    endcase
end

endmodule
```

### Working

If:

```text id="v4r8tc"
sel = 0
```

Output:

```text id="c6q2yj"
y = a
```

If:

```text id="s5w7kn"
sel = 1
```

Output:

```text id="r9z4mf"
y = b
```

---

# Example 2: Decoder

```verilog id="p2m8vh"
always @(*)
begin
    case(sel)
        2'b00: y = 4'b0001;
        2'b01: y = 4'b0010;
        2'b10: y = 4'b0100;
        2'b11: y = 4'b1000;
        default: y = 4'b0000;
    endcase
end
```

---

# Example 3: Traffic Light Controller

```verilog id="k5t1dx"
always @(*)
begin
    case(state)
        2'b00: light = RED;
        2'b01: light = YELLOW;
        2'b10: light = GREEN;
        default: light = RED;
    endcase
end
```

---

# The `default` Case

The `default` block executes when none of the case values match.

Example:

```verilog id="w9m4jq"
default: y = 0;
```

### Why is `default` Important?

- Prevents unintended latch inference.
- Handles unexpected input values.
- Makes the design more reliable.

---

# Types of Case Statements

## 1. Simple `case`

Matches exact values.

```verilog id="t3v8ps"
case(sel)
```

---

## 2. `casex`

Treats `x` (unknown) and `z` (high impedance) as **don't care** values.

```verilog id="j6q2hf"
casex(sel)
```

**Note:** `casex` is generally **not recommended for synthesizable RTL** because it can hide design bugs.

---

## 3. `casez`

Treats only `z` (and `?`) as **don't care** values.

```verilog id="d1n7kw"
casez(sel)
```

It is often preferred over `casex` when wildcard matching is required.

---

# Where is the Case Statement Used?

Used in:

- Multiplexers
- Decoders
- Encoders
- FSMs
- ALU Control Logic
- CPU Instruction Decoders

---

# Real-Life Example

Think of a TV remote.

```text id="o7r5vm"
Button Pressed
      │
      ▼
Check Button Number
      │
      ▼
Perform Matching Action
```

Example:

```text id="lj8kfd"
1 → News

2 → Sports

3 → Movies

4 → Music
```

The remote selects one action based on the button pressed.

This is similar to a `case` statement.

---

# Advantages

- Cleaner than long `if-else` ladders.
- Easy to read.
- Efficient for multiple fixed choices.
- Commonly used in RTL design.

---

# Disadvantages

- Cannot directly check ranges like `>`, `<`, `>=`, or `<=`.
- Only matches specified values.

---

# Common Beginner Mistakes

### Mistake 1

Forgetting the `default` case.

Wrong:

```verilog id="v8h3tr"
case(sel)
    2'b00: y = a;
    2'b01: y = b;
endcase
```

Better:

```verilog id="q4m6zy"
case(sel)
    2'b00: y = a;
    2'b01: y = b;
    default: y = 0;
endcase
```

---

### Mistake 2

Using duplicate case values.

Wrong:

```verilog id="x7p1dl"
case(sel)
    2'b00: y = a;
    2'b00: y = b;
endcase
```

Each case value should be unique.

---

### Mistake 3

Using `case` for range comparisons.

Wrong:

```text id="e5j9ru"
a > b
```

Use `if-else` for comparisons like `>`, `<`, `>=`, and `<=`.

---

# If-Else vs Case Statement

| If-Else | Case |
|---------|------|
| Best for conditions and ranges | Best for fixed values |
| Supports `>`, `<`, `>=`, `<=` | Matches exact values |
| Can become long | Cleaner for many choices |
| Good for complex conditions | Good for selectors and states |

---

# Interview Questions

### What is a case statement?

A case statement selects one block of code based on the value of an expression.

---

### Where is the case statement used?

- Multiplexers
- Decoders
- FSMs
- Instruction Decoders
- ALU Control Logic

---

### Why is the `default` case important?

It handles unexpected values and helps avoid unintended latch inference.

---

### When should you use a case statement?

When selecting between multiple fixed values.

---

### What is the difference between `case`, `casex`, and `casez`?

- `case` → Exact matching.
- `casex` → Treats `x` and `z` as don't care (generally avoided in synthesizable RTL).
- `casez` → Treats `z` and `?` as don't care.

---

# Easy Summary

- `case` is used for multiple fixed choices.
- Executes only the matching case.
- Usually written inside `always @(*)`.
- Always include a `default` case.
- Cleaner than long `if-else` ladders.

---

# Easy Trick to Remember

```text id="z6w2ny"
Expression
     ↓
Match Value
     ↓
Execute Matching Block
```

---

# Key Points for Interviews

- Used inside procedural blocks.
- Best for selectors and state machines.
- Include a `default` case.
- Use `case` for fixed values.
- Use `if-else` for comparisons and ranges.
- `casez` is generally preferred over `casex` if wildcard matching is needed.

---

# Comparison of Decision-Making Statements

| Feature | If-Else | Case |
|---------|----------|------|
| Checks conditions | Yes | No |
| Matches exact values | Yes | Yes |
| Range comparison (`>`, `<`) | Yes | No |
| Multiple fixed values | Possible | Best choice |
| Common Applications | Comparators, Control Logic | MUX, Decoder, FSM |

---

# One-Line Interview Answer

**"A `case` statement is a decision-making construct used inside an `always` block to select one block of code based on the value of an expression, making it ideal for implementing multiplexers, decoders, and finite state machines in Verilog."**
