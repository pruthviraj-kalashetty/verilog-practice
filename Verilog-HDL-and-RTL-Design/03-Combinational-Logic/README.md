# ◈ Combinational Logic 

[![Stage](https://img.shields.io/badge/Stage-Combinational_Logic-blue.svg?style=flat-square)](#)
[![Focus](https://img.shields.io/badge/Focus-Verilog_RTL_Modeling-green.svg?style=flat-square)](#)
[![Simulation](https://img.shields.io/badge/Simulator-AMD_Vivado-red.svg?style=flat-square&logo=xilinx)](#)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=flat-square)](#)

This module introduces the design and implementation of combinational logic circuits using Verilog HDL. It explores the three core modeling abstractions—Gate-Level, Dataflow, and Behavioral—along with continuous assignments (`assign`), conditional branching (`if-else`), and multi-way selection (`case`).

Combinational circuits are stateless, meaning their outputs are pure functions of their current inputs. Mastering these modeling techniques forms the foundation for building complex digital systems like ALUs, multiplexers, and decoders.

---

## ⚡ Abstraction Level Quick Reference

| Abstraction Level | Primary Constructs | Syntax Style | Primary Hardware Target |
| :--- | :--- | :--- | :--- |
| **Gate-Level** | Primitive gates (`and`, `or`, `not`, `xor`) | Structural instantiations | Low-level netlists, custom logic blocks |
| **Dataflow** | Continuous `assign`, bitwise operators | Expressive Boolean equations | Simple combinational circuits, buses |
| **Behavioral** | `always @(*)`, `if-else`, `case` | Procedural logic blocks | Complex multiplexers, priority encoders, ALUs |

---

## 🎯 Learning Objectives

By working through this module, you will be able to:

- Understand the principles of combinational logic implementation in Verilog HDL.
- Apply Boolean logic concepts to describe digital circuits.
- Use continuous assignments with the `assign` statement.
- Understand gate-level, dataflow, and behavioral modeling techniques.
- Implement combinational logic using `if-else` and `case` statements.
- Write structured and synthesizable Verilog code for combinational circuits.
- Build a strong foundation for RTL design and hardware modeling.

---

## 📂 Module Contents

| File | Core Technical Focus |
| :--- | :--- |
| **[`01-Introduction-to-Combinational-Logic.md`](./01-Introduction-to-Combinational-Logic.md)** | Fundamentals of combinational logic and its implementation using Verilog HDL. |
| **[`02-Boolean-Logic.md`](./02-Boolean-Logic.md)** | Application of Boolean expressions and logic operations in Verilog-based hardware modeling. |
| **[`03-Continuous-Assignment-(assign).md`](./03-Continuous-Assignment-(assign).md)** | Continuous assignment using the `assign` statement for modeling combinational logic. |
| **[`04-Gate-Level-Modeling.md`](./04-Gate-Level-Modeling.md)** | Structural representation of digital circuits using built-in Verilog gate primitives. |
| **[`05-Dataflow-Modeling.md`](./05-Dataflow-Modeling.md)** | Dataflow modeling using Boolean expressions and continuous assignments. |
| **[`06-Behavioral-Modeling.md`](./06-Behavioral-Modeling.md)** | Behavioral description of combinational hardware using procedural constructs. |
| **[`07-If-Else-Statement.md`](./07-If-Else-Statement.md)** | Implementation of conditional combinational logic using `if`, `else if`, and `else` statements. |
| **[`08-Case-Statement.md`](./08-Case-Statement.md)** | Implementation of multi-way combinational logic using Verilog `case` statements. |

---

## 🌲 Directory Structure

```text
03-Combinational-Logic/
├── README.md
├── 01-Introduction-to-Combinational-Logic.md
├── 02-Boolean-Logic.md
├── 03-Continuous-Assignment-(assign).md
├── 04-Gate-Level-Modeling.md
├── 05-Dataflow-Modeling.md
├── 06-Behavioral-Modeling.md
├── 07-If-Else-Statement.md
└── 08-Case-Statement.md
```

---

## 🛠️ Core Concepts Covered

### 1. Combinational Logic in Verilog

Understand how combinational circuits can be described using Verilog HDL and how outputs depend solely on current input values.

### 2. Boolean Logic

Apply Boolean operations and expressions to represent and implement digital logic functions in Verilog.

### 3. Continuous Assignment

Learn how the `assign` statement continuously drives values onto nets and is commonly used for dataflow modeling of combinational logic.

### 4. Modeling Techniques

Understand the three primary abstraction levels used to describe digital hardware:

- **Gate-Level Modeling** – Describes hardware using Verilog gate primitives.
- **Dataflow Modeling** – Describes the flow of data using Boolean expressions and continuous assignments.
- **Behavioral Modeling** – Describes the intended behavior of hardware using procedural constructs.

### 5. Conditional Logic

Learn how `if-else` statements are used to describe conditional hardware behavior and implement priority-based combinational logic.

### 6. Case Statements

Understand how `case` statements are used to describe multi-way selection logic and implement combinational circuits such as multiplexers and decoders.

---

## 📚 Reference Literature

- Neso Academy – Verilog HDL
- All About Electronics – Verilog HDL Tutorials

---

## 👤 Author

**Pruthviraj Kalashetty**

*Electronics & Communication Engineering Student*

**VLSI & RTL Design Learner**
