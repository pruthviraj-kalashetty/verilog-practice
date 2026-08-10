# ◈ Procedural Blocks

[![Stage](https://img.shields.io/badge/verilog--practice-blue.svg)](#)
[![Focus](https://img.shields.io/badge/Focus-Procedural%20Blocks-green.svg)](#)

This module introduces procedural blocks in Verilog HDL, which are used to describe the behavior and operation of digital hardware. It covers `always` and `initial` blocks, sensitivity lists, blocking and non-blocking assignments, and the differences between these assignment types in behavioral and RTL modeling.

Understanding procedural blocks is essential for writing structured Verilog code and developing reliable combinational and sequential RTL designs.

---

## 🎯 Learning Objectives

By working through this module, you will be able to:

- Understand the purpose and structure of procedural blocks in Verilog HDL.
- Differentiate between `always` and `initial` blocks.
- Understand sensitivity lists and event-controlled procedural execution.
- Apply blocking and non-blocking assignments appropriately.
- Differentiate between blocking and non-blocking assignment behavior.
- Build a strong foundation for combinational and sequential RTL coding.

---

## 📂 Module Contents

| File | Core Technical Focus |
| :--- | :--- |
| **[`Introduction-to-Procedural-Blocks.md`](./Introduction-to-Procedural-Blocks.md)** | Introduction to procedural modeling and the role of procedural blocks in Verilog HDL. |
| **[`Always-Block.md`](./Always-Block.md)** | Structure, execution behavior, and applications of the `always` block in RTL design. |
| **[`Initial-Block.md`](./Initial-Block.md)** | Structure and execution behavior of the `initial` block and its use in simulation and testbench environments. |
| **[`Sensitivity-List.md`](./Sensitivity-List.md)** | Sensitivity lists, event controls, and their role in triggering procedural blocks. |
| **[`Blocking-Assignment.md`](./Blocking-Assignment.md)** | Blocking assignment (`=`), sequential statement execution, and its use in procedural modeling. |
| **[`Non-Blocking-Assignment.md`](./Non-Blocking-Assignment.md)** | Non-blocking assignment (`<=`), scheduled updates, and its use in sequential RTL design. |
| **[`Blocking-VS-Non-Blocking.md`](./Blocking-VS-Non-Blocking.md)** | Comparison of blocking and non-blocking assignments, execution behavior, and appropriate RTL coding practices. |

---

## 🌲 Directory Structure

```text
02-Procedural-Blocks/
├── README.md
├── Introduction-to-Procedural-Blocks.md
├── always-Block.md
├── initial-Block.md
├── Sensitivity-List.md
├── Blocking-Assignment.md
├── Non-Blocking-Assignment.md
└── Blocking-vs-NonBlocking.md
```

---

## 🛠️ Core Concepts Covered

### 1. Procedural Modeling

Understand how procedural statements describe the behavior of digital hardware and how they differ from continuous assignments.

### 2. `always` and `initial` Blocks

Learn the purpose and execution behavior of the `always` and `initial` procedural blocks and their applications in RTL design and simulation.

### 3. Sensitivity Lists

Understand how sensitivity lists and event controls determine when an `always` block is triggered in response to signal changes or clock events.

### 4. Blocking Assignments

Study blocking assignments (`=`), where statements execute sequentially within a procedural block, and understand their typical use in combinational logic modeling.

### 5. Non-Blocking Assignments

Study non-blocking assignments (`<=`), where updates are scheduled for the end of the current simulation time step, and understand their importance in sequential RTL modeling.

### 6. Blocking vs Non-Blocking Assignments

Compare the execution behavior and appropriate usage of blocking and non-blocking assignments to develop reliable and synthesizable RTL code.

---

## 📚 Reference Literature

- Neso Academy – Verilog HDL
- All About Electronics – Verilog HDL Tutorials

---

## 👤 Author

**Pruthviraj Kalashetty**

*Electronics & Communication Engineering Student*

**VLSI & RTL Design Learner**
