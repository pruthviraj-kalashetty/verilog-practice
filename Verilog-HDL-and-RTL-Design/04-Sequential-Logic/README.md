# 04. Sequential Logic

[![Stage](https://img.shields.io/badge/verilog--practice-blue.svg)](#)
[![Focus](https://img.shields.io/badge/Focus-Sequential%20Logic-orange.svg)](#)

This module introduces the fundamental concepts of sequential logic, where the behavior of a digital circuit depends on both its present inputs and stored state. It covers clock concepts, edge triggering, synchronous and asynchronous resets, and the fundamentals of memory elements.

These concepts provide the foundation for understanding flip-flops, registers, counters, finite state machines, and sequential RTL design.

---

## 🎯 Learning Objectives

By working through this module, you will be able to:

- Understand the fundamental principles of sequential logic.
- Explain the role of clock signals in synchronous digital systems.
- Understand positive-edge and negative-edge triggering.
- Differentiate between synchronous and asynchronous reset mechanisms.
- Understand the basic concept of memory and state storage.
- Build a strong foundation for sequential circuit and RTL design.

---

## 📂 Module Contents

| File | Core Technical Focus |
| :--- | :--- |
| **[`01-Clock-Concept.md`](./01-Clock-Concept.md)** | Clock signals, frequency, time period, duty cycle, and their role in sequential digital systems. |
| **[`02-Edge-Triggering.md`](./02-Edge-Triggering.md)** | Positive-edge and negative-edge triggering and circuit response to clock transitions. |
| **[`03-Synchronous-Reset.md`](./03-Synchronous-Reset.md)** | Synchronous reset operation and its relationship with the active clock edge. |
| **[`04-Asynchronous-Reset.md`](./04-Asynchronous-Reset.md)** | Asynchronous reset operation independent of the active clock edge. |
| **[`05-Memory-Basics.md`](./05-Memory-Basics.md)** | Fundamentals of memory, state storage, and the role of memory elements in digital circuits. |

---

## 🌲 Directory Structure

```text
04-Sequential-Logic/
├── README.md
├── 01-Clock-Concept.md
├── 02-Edge-Triggering.md
├── 03-Synchronous-Reset.md
├── 04-Asynchronous-Reset.md
└── 05-Memory-Basics.md
```

---

## 🛠️ Core Concepts Covered

### 1. Sequential Logic Fundamentals

Sequential logic circuits use memory elements to retain information about previous conditions. Therefore, their outputs depend on both the present inputs and the stored state.

### 2. Clock Concepts

Understand the clock signal used to synchronize state changes in digital systems, including:

- Clock period
- Clock frequency
- Duty cycle
- Rising and falling transitions

### 3. Edge Triggering

Learn how sequential circuits respond to transitions of a clock signal.

- **Positive Edge:** `0 → 1`
- **Negative Edge:** `1 → 0`

### 4. Reset Mechanisms

Understand how reset signals initialize sequential circuits to a known state.

- **Synchronous Reset:** Reset is recognized with the active clock edge.
- **Asynchronous Reset:** Reset can affect the circuit independently of the clock.

### 5. Memory Basics

Understand the fundamental concept of storing binary information and maintaining circuit state using memory elements.

### 6. Foundation for Sequential Design

These concepts provide the required foundation for studying:

- Flip-Flops
- Registers
- Counters
- Finite State Machines
- Sequential RTL Design

---

## 📚 Reference Literature

- Neso Academy – Digital Electronics
- All About Electronics – Digital Electronics Tutorials

---

## 👤 Author

**Pruthviraj Kalashetty**

*Electronics & Communication Engineering Student*

**VLSI & RTL Design Learner**
