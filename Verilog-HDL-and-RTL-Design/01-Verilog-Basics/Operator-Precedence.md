# Operator Precedence in Verilog

## What is Operator Precedence?

**Operator precedence** decides **which operator is evaluated first** when an expression contains multiple operators.

**Simple Definition:**

> **Operator precedence is the order in which Verilog performs operations in an expression.**

---

# Why Do We Need Operator Precedence?

Without precedence, Verilog would not know which operation to perform first.

For example:

```verilog
a + b * c
```

Should it do:

```text
(a + b) * c
```

or

```text
a + (b * c)
```

Operator precedence gives the correct order.

---

# Highest to Lowest Precedence

| Priority | Operators | Description |
|----------|-----------|-------------|
| 1 (Highest) | `()`, `[]` | Parentheses, Bit Select, Part Select |
| 2 | `!`, `~` | Logical NOT, Bitwise NOT |
| 3 | `*`, `/`, `%` | Multiplication, Division, Modulus |
| 4 | `+`, `-` | Addition, Subtraction |
| 5 | `<<`, `>>` | Shift Operators |
| 6 | `<`, `<=`, `>`, `>=` | Relational Operators |
| 7 | `==`, `!=`, `===`, `!==` | Equality Operators |
| 8 | `&` | Bitwise AND |
| 9 | `^`, `~^`, `^~` | Bitwise XOR, XNOR |
| 10 | `|` | Bitwise OR |
| 11 | `&&` | Logical AND |
| 12 | `||` | Logical OR |
| 13 | `?:` | Conditional (Ternary) Operator |
| 14 (Lowest) | `=` , `<=` *(assignment)* | Assignment Operators |

> **Note:** The `<=` symbol is used in two different ways:
> - As a **relational operator** (`a <= b`) for comparison.
> - As a **non-blocking assignment** (`q <= d`) inside procedural blocks.
> The meaning depends on the context.

---

# Example 1

```verilog
assign y = 2 + 3 * 4;
```

First:

```text
3 × 4 = 12
```

Then:

```text
2 + 12 = 14
```

Result:

```text
y = 14
```

---

# Example 2

```verilog
assign y = (2 + 3) * 4;
```

Parentheses have the highest priority.

First:

```text
2 + 3 = 5
```

Then:

```text
5 × 4 = 20
```

Result:

```text
y = 20
```

---

# Example 3

```verilog
assign y = !a && b;
```

First:

```text
!a
```

Then:

```text
&&
```

Equivalent to:

```verilog
assign y = (!a) && b;
```

---

# Example 4

```verilog
assign y = a | b & c;
```

First:

```text
b & c
```

Then:

```text
a | (b & c)
```

---

# Example 5

```verilog
assign y = a + b << 1;
```

First:

```text
a + b
```

Then:

```text
(a + b) << 1
```

because `+` has higher precedence than `<<`.

---

# Real-Life Example

Think of solving
