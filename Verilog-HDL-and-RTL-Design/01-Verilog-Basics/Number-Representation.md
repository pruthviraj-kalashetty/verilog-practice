# Number Representation in Verilog

## What is Number Representation?

**Number representation** is the way we **write numbers in Verilog**.

Verilog supports numbers in different number systems such as **Binary, Decimal, Octal, and Hexadecimal**.

**Simple Definition:**

> **Number representation is the method of writing numbers in Verilog using different bases.**

---

# Why Do We Need Number Representation?

We use number representation to:

- Write binary values easily
- Represent large numbers
- Initialize registers and memories
- Write testbenches
- Design digital circuits

---

# General Syntax

```text
<size>'<base><value>
```

Example:

```text
4'b1010
8'd25
8'hFF
6'o45
```

---

# Parts of a Verilog Number

Example:

```text
8'b10101010
```

| Part | Meaning |
|------|---------|
| `8` | Number of bits (size) |
| `'` | Separator |
| `b` | Base (Binary) |
| `10101010` | Value |

---

# Number Bases

## 1. Binary (`b`)

Base = **2**

Uses only:

```text
0 1
```

Example:

```verilog
4'b1010
8'b11001100
1'b1
```

---

## 2. Decimal (`d`)

Base = **10**

Uses:

```text
0 1 2 3 4 5 6 7 8 9
```

Example:

```verilog
8'd25
4'd9
16'd1000
```

---

## 3. Octal (`o`)

Base = **8**

Uses:

```text
0 1 2 3 4 5 6 7
```

Example:

```verilog
6'o45
8'o123
```

---

## 4. Hexadecimal (`h`)

Base = **16**

Uses:

```text
0 1 2 3 4 5 6 7 8 9 A B C D E F
```

Example:

```verilog
8'hA5
16'hFFFF
4'hF
```

---

# Common Examples

| Verilog Number | Meaning |
|---------------|---------|
| `1'b1` | 1-bit binary value 1 |
| `4'b1010` | 4-bit binary number |
| `8'd25` | Decimal 25 stored in 8 bits |
| `8'hFF` | Hexadecimal FF stored in 8 bits |
| `6'o45` | Octal 45 stored in 6 bits |

---

# Size (Bit Width)

The **size** tells Verilog how many bits are used.

Example:

```verilog
4'b1010
```

Size = **4 bits**

---

Example:

```verilog
8'd5
```

Stored as:

```text
00000101
```

The number is padded with leading zeros to make it 8 bits.

---

# Base Symbols

| Symbol | Base | Name |
|--------|------|------|
| `b` | 2 | Binary |
| `d` | 10 | Decimal |
| `o` | 8 | Octal |
| `h` | 16 | Hexadecimal |

---

# Unknown (`x`) and High-Impedance (`z`)

Verilog also supports special values.

## Unknown (`x`)

Means the value is **unknown**.

Example:

```verilog
4'b10xx
```

---

## High-Impedance (`z`)

Means the signal is **not driving any value** (high impedance or floating).

Example:

```verilog
8'bzzzzzzzz
```

---

# Real-Life Example

Imagine a building.

- **Size** = Number of rooms.
- **Base** = Language used to number the rooms.
- **Value** = The room numbers themselves.

Similarly, in Verilog:

- Size tells how many bits are available.
- Base tells how to interpret the number.
- Value is the actual data.

---

# Common Beginner Mistakes

### Wrong

```verilog
'b1010
```

No size is specified. Although Verilog allows unsized numbers in some cases, beginners should always specify the size.

---

### Correct

```verilog
4'b1010
```

---

### Wrong

```verilog
4'b1020
```

Binary numbers can contain only **0** and **1**.

---

### Correct

```verilog
4'b1010
```

---

# Interview Questions

### What is number representation?

It is the method of writing numbers in Verilog using different bases.

---

### What are the four number bases in Verilog?

- Binary (`b`)
- Decimal (`d`)
- Octal (`o`)
- Hexadecimal (`h`)

---

### What does `8'hFF` mean?

An **8-bit hexadecimal number** with the value **FF**.

---

### What does `4'b1010` mean?

A **4-bit binary number** with the value **1010**.

---

### What is `x`?

`x` represents an **unknown** value.

---

### What is `z`?

`z` represents a **high-impedance (floating)** value.

---

# Easy Summary

- Verilog supports **Binary, Decimal, Octal, and Hexadecimal** numbers.
- General format:

```text
<size>'<base><value>
```

Example:

```text
8'b10101010
```

- `b` = Binary
- `d` = Decimal
- `o` = Octal
- `h` = Hexadecimal
- `x` = Unknown value
- `z` = High-impedance (floating)

---

# One-Line Interview Answer

**"In Verilog, numbers are represented using the format `<size>'<base><value>`, where the base can be binary (`b`), decimal (`d`), octal (`o`), or hexadecimal (`h`)."**
