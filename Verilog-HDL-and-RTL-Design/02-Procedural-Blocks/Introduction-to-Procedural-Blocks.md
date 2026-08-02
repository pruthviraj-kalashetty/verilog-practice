# Introduction to Procedural Blocks

## What are Procedural Blocks?

A **procedural block** is a block of Verilog code that contains statements executed **in a specific sequence**.

Unlike the `assign` statement (which continuously updates the output), procedural blocks execute statements one after another.

**Simple Definition:**

> **A procedural block is a block of Verilog code used to describe hardware behavior by executing statements sequentially.**

---

# Why Do We Use Procedural Blocks?

Procedural blocks are used to:

- Describe hardware behavior
- Write combinational logic
- Write sequential logic
- Initialize signals
- Model flip-flops and registers
- Write testbenches

---

# Types of Procedural Blocks

Verilog has **two main procedural blocks**:

## 1. Initial Block

- Executes **only once**
- Starts at simulation time = 0
- Mainly used in **testbenches**

Example:

```verilog
initial
begin
    a = 0;
    b = 1;
end
```

---

## 2. Always Block

- Executes **repeatedly**
- Runs whenever the sensitivity list is triggered
- Used for **RTL hardware design**

Example:

```verilog
always @(*)
begin
    y = a & b;
end
```

---

# Procedural Block Syntax

## Initial Block

```verilog
initial
begin
    // Statements
end
```

---

## Always Block

```verilog
always @(sensitivity_list)
begin
    // Statements
end
```

---

# How Procedural Blocks Work

```text
Simulation Starts
        │
        ▼
Procedural Block Begins
        │
        ▼
Execute Statements
        │
        ▼
Generate Output
```

---

# Procedural Block vs Continuous Assignment

| Procedural Block | Continuous Assignment (`assign`) |
|------------------|----------------------------------|
| Uses `initial` or `always` | Uses `assign` |
| Executes statements sequentially | Continuously updates output |
| Can use `if`, `case`, `for`, `while` | Cannot use procedural statements |
| Usually assigns to `reg` (Verilog) | Drives `wire` |
| Used for combinational and sequential logic | Mainly used for simple combinational logic |

---

# Common Statements Used Inside Procedural Blocks

- Assignment (`=` and `<=`)
- `if-else`
- `case`
- `for`
- `while`
- `repeat`
- `forever`
- Tasks
- Functions

---

# Real-Life Example

Imagine following a cooking recipe.

```text
Start Cooking
      │
      ▼
Step 1 → Add Oil
      │
      ▼
Step 2 → Add Vegetables
      │
      ▼
Step 3 → Cook for 10 Minutes
      │
      ▼
Food Ready
```

Each step is performed **one after another**.

A procedural block works in the same way—it executes statements in sequence.

---

# Where Are Procedural Blocks Used?

- Combinational circuits
- Sequential circuits
- Flip-flops
- Registers
- Counters
- Finite State Machines (FSM)
- Testbenches

---

# Common Beginner Mistakes

### Mistake 1

Thinking `assign` and `always` are the same.

❌ Wrong

- `assign` is a **continuous assignment**.
- `always` is a **procedural block**.

---

### Mistake 2

Thinking procedural blocks execute all statements at the same time.

❌ Wrong

Statements inside a procedural block execute **in sequence**.

---

### Mistake 3

Using `initial` for synthesizable ASIC RTL logic.

❌ Not recommended.

Use `always` for synthesizable hardware behavior.

---

# Interview Questions

### What is a procedural block?

A procedural block is a block of Verilog code that executes statements sequentially to describe hardware behavior.

---

### What are the two procedural blocks in Verilog?

- `initial`
- `always`

---

### Which procedural block executes only once?

`initial`

---

### Which procedural block executes repeatedly?

`always`

---

### Where are procedural blocks commonly used?

- RTL Design
- Testbenches
- Sequential Logic
- Combinational Logic

---

# Easy Summary

- Procedural blocks describe hardware behavior.
- They execute statements **sequentially**.
- Two types:
  - `initial`
  - `always`
- `initial` runs once.
- `always` runs repeatedly.
- Used for RTL design and simulation.

---

# Easy Trick to Remember

```text
Procedural Blocks

        │
        ├── initial
        │      ↓
        │   Runs Once
        │
        └── always
               ↓
         Runs Forever
```

---

# One-Line Interview Answer

**"Procedural blocks are Verilog blocks (`initial` and `always`) that execute statements sequentially to describe hardware behavior for simulation and RTL design."**
