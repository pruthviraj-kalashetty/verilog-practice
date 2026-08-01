# Verilog Data Types

## What are Data Types?

A **data type** tells Verilog **what kind of value a signal can store or carry**.

Think of a data type as a **container** for digital signals.

**Simple Definition:**

> **A data type defines how a signal is stored or transferred in a Verilog design.**

---

# Why are Data Types Needed?

Data types help Verilog know:

- How a signal should behave
- Whether it stores a value or only carries a value
- Where the signal can be used

Without data types, Verilog would not know how to handle signals.

---

# Main Data Types in Verilog

For beginners, you only need to master these first:

1. `wire`
2. `reg`

Later, you will learn:

- integer
- parameter
- localparam
- time
- real

For RTL Design interviews, **wire** and **reg** are the most important.

---

# 1. wire

## What is a Wire?

A **wire** is used to **carry a signal from one place to another**.

It **does not store** any value.

Think of it as an **electric wire** in your house.

Electricity passes through it, but the wire does not store electricity.

---

## Simple Definition

> **A wire transfers a signal but cannot remember or store it.**

---

## Real-Life Example

Imagine a water pipe.

```
Tank -------- Pipe -------- Tap
```

The pipe only carries water.

It never stores water.

A Verilog wire works the same way.

---

## Wire Symbol

```
Input ---- wire ---- Output
```

---

## Syntax

```verilog
wire signal_name;
```

Example:

```verilog
wire a;
wire b;
wire sum;
```

---

## Wire Example

```verilog
module and_gate(
    input a,
    input b,
    output y
);

assign y = a & b;

endmodule
```

Here,

- a → wire
- b → wire
- y → wire

Even though we didn't write `wire`, Verilog treats the ports used with `assign` as wires by default.

---

## Where is wire Used?

- assign statement
- Combinational circuits
- Connecting modules
- Logic gates

---

## Can a Wire Store Data?

❌ No

A wire only transfers signals.

---

## Memory?

```
wire = NO MEMORY
```

---

# 2. reg

## What is reg?

A **reg** can **hold (remember) a value** until another value is assigned.

Unlike a wire, it keeps its current value until it changes.

---

## Simple Definition

> **A reg stores a value until a new value is assigned.**

---

## Real-Life Example

Think of a whiteboard.

```
Write 5

Board shows 5

Until someone erases it,
the board still shows 5.
```

A reg behaves like this.

---

## Syntax

```verilog
reg signal_name;
```

Example

```verilog
reg q;
reg temp;
```

---

## Example

```verilog
always @(a or b)
begin
    y = a & b;
end
```

Here,

```
output reg y;
```

because `y` is assigned inside an `always` block.

---

## Memory?

```
reg = STORES VALUE
```

---

# Wire vs Reg

| Feature | wire | reg |
|----------|------|-----|
| Stores value | ❌ No | ✅ Yes |
| Carries signal | ✅ Yes | ✅ Yes |
| Used with `assign` | ✅ Yes | ❌ No |
| Used in `always` block | ❌ No | ✅ Yes |
| Has memory until reassigned | ❌ No | ✅ Yes |

---

# Easy Comparison

Imagine a classroom.

### Wire

Teacher speaks.

Students hear it.

Nothing is remembered automatically.

```
Teacher ---> Students
```

Only communication.

---

### Reg

Teacher writes on the board.

Everyone can still see it later.

```
Teacher ---> Whiteboard
```

The value stays until changed.

---

# Important Rule

### assign → wire

```verilog
wire y;

assign y = a & b;
```

Correct.

---

### always → reg

```verilog
output reg y;

always @(*)
begin
    y = a & b;
end
```

Correct.

---

# Wrong Examples

### Wrong

```verilog
reg y;

assign y = a & b;
```

Do not use `assign` to drive a `reg`.

---

### Wrong

```verilog
wire y;

always @(*)
begin
    y = a & b;
end
```

A `wire` cannot be assigned inside an `always` block.

---

# Visual Difference

```
WIRE

Input -------------> Output

Only transfers data
No memory
```

```
REG

Input ---> [Stores Value] ---> Output

Keeps value
Memory
```

---

# When Should I Use wire?

Use `wire` for:

- Logic gates
- assign statements
- Continuous connections
- Module connections
- Combinational logic with `assign`

---

# When Should I Use reg?

Use `reg` for:

- always blocks
- if-else
- case
- Flip-flops
- Registers
- Sequential logic
- Combinational logic written inside an `always` block

---

# Common Beginner Mistakes

❌ Thinking `reg` always means a hardware register.

In Verilog, `reg` means the signal can hold a value in procedural code. It does **not** automatically create a physical register. Whether hardware becomes a flip-flop or just combinational logic depends on how you write the `always` block.

---

❌ Using `assign` with `reg`.

Wrong.

---

❌ Assigning a `wire` inside an `always` block.

Wrong.

---

# Interview Questions

### What is a wire?

A wire carries signals from one point to another but cannot store a value.

---

### What is a reg?

A reg holds its value until another value is assigned in a procedural block.

---

### Which data type is used with `assign`?

`wire`

---

### Which data type is used inside an `always` block?

`reg`

---

### Does wire have memory?

No.

---

### Does reg always create a flip-flop?

No. It depends on how the `always` block is written.

---

# Easy Summary

- **wire** → Carries signals only.
- **reg** → Holds a value until it changes.
- `assign` drives **wire**.
- `always` assigns to **reg**.
- Learn these two well before moving to `assign` and `always`.

---

# One-Line Interview Answer

**"`wire` is
