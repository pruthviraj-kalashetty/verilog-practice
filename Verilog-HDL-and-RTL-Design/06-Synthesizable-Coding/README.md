# ◈ Synthesizable Verilog RTL Coding & Design Guidelines

[![Stage](https://img.shields.io/badge/Stage-Synthesizable_RTL-blue.svg?style=flat-square)](#)
[![Focus](https://img.shields.io/badge/Focus-RTL_Synthesis_&_Optimization-orange.svg?style=flat-square)](#)
[![Simulation](https://img.shields.io/badge/Simulator-AMD_Vivado-red.svg?style=flat-square&logo=xilinx)](#)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=flat-square)](#)

This module introduces the rules and guidelines for writing synthesizable Verilog HDL. In digital design, logic synthesis translates Register-Transfer Level (RTL) code into physical gate-level netlists mapped to target ASIC technology libraries or FPGA Lookup Tables (LUTs) and flip-flops.

Writing synthesis-friendly Verilog requires thinking in terms of physical hardware structures rather than procedural software loops. Master these guidelines to avoid simulation-synthesis mismatches, eliminate unintended latch inferences, and meet tight timing closure constraints.

---

## ⚡ Synthesis Construct Quick Reference

| Category | Synthesizable RTL Constructs | Non-Synthesizable Constructs (Simulation Only) |
| :--- | :--- | :--- |
| **Procedural Blocks** | `always @(posedge clk)`, `always @(*)` | `initial`, `always` without sensitivity list |
| **Delays & Timing** | Clock-driven state transitions | `#delay`, `wait()`, `fork...join` |
| **Assignments** | Non-blocking (`<=`) for sequential, Blocking (`=`) for combinational | Continuous assignment to `reg`, Force / Release |
| **Data Types** | `wire`, `reg`, `integer` (constants/loops) | `real`, `time`, `event` |
| **System Tasks** | Bitwise `$clog2()` (elaboration time) | `$display`, `$finish`, `$dumpfile`, `$stop` |
| **Control Flow** | Fully specified `if-else`, `case` | Infinite loops (`forever`), dynamic `while` loops |

---

## 🎯 Learning Objectives

By working through this module, you will be able to:

- Understand the difference between synthesizable and non-synthesizable Verilog code.
- Identify Verilog constructs that can be synthesized into hardware.
- Apply industry-oriented RTL coding guidelines.
- Identify and avoid common Verilog coding mistakes.
- Understand how coding style can affect the resulting hardware.
- Write clean, reliable, and synthesis-friendly RTL code.
- Build a strong foundation for professional RTL design and synthesis.

---

## 📂 Module Contents

| File | Core Technical Focus |
| :--- | :--- |
| **[`01-Synthesizable-vs-NonSynth.md`](./01-Synthesizable-vs-NonSynth.md)** | Differences between synthesizable and non-synthesizable Verilog constructs and their hardware implications. |
| **[`02-Coding-Guidelines.md`](./02-Coding-Guidelines.md)** | Practical guidelines for writing clean, reliable, readable, and synthesis-friendly RTL code. |
| **[`03-Common-Mistakes.md`](./03-Common-Mistakes.md)** | Common Verilog and RTL coding mistakes, their consequences, and recommended practices. |
| **[`04-Code-Optimization.md`](./04-Code-Optimization.md)** | RTL coding techniques for improving hardware efficiency, readability, timing, and resource utilization. |

---

## 🌲 Directory Structure

```text
06-Synthesizable-Coding/
├── README.md
├── 01-Synthesizable-vs-NonSynth.md
├── 02-Coding-Guidelines.md
├── 03-Common-Mistakes.md
└── 04-Code-Optimization.md
```

---

## 🛠️ Core Concepts Covered

### 1. Synthesizable vs. Non-Synthesizable Verilog

Understand which Verilog constructs can be converted into physical hardware during synthesis and which constructs are mainly intended for simulation and verification.

Key concepts include:

- Synthesizable RTL
- Non-synthesizable constructs
- Hardware inference
- Simulation vs. synthesis
- Synthesis limitations

### 2. RTL Coding Guidelines

Learn how to write structured and predictable RTL code suitable for synthesis and further design development.

Key practices include:

- Clear coding style
- Proper signal declarations
- Correct use of `always` blocks
- Appropriate blocking and non-blocking assignments
- Complete combinational logic descriptions
- Avoiding unintended hardware inference

### 3. Common Coding Mistakes

Understand coding practices that can lead to incorrect simulation behavior, unintended hardware, or synthesis issues.

Common areas include:

- Incomplete assignments
- Unintended latches
- Incorrect sensitivity handling
- Blocking vs. non-blocking assignment misuse
- Multiple drivers
- Width mismatches
- Improper reset handling

### 4. RTL Code Optimization

Understand how RTL coding decisions can influence the synthesized hardware implementation.

Optimization considerations include:

- Logic utilization
- Hardware resource usage
- Timing performance
- Critical paths
- Code simplicity
- Efficient logic implementation

### 5. Synthesis-Aware RTL Design

Understand that RTL code represents hardware rather than conventional software instructions. Good RTL should describe the intended hardware behavior clearly while remaining predictable during synthesis.

### 6. Foundation for Professional RTL Design

These concepts provide the foundation for further study of:

- RTL Design
- Logic Synthesis
- Design Constraints
- Timing Analysis
- Static Timing Analysis (STA)
- FPGA Design
- ASIC Design
- RTL Optimization
- Verification

---

## 📚 Reference Literature

- Neso Academy – Verilog HDL
- All About Electronics – Digital Electronics and Verilog HDL Tutorials

---

## 👤 Author

**Pruthviraj Kalashetty**

*Electronics & Communication Engineering Student*

**VLSI & RTL Design Learner**
