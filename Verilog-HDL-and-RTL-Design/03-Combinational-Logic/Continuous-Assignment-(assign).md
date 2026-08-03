# Continuous Assignment (`assign`) in Verilog

## What is Continuous Assignment?

A **continuous assignment** uses the **`assign`** keyword to continuously drive a value to a **wire**.

Whenever the input changes, the output is **automatically updated**.

**Simple Definition:**

> **Continuous assignment continuously updates the output whenever the input changes.**

---

# Why Do We Use Continuous Assignment?

Continuous assignment is used to:

- Describe combinational logic
- Connect logic using Boolean expressions
- Drive `wire` signals
- Build simple digital circuits

It is mainly used in **Dataflow Modeling**.

---

# Syntax

```verilog
assign output = expression;
```

Example:

```verilog
assign y = a & b;
```

Meaning:

```text
If a or b changes,

y is updated automatically.
```

---

# How Continuous Assignment Works

```text
Input Changes
      │
      ▼
Boolean Expression
      │
      ▼
Output Updates Automatically
```

The output is always kept up to date.

---

# Example 1: AND Gate

```verilog
module and_gate(
    input a,
    input b,
    output y
);

assign y = a & b;

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

If:

```text
a = 1
b = 0
```

Then:

```text
y = 0
```

The output changes immediately when the inputs change.

---

# Example 2: OR Gate

```verilog
assign y = a | b;
```

Truth:

```text
a = 0
b = 0
↓

y = 0

----------------

a = 1
b = 0
↓

y = 1
```

---

# Example 3: NOT Gate

```verilog
assign y = ~a;
```

If:

```text
a = 1

↓

y = 0
```

---

# Example 4: XOR Gate

```verilog
assign y = a ^ b;
```

If:

```text
a = 1
b = 0

↓

y = 1
```

---

# Example 5: Complex Expression

```verilog
assign y = (a & b) | c;
```

Working:

```text
Step 1

a & b

↓

Step 2

Result | c

↓

Output y
```

---

# Continuous Assignment vs Procedural Assignment

| Continuous Assignment | Procedural Assignment |
|------------------------|----------------------|
| Uses `assign` | Uses `always` or `initial` |
| Drives `wire` | Usually assigns to `reg` (Verilog) |
| Updates automatically | Executes when triggered |
| Used for simple combinational logic | Used for combinational and sequential logic |

---

# Where is Continuous Assignment Used?

Used in:

- AND Gate
- OR Gate
- NOT Gate
- XOR Gate
- Multiplexer
- Decoder
- Encoder
- Comparator
- Arithmetic circuits

---

# Real-Life Example

Think of a room light connected to a switch.

```text
Switch Changes
      │
      ▼
Light Changes Immediately
```

There is no need to press another button.

The light always follows the switch.

Similarly, the output of an `assign` statement always follows the input.

---

# Rules for Continuous Assignment

- Use the `assign` keyword.
- Usually drives a `wire`.
- No `begin` or `end` is required.
- No sensitivity list is required.
- Used only for combinational logic.

---

# Common Beginner Mistakes

### Mistake 1

Using `assign` with a `reg`.

Wrong:

```verilog
reg y;

assign y = a & b;
```

Prefer:

```verilog
wire y;

assign y = a & b;
```

---

### Mistake 2

Using `assign` inside an `always` block.

Wrong:

```verilog
always @(*)
begin
    assign y = a & b;
end
```

`assign` is written **outside** procedural blocks.

---

### Mistake 3

Using `assign` for flip-flops.

Wrong:

```verilog
assign q = d;
```

Flip-flops require a clock and should use:

```verilog
always @(posedge clk)
begin
    q <= d;
end
```

---

# Interview Questions

### What is continuous assignment?

Continuous assignment continuously drives a value to a wire using the `assign` keyword.

---

### Which keyword is used?

```text
assign
```

---

### Which data type is commonly used?

```text
wire
```

---

### Is a sensitivity list required?

No.

The output updates automatically whenever an input changes.

---

### Where is continuous assignment used?

Simple combinational logic.

---

# Easy Summary

- Uses the `assign` keyword.
- Continuously updates the output.
- Drives `wire` signals.
- No sensitivity list.
- Used for combinational logic.
- Foundation of Dataflow Modeling.

---

# Easy Trick to Remember

```text
assign

Input Changes
      ↓
Output Changes

Always Active
```

---

# Key Points for Interviews

- Keyword: `assign`
- Used with: `wire`
- No `always` block needed.
- No clock required.
- No sensitivity list required.
- Used to describe combinational logic using Boolean expressions.

---

# Continuous Assignment vs Always Block

| `assign` | `always @(*)` |
|----------|---------------|
| Continuous assignment | Procedural assignment |
| Simple Boolean expressions | Complex logic with `if`, `case`, loops |
| No `begin/end` | Uses `begin/end` (for multiple statements) |
| No sensitivity list | Uses `@(*)` for combinational logic |
| Usually drives `wire` | Usually assigns to `reg` (Verilog) |

---

# One-Line Interview Answer

**"Continuous assignment uses the `assign` keyword to continuously drive a `wire` with the result of a Boolean expression, making it ideal for describing simple combinational logic in Verilog."**
