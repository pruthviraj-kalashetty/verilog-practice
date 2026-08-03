# If-Else Statement in Verilog

## What is an If-Else Statement?

The **if-else statement** is a decision-making statement used inside an **`always` block**.

It checks a condition:

- If the condition is **true**, the `if` block executes.
- If the condition is **false**, the `else` block executes.

**Simple Definition:**

> **An if-else statement allows a Verilog program to make decisions based on a condition.**

---

# Why Do We Use If-Else?

The `if-else` statement is used to:

- Make decisions
- Select between two or more operations
- Design combinational logic
- Design sequential logic
- Build digital circuits like multiplexers and controllers

---

# Basic Syntax

```verilog
if (condition)
begin
    // Statements
end
else
begin
    // Statements
end
```

---

# How If-Else Works

```text
Condition
    │
    ▼
Is it TRUE?
   / \
 Yes  No
 │     │
 ▼     ▼
IF    ELSE
Block Block
```

Only **one block** executes.

---

# Example 1: Simple If-Else

```verilog
module example(
    input a,
    input b,
    input sel,
    output reg y
);

always @(*)
begin
    if (sel)
        y = a;
    else
        y = b;
end

endmodule
```

### Working

If:

```text
sel = 1
a = 1
b = 0
```

Output:

```text
y = 1
```

If:

```text
sel = 0
a = 1
b = 0
```

Output:

```text
y = 0
```

---

# Example 2: AND Gate Using If-Else

```verilog
module and_gate(
    input a,
    input b,
    output reg y
);

always @(*)
begin
    if (a & b)
        y = 1'b1;
    else
        y = 1'b0;
end

endmodule
```

---

# Example 3: Comparator

```verilog
always @(*)
begin
    if (a > b)
        greater = 1;
    else
        greater = 0;
end
```

Working:

```text
If a = 8
   b = 5

↓

greater = 1
```

---

# Example 4: D Flip-Flop with Reset

```verilog
always @(posedge clk)
begin
    if (reset)
        q <= 0;
    else
        q <= d;
end
```

Working:

```text
If reset = 1

↓

q = 0

----------------

If reset = 0

↓

q = d
```

---

# Nested If-Else

An `if` statement can contain another `if`.

```verilog
always @(*)
begin
    if (a)
    begin
        if (b)
            y = 1;
        else
            y = 0;
    end
    else
        y = 0;
end
```

This is called a **nested if-else**.

---

# If-Else Ladder

When there are multiple conditions, use an **if-else-if ladder**.

```verilog
always @(*)
begin
    if (a > b)
        y = 2'b01;
    else if (a < b)
        y = 2'b10;
    else
        y = 2'b00;
end
```

---

# Where is If-Else Used?

Used in:

- Multiplexers
- Comparators
- Priority Encoders
- Control Logic
- Flip-Flops with Reset
- FSM Decision Logic

---

# Real-Life Example

Imagine a password lock.

```text
Correct Password?
       │
      / \
    Yes  No
     │    │
     ▼    ▼
 Open  Keep Locked
 Door
```

The lock makes a decision based on a condition.

This is similar to an `if-else` statement.

---

# Advantages

- Easy to understand.
- Simple decision-making.
- Good for two or more conditions.
- Widely used in RTL design.

---

# Disadvantages

- Many conditions can make the code long.
- For many fixed choices, a `case` statement is often easier to read.

---

# Common Beginner Mistakes

### Mistake 1

Forgetting the `else` in combinational logic.

Wrong:

```verilog
always @(*)
begin
    if (sel)
        y = a;
end
```

If `sel = 0`, `y` is not assigned.

This may create an **unwanted latch**.

Correct:

```verilog
always @(*)
begin
    if (sel)
        y = a;
    else
        y = b;
end
```

---

### Mistake 2

Using `=` and `<=` incorrectly.

- Use **`=`** for combinational logic (`always @(*)`).
- Use **`<=`** for sequential logic (`always @(posedge clk)`).

---

### Mistake 3

Forgetting `begin` and `end` for multiple statements.

Correct:

```verilog
if (sel)
begin
    y = a;
    z = b;
end
```

---

# If-Else vs Case Statement

| If-Else | Case |
|---------|------|
| Best for conditions and ranges | Best for fixed values |
| Can check `>`, `<`, `==` | Checks exact matching values |
| Can become long | Cleaner for many choices |

---

# Interview Questions

### What is an if-else statement?

An if-else statement is a decision-making statement that executes one block when a condition is true and another block when it is false.

---

### Where is if-else used?

- Combinational Logic
- Sequential Logic
- Multiplexers
- Comparators
- FSMs

---

### Which procedural block commonly uses if-else?

```verilog
always @(*)
```

and

```verilog
always @(posedge clk)
```

---

### Why should every output be assigned in combinational logic?

To avoid unintended latch inference.

---

### When should you use if-else instead of case?

Use `if-else` when conditions involve comparisons such as `>`, `<`, `>=`, `<=`, or complex Boolean expressions.

---

# Easy Summary

- `if-else` is used for decision-making.
- Only one branch executes.
- Used inside an `always` block.
- Can be used for combinational and sequential logic.
- Assign outputs in every possible condition for combinational logic.

---

# Easy Trick to Remember

```text
Condition
    ↓
TRUE?
 /     \
Yes     No
 ↓       ↓
IF     ELSE
```

---

# Key Points for Interviews

- Used inside procedural blocks.
- Supports simple, nested, and ladder structures.
- Common in multiplexers, comparators, and control logic.
- Use `=` in combinational logic.
- Use `<=` in sequential logic.
- Avoid latch inference by assigning outputs in all branches.

---

# One-Line Interview Answer

**"The `if-else` statement is a decision-making construct used inside an `always` block to execute different statements based on whether a condition is true or false, making it essential for implementing combinational and sequential logic in Verilog."**
