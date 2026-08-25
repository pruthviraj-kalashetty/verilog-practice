# ◈ Procedural Blocks in Verilog HDL

[![Stage](https://img.shields.io/badge/Stage-Procedural_Blocks-blue.svg?style=flat-square)](#)
[![Focus](https://img.shields.io/badge/Focus-Verilog_RTL_Modeling-green.svg?style=flat-square)](#)
[![Simulation](https://img.shields.io/badge/Simulator-AMD_Vivado-red.svg?style=flat-square&logo=xilinx)](#)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=flat-square)](#)

This module introduces procedural blocks in Verilog HDL, which describe the behavioral operation of digital hardware circuits. It covers continuous vs. procedural execution, `always` and `initial` constructs, sensitivity list evaluation, and the critical design rules governing blocking (`=`) and non-blocking (`<=`) assignment types.

Mastering procedural blocks is essential for writing synthesizable RTL for both combinational logic and sequential state storage elements.

---

## ⚡ Procedural Assignment Quick Reference

| Assignment Type | Operator | Typical Context | Execution Behavior | Target Hardware |
| :--- | :---: | :--- | :--- | :--- |
| **Blocking** | `=` | Combinational Logic (`always @(*)`) | Executes sequentially in line order; blocks subsequent statements. | Multiplexers, Decoders, ALUs |
| **Non-Blocking** | `<=` | Sequential Logic (`always @(posedge clk)`) | Evaluates concurrently; schedules updates for the end of time step. | Registers, Flip-Flops, Pipelines |
| **Continuous** | `assign` | Dataflow Logic (Outside procedural blocks) | Evaluates immediately upon any RHS net transition. | Logic Gates, Wire Busses |

---

## ⚡ Verilog Quick Reference

| Construct / Concept | Key Syntax / Description | Role in RTL Design |
| :--- | :--- | :--- |
| **`wire` vs `reg`** | `wire` (combinational connectivity), `reg` (procedural assignment/storage) | Defines continuous combinational nets versus procedural variable storage. |
| **Module Structure** | `module name(ports); ... endmodule` | Encapsulates hierarchical hardware blocks, ports, and internal logic. |
| **Number Representation** | `<size>'<radix><value>` (e.g., `8'hFF`, `4'b1010`) | Specifies exact bit-widths and numerical bases for hardware literals. |
| **Parameters** | `parameter WIDTH = 8;` | Enables generic, reusable, and scalable hardware module architectures. |

---

## 🎯 Learning Objectives

By working through this module, you will be able to:

- Understand the purpose of Hardware Description Languages (HDLs).
- Differentiate between software programming and hardware description.
- Learn the syntax and structure of Verilog modules.
- Understand Verilog data types and number representation.
- Apply Verilog operators to model digital logic.
- Create reusable and parameterized hardware modules.
- Build a strong foundation for RTL design and digital circuit implementation.

---

## 📂 Module Contents

| File | Core Technical Focus |
| :--- | :--- |
| **[`What-is-HDL.md`](./What-is-HDL.md)** | Introduction to Hardware Description Languages and their role in digital hardware design. |
| **[`HDL-vs-Software.md`](./HDL-vs-Software.md)** | Comparison between software programming and hardware description languages. |
| **[`Introduction-to-Verilog.md`](./Introduction-to-Verilog.md)** | Overview of Verilog HDL, design flow, and applications in digital design. |
| **[`Module-Structure.md`](./Module-Structure.md)** | Basic syntax and structure of Verilog modules. |
| **[`Port-Declaration.md`](./Port-Declaration.md)** | Input, output, and inout port declarations in Verilog. |
| **[`Data-Types-wire-vs-reg.md`](./Data-Types-wire-vs-reg.md)** | Understanding wire, reg, and their applications in RTL coding. |
| **[`Integer-Real-Time.md`](./Integer-Real-Time.md)** | Integer, real, and time data types used in Verilog. |
| **[`Number-Representation.md`](./Number-Representation.md)** | Binary, octal, decimal, hexadecimal, signed, and unsigned number representation. |
| **[`Operators-in-Verilog.md`](./Operators-in-Verilog.md)** | Arithmetic, logical, relational, reduction, shift, concatenation, and conditional operators. |
| **[`Operator-Precedence.md`](./Operator-Precedence.md)** | Evaluation order of Verilog operators and expression precedence. |
| **[`Parameters.md`](./Parameters.md)** | Parameter declaration and reusable hardware module design. |

---

## 🌲 Directory Structure

```text
01-Verilog-Basics/
├── README.md
├── What-is-HDL.md
├── HDL-vs-Software.md
├── Introduction-to-Verilog.md
├── Module-Structure.md
├── Port-Declaration.md
├── Data-Types-wire-vs-reg.md
├── Integer-Real-Time.md
├── Number-Representation.md
├── Operators-in-Verilog.md
├── Operator-Precedence.md
└── Parameters.md
```

---

## 🛠️ Core Concepts Covered

### 1. Hardware Description Languages (HDLs)

Understand the purpose of HDLs and how they are used to describe, model, simulate, and synthesize digital hardware systems.

### 2. Verilog Fundamentals

Learn the basic syntax, module organization, and coding style required to write structured and synthesizable Verilog programs.

### 3. Data Types and Number Representation

Study Verilog data types, logic values, and different number representations used for hardware modeling and simulation.

### 4. Verilog Operators

Understand arithmetic, logical, bitwise, relational, reduction, shift, concatenation, and conditional operators used in RTL coding.

### 5. Parameterized Design

Learn how parameters improve hardware reusability, scalability, and maintainability by enabling configurable module designs.

---

## 📚 Reference Literature

- Neso Academy – Verilog HDL
- All About Electronics – Verilog HDL Tutorials

---

## 👤 Author

**Pruthviraj Kalashetty**

*Electronics & Communication Engineering Student*

**VLSI & RTL Design Learner**
