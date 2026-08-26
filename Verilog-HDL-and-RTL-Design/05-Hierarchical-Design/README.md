# 05. Hierarchical Digital Design & Module Instantiation

[![Stage](https://img.shields.io/badge/Stage-Hierarchical_Design-blue.svg?style=flat-square)](#)
[![Focus](https://img.shields.io/badge/Focus-Module_Instantiation-orange.svg?style=flat-square)](#)
[![Simulation](https://img.shields.io/badge/Simulator-AMD_Vivado-red.svg?style=flat-square&logo=xilinx)](#)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=flat-square)](#)

This module introduces hierarchical methodology in Verilog HDL, where complex top-level digital systems are partitioned into smaller, modular, and reusable sub-blocks. It covers module instantiation strategies, explicit named port mapping versus ordered positional mapping, and structural versus behavioral modeling styles.

Hierarchical design is fundamental to professional RTL engineering—enabling team-based parallel development, improving code readability, simplifying debugging, and facilitating scalable IP reuse across modern VLSI projects.

---

## ⚡ Hierarchical Modeling Quick Reference

| Design Methodology | Core Construct / Technique | Primary Focus | Best Used For |
| :--- | :--- | :--- | :--- |
| **Structural Design** | Sub-module instantiations, net interconnections | Interconnections ("How components wire together") | Top-level system assembly, structural netlists |
| **Behavioral Design** | Procedural blocks (`always`, `initial`), continuous `assign` | Functionality ("What hardware performs") | Sub-block internal logic, state machines, ALUs |
| **Port Mapping (Named)** | `.port_name(signal_name)` | Explicit, robust mapping | Recommended standard for all synthesizable RTL |
| **Port Mapping (Positional)** | `sub_module u1 (sigA, sigB, sigC)` | Order-dependent implicit mapping | Quick testbench wiring (error-prone in RTL) |

---

## 🎯 Learning Objectives

By working through this module, you will be able to:

- Understand the concept of hierarchical design in Verilog.
- Understand how one Verilog module can be instantiated inside another module.
- Analyze the relationship between parent and child modules.
- Differentiate between structural and behavioral design approaches.
- Develop modular and reusable RTL designs.
- Build a foundation for designing larger and more complex digital systems.

---

## 📂 Module Contents

| File | Core Technical Focus |
| :--- | :--- |
| **[`01-Module-Instantiation.md`](./01-Module-Instantiation.md)** | Instantiating Verilog modules, connecting ports, and building larger designs from reusable modules. |
| **[`02-Structural-vs-Behavioral.md`](./02-Structural-vs-Behavioral.md)** | Comparison of structural and behavioral modeling approaches and their use in RTL design. |

---

## 🌲 Directory Structure

```text
05-Hierarchical-Design/
├── README.md
├── 01-Module-Instantiation.md
└── 02-Structural-vs-Behavioral.md
```

---

## 🛠️ Core Concepts Covered

### 1. Hierarchical Design Fundamentals

Understand hierarchical design as a methodology for dividing a complex hardware system into smaller, manageable, and reusable modules.

### 2. Module Instantiation

Learn how a module can be instantiated within another module to create a larger hardware structure.

Key concepts include:

- Parent module
- Child module
- Module instance
- Port connections
- Signal connections
- Module reuse

### 3. Structural Design

Understand structural modeling as a method of describing hardware by explicitly connecting modules, gates, and other components.

Structural design focuses on **how hardware components are interconnected**.

### 4. Behavioral Design

Understand behavioral modeling as a method of describing the intended behavior or operation of a hardware block without explicitly defining every internal connection.

Behavioral design focuses on **what the hardware does**.

### 5. Structural vs Behavioral Modeling

Understand the key difference between the two approaches:

- **Structural Modeling:** Describes hardware components and their interconnections.
- **Behavioral Modeling:** Describes the functional behavior of the hardware.

### 6. Modular RTL Design

Hierarchical design provides the foundation for developing scalable RTL systems by allowing complex designs to be divided into smaller functional blocks.

This approach improves:

- Code reusability
- Design readability
- Debugging
- Verification
- Maintainability
- Design scalability

---

## 📚 Reference Literature

- Neso Academy – Verilog HDL
- All About Electronics – Verilog HDL and Digital Electronics Tutorials

---

## 👤 Author

**Pruthviraj Kalashetty**

*Electronics & Communication Engineering Student*

**VLSI & RTL Design Learner**
