# 07. Latch Inference & Latch-Free RTL Coding

[![Stage](https://img.shields.io/badge/Stage-Latch--Free_RTL-blue.svg?style=flat-square)](#)
[![Focus](https://img.shields.io/badge/Focus-Avoiding_Latch_Inference-orange.svg?style=flat-square)](#)
[![Simulation](https://img.shields.io/badge/Simulator-AMD_Vivado-red.svg?style=flat-square&logo=xilinx)](#)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=flat-square)](#)

This module introduces latch concepts, level-sensitive storage behavior, and how synthesis tools infer unintended transparent latches during RTL compilation. It covers the root causes of latch inference—such as missing `else` branches or incomplete `case` statements—and provides practical coding practices for writing predictable, latch-free combinational logic.

Eliminating unintended latches is critical in ASIC and FPGA engineering, as latches complicate Static Timing Analysis (STA), cause unexpected power consumption, create race conditions, and lead to serious simulation-synthesis mismatches.

---

## ⚡ Memory Storage Comparison & Quick Reference

| Feature / Metric | Transparent Latch | D Flip-Flop (Register) | Latch-Free Combinational Logic |
| :--- | :--- | :--- | :--- |
| **Trigger Mechanism** | Level-Sensitive (`enable` HIGH/LOW) | Edge-Triggered (`posedge`/`negedge clk`) | Continuous evaluation (no memory) |
| **Sensitivity List** | `@(enable or data)` | `@(posedge clk)` | `@(*)` |
| **Synthesis Trigger** | Incomplete paths in combinational `always` | Clock edge declaration with assignment | Complete coverage for all input states |
| **STA Complexity** | High (Time-borrowing, cycle checking) | Low (Setup/Hold checked at clock edge) | Pure delay path calculation |
| **FPGA Resource Use** | Inefficient (uses LUT memory / latch modes) | Standard Logic Block Dedicated Flip-Flops | Pure Lookup Tables (LUTs) |

---

## 🎯 Learning Objectives

By working through this module, you will be able to:

- Understand what a latch is and how it stores data.
- Identify the difference between intentional and unintended latch inference.
- Understand how incomplete RTL assignments can infer latches.
- Identify common coding patterns that cause unintended latches.
- Write complete combinational logic descriptions.
- Apply coding practices for creating latch-free RTL.
- Improve the reliability and predictability of synthesizable Verilog code.

---

## 📂 Module Contents

| File | Core Technical Focus |
| :--- | :--- |
| **[`01-What-is-a-Latch.md`](./01-What-is-a-Latch.md)** | Fundamentals of latches, level-sensitive operation, data storage, and their role in digital circuits. |
| **[`02-Latch-Inference.md`](./02-Latch-Inference.md)** | How incomplete assignments and RTL coding patterns can cause synthesis tools to infer unintended latches. |
| **[`03-Writing-Latch-Free-Code.md`](./03-Writing-Latch-Free-Code.md)** | Practical RTL coding techniques for preventing unintended latch inference in combinational logic. |

---

## 🌲 Directory Structure

```text
07-Avoiding-Latches/
├── README.md
├── 01-What-is-a-Latch.md
├── 02-Latch-Inference.md
└── 03-Writing-Latch-Free-Code.md
```

---

## 🛠️ Core Concepts Covered

### 1. Latch Fundamentals

Understand a latch as a level-sensitive storage element that can retain its previous value when its control condition does not permit a new value to be stored.

Key concepts include:

- Level-sensitive operation
- Data storage
- Enable signal
- Transparent and hold conditions
- Latch behavior

### 2. Latch Inference

Understand how synthesis tools infer hardware based on the behavior described by RTL code.

A latch can be unintentionally inferred when a combinational process does not assign an output for every possible input condition.

Common causes include:

- Incomplete `if` statements
- Incomplete `case` statements
- Missing default assignments
- Incomplete combinational logic descriptions

### 3. Why Unintended Latches Are a Problem

Unintended latches can introduce storage behavior where purely combinational logic was intended.

Potential consequences include:

- Unexpected hardware inference
- Timing complexity
- Difficult verification
- Simulation and synthesis mismatches
- Unpredictable design behavior
- Additional timing-analysis considerations

### 4. Writing Latch-Free RTL

Learn how to ensure that combinational outputs receive an appropriate assignment for every possible input condition.

Important practices include:

- Assigning default values
- Covering all branches of conditional logic
- Using complete `case` statements
- Clearly separating combinational and sequential logic
- Reviewing synthesis warnings

### 5. Combinational RTL Coding

Understand that a combinational circuit should produce an output based only on its current inputs without unintentionally storing previous values.

Correct RTL coding should ensure:

**Every possible input condition → Defined output**

### 6. Foundation for Reliable RTL Design

These concepts provide the foundation for:

- Synthesizable RTL
- Combinational logic design
- RTL coding standards
- Synthesis analysis
- Timing analysis
- FPGA design
- ASIC design
- RTL verification

---

## 📚 Reference Literature

- Neso Academy – Verilog HDL
- All About Electronics – Digital Electronics and Verilog HDL Tutorials

---

## 👤 Author

**Pruthviraj Kalashetty**

*Electronics & Communication Engineering Student*

**VLSI & RTL Design Learner**
