## *About HDL* (Hardwatre Descriptional Language)

Verilog HDL (Hardware Description Language) is a standardized programming language used by engineers to design, model, and verify digital electronic circuits. Unlike software languages (like C or Python) that execute sequentially on a processor, Verilog code is converted into physical hardware structures, such as microprocessors or memory chips, often found in smartphones and computers.

## *HDL vs SOFTWARRE* 

The fundamental difference is that Verilog as a Hardware Description Language (HDL) describes physical structures and parallel circuits, while software languages like C++ or Python provide a sequential list of instructions for an existing processor to execute. Even though Verilog code looks highly similar to C, it is a description of physical components (like logic gates and flip-flops), not software

## *Module Structure*
A Verilog module is the fundamental building block of digital design, serving as an encapsulated hardware component with defined inputs, outputs, and internal logic. Every module is enclosed between the module and endmodule keywords.

The main keywords :- module (To start code), endmodule (To end code)

## *Port Declaration*

In Verilog, port declarations define the input, output, and bidirectional interfaces of a hardware module. There are two methods used to declare ports: ANSI style (modern, recommended) and Non-ANSI style (legacy).

Quick Summary of Key ConceptsPort Directions: input (data enters module), output (data leaves module), and inout (bidirectional data).Default Type: Ports default to the wire data type if no internal type is specified.Sequential Outputs: If an output is updated inside an always or initial block, it must be explicitly declared as a variable type like reg.

## *Data types*

In Verilog, data types are divided into two primary hardware-representative categories: Nets (which represent physical connections) and Variables/Registers (which abstractly represent data storage elements).

All basic Verilog data types operate on a 4-state value system consisting of 0 (false), 1 (true), X (unknown), and Z (high impedance).



### 1. net (e.g., `wire`)
* **Hardware Analogy:** A physical piece of copper wire.
* **Behavior:** **Does not store values.** It continuously reflects the value of whatever is actively driving it (via a gate output or an `assign` statement). 
* **Default Value:** `z` (high impedance/floating) when undriven.
* **Context:** Used to connect structural elements or modules together.

### 2. reg
* **Hardware Analogy:** A data storage element (can synthesize to a Flip-Flop, Latch, or pure combinational wire depending on how it's used).
* **Behavior:** **Stores its value** until a new value is explicitly assigned to it. 
* **Default Value:** `x` (unknown) at simulation start.
* **Context:** Must be used on the left-hand side (LHS) of procedural assignments inside `always` or `initial` blocks.

### 3. integer
* **Type:** A general-purpose register data type.
* **Properties:** **32-bit signed** quantity. It holds 4-state logic values (`0`, `1`, `x`, `z`).
* **Context:** Most commonly used as loop control variables (e.g., in `for` loops) and for simple arithmetic constants during simulation.

### 4. real
* **Type:** Floating-point numbers.
* **Properties:** **64-bit double-precision** floating-point number (adheres to IEEE 754 standard). 
* **Limitation:** Cannot hold `x` or `z` states; defaults to `0.0` if ambiguous. **Non-synthesizable** (simulation-only).
* **Context:** Used for high-level mathematical modeling, delays, and analog-mixed-signal (AMS) simulations.

### 5. time
* **Type:** Unsigned 64-bit integer.
* **Properties:** Holds 4-state logic, but strictly handles **positive integers** representing simulation timestamps.
* **Context:** Used in conjunction with the `$time` system task to record, measure, and debug simulation delays.

### 6. string *(SystemVerilog)*
* **Type:** A variable-length, dynamically allocated array of bytes (characters).
* **Properties:** Purely for simulation/testbenches. Each character is an 8-bit ASCII value.
* **Context:** Used for printing debug messages, formatting display tasks (`$display`), and tracking test case names in testbenches.



## ⚡ Synthesis & Placement Cheat Sheet

| Data Type | Allowed inside `assign` (LHS)? | Allowed inside `always` (LHS)? | Synthesizable? | Default State |
| :--- | :---: | :---: | :---: | :---: |
| **`net` (`wire`)** |  ✅ Yes |  ❌ No |  ✅ Yes | `z` |
| **`reg`** |  ❌ No |  ✅ Yes |  ✅ Yes | `x` |
| **`integer`** |  ❌ No |  ✅ Yes |  ⚠️ Yes *(mainly loops)* | `x` |
| **`real`** |  ❌ No |  ✅ Yes |  ❌ No *(Simulation Only)* | `0.0` |
| **`time`** |  ❌ No |  ✅ Yes |  ❌ No *(Simulation Only)* | `x` |
| **`string`** |  ❌ No |  ✅ Yes |  ❌ No *(Simulation Only)* | `""` (empty) |

---

## *Number Representation*

# Verilog Number Representation Quick-Ref

### 📝 Syntax Template

*<size>'<sign><base><value>*


Size: (Optional) Constant specifying the total number of bits.

Sign: (Optional) s or S for signed (defaults to unsigned).

Base: b (binary), o (octal), d (decimal), h (hex).

Value: The actual digits (case-insensitive for hex/bases).

---

## Verilog Operators & Parameters Quick-Ref

### ⚙️ 1. Operators Cheat Sheet
Grouped by priority (highest to lowest) and hardware behavior.

#### Arithmetic & Shift
| Operator | Type | Behavior | Synthesizable? |
| :---: | :--- | :--- | :---: |
| `+`, `-`, `*` | Arithmetic | Add, Subtract, Multiply | ✅ Yes |
| `/`, `%` | Arithmetic | Divide, Modulo | ⚠️ Only if power of 2 (or heavy area footprint) |
| `<<`, `>>` | Logical Shift | Shift left/right (vacated bits filled with `0`) | ✅ Yes (Wire shifting) |
| `<<<`, `>>>` | Arithmetic Shift | Shift left/right (right shift maintains sign bit) | ✅ Yes |

#### Logical & Bitwise
| Operator | Type | Behavior | Synthesizable? |
| :---: | :--- | :--- | :---: |
| `!`, `&&`, `\|\|` | Logical | Outputs single-bit scalar (`1` or `0`) | ✅ Yes |
| `~`, `&`, `\|`, `^`, `~^` | Bitwise | Bit-by-bit operations across entire width | ✅ Yes (Gates) |
| `&`, `\|`, `^` (unary) | Reduction | Operates on all bits of a *single* vector ➡️ 1-bit result | ✅ Yes |

#### Relational & Equality
| Operator | Type | Behavior | Synthesizable? |
| :---: | :--- | :--- | :---: |
| `>`, `<`, `>=`, `<=` | Relational | Compares magnitudes | ✅ Yes (Comparators) |
| `==`, `!=` | Logical Equality | Compares values; returns `x` if `x`/`z` present | ✅ Yes |
| `===`, `!==` | Case Equality | Matches strictly including `x` and `z` | ❌ No (Simulation only) |

#### Miscellaneous
| Operator | Type | Behavior | Synthesizable? |
| :---: | :--- | :--- | :---: |
| `{ }` | Concatenation | Joins bits together into a larger vector | ✅ Yes |
| `{N{ }}` | Replication | Repeats a bit pattern `N` times | ✅ Yes |
| `? :` | Conditional | Ternary operator (Mux logic) | ✅ Yes (Multiplexer) |

---

### 🛠️ 2. Parameters (Constants)
Used to create reusable, configurable modules. 

#### `parameter` (Module-level)
* Can be overridden at instantiation time.
* **Syntax:** `parameter WIDTH = 8;`
* **Override Example:**
```verilog
// Instantiating a module and overriding its default parameter
my_design #(.WIDTH(16)) uut (.clk(clk), .data(data));



