# Blocking Assignment (`=`) in Verilog

## What is a Blocking Assignment?

A **blocking assignment** uses the **`=`** operator.

It executes statements **one after another**. The next statement **waits** until the current statement finishes.

**Simple Definition:**

> **A blocking assignment executes statements sequentially. Each statement must complete before the next one starts.**

---

# Why Do We Use Blocking Assignment?

Blocking assignment is used to:

- Describe combinational logic
- Perform step-by-step calculations
- Execute statements in sequence
- Create temporary variables

---

# Syntax

```verilog id="e6r91v"
variable = expression;
```

Example:

```verilog id="jlwm8p"
a = b;
```

---

# How Blocking Assignment Works

```text id="h8g24k"
Statement 1
      │
      ▼
Finished
      │
      ▼
Statement 2
      │
      ▼
Finished
      │
      ▼
Statement 3
```

Each statement **blocks** the next one until it completes.

---

# Example 1

```verilog id="cm5qk2"
always @(*)
begin
    a = b;
    c = a;
end
```

Assume:

```text id="p0jm7s"
b = 5
```

Execution:

### Step 1

```text id="mjlwm6"
a = b

a = 5
```

### Step 2

```text id="a2kq4m"
c = a

c = 5
```

Final Result:

```text id="tljlwm"
a = 5

c = 5
```

---

# Example 2

```verilog id="6e8j5y"
always @(*)
begin
    x = 10;
    y = x + 5;
    z = y + 2;
end
```

Execution:

```text id="i4l7vo"
Step 1

x = 10

↓

Step 2

y = 15

↓

Step 3

z = 17
```

Each statement uses the **updated value** from the previous statement.

---

# Flow of Blocking Assignment

```text id="n7jlwm"
Statement 1
      ↓
Statement 2
      ↓
Statement
