# 05. Hierarchical Design

[![Stage](https://img.shields.io/badge/Stage-B--Verilog--Practice-blue.svg)](#)
[![Focus](https://img.shields.io/badge/Focus-Hierarchical%20Design-orange.svg)](#)

This module introduces hierarchical design in Verilog, where complex digital systems are developed by connecting smaller, reusable modules together. It covers module instantiation and the differences between structural and behavioral design approaches.

Hierarchical design is an important concept in RTL development because it promotes modularity, reusability, readability, and scalable hardware design.

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
