# ◈ Sequential RTL: Latches & Level-Sensitive Storage

[![Stage](https://img.shields.io/badge/Stage-Sequential_RTL_Design-blue.svg?style=flat-square)](#)
[![Focus](https://img.shields.io/badge/Focus-Verilog_Latches_&_Storage-orange.svg?style=flat-square)](#)
[![Simulation](https://img.shields.io/badge/Simulator-AMD_Vivado-red.svg?style=flat-square&logo=xilinx)](#)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=flat-square)](#)

This module covers the design, analysis, and functional verification of level-sensitive sequential storage elements using synthesizable Verilog HDL. It details SR and D latch architectures, complete with synthesizable RTL implementations, dedicated testbenches, post-synthesis RTL schematics, and simulation waveforms.

---

## ⚡ Latches Quick Reference

| Storage Element | Inputs | Enable / Control | Behavior / Storage Mechanics |
| :--- | :--- | :--- | :--- |
| **SR Latch** | $S, R$ | Active High / Low | Sets output ($Q=1$) on $S$, Resets ($Q=0$) on $R$. $S=R=1$ is invalid/prohibited. |
| **Gated D Latch** | $D$ | $E / EN$ (Enable) | Transparent when $E=1$ ($Q=D$); Holds previous state when $E=0$. |

---

## 🎯 Learning Objectives

By working through this module, you will be able to:

- Understand the fundamental operation of latches.
- Understand how latches store and retain binary information.
- Understand level-sensitive sequential behavior.
- Design and implement SR and D latches.
- Analyze SR latch set, reset, hold, and invalid conditions.
- Understand the operation and purpose of a D latch.
- Write synthesizable Verilog RTL for latch circuits.
- Develop dedicated Verilog testbenches for functional verification.
- Analyze RTL schematics and simulation waveforms.
- Build a strong foundation for flip-flops, registers, counters, FSMs, and RTL design IPs.

---

## 📂 Module Contents

| Module | Core Technical Focus |
| :--- | :--- |
| **[01-SR-Latch](.01-SR-Latch/)** | Design and verification of an SR latch using synthesizable Verilog RTL, including set, reset, hold, and invalid conditions. |
| **[02-D-Latch](./01-Latches/02-D-Latch/)** | Design and verification of a D latch using synthesizable Verilog RTL for controlled single-bit data storage. |

---

## 🌲 Directory Structure
```text
11-Sequential-RTL/
├── 01-Latches/
│   ├── 01-SR-Latch/
│   │   ├── sr_latch.v
│   │   ├── sr_latch_tb.v
│   │   ├── rtl-schematic.png
│   │   └── waveform.png
│   │
│   └── 02-D-Latch/
│       ├── d_latch.v
│       ├── d_latch_tb.v
│       ├── rtl-schematic.png
│       └── waveform.png
```

---

## 🛠️ Core Concepts Covered

### 1. Latch Fundamentals

Understand a latch as a level-sensitive sequential storage element capable of storing and retaining one bit of binary information.

A latch can either allow the input to affect the output or retain the previously stored value depending on its control condition.

### 2. SR Latch

Study the operation of an SR (Set-Reset) latch using two control inputs:

- **S — Set**
- **R — Reset**

The SR latch provides the following fundamental operations:

- **Set:** S = 1, R = 0
- **Reset:** S = 0, R = 1
- **Hold:** S = 0, R = 0
- **Invalid Condition:** S = 1, R = 1

Understand how the SR latch stores one bit of information and maintains its previous state during the hold condition.

### 3. D Latch

Study the operation of a D (Data) latch using a single data input and an enable/control signal.

The D latch provides controlled storage of one bit of data and eliminates the invalid input combination associated with the basic SR latch.

Understand:

- Data transfer when enabled
- Data retention when disabled
- Output state storage
- Controlled sequential behavior

### 4. Level-Sensitive Behavior

Understand how latches respond to the active level of their control or enable signal.

When enabled, the latch can respond to changes at its input. When disabled, the previously stored value is retained.

### 5. Verilog RTL Implementation

Implement latch circuits using synthesizable Verilog HDL.

Key concepts include:

- Module declaration
- Port declaration
- `reg` data type
- `always @(*)`
- Conditional statements
- Blocking assignments
- Latch inference
- Synthesizable RTL coding

### 6. Testbench Development

Develop dedicated Verilog testbenches to apply different input and control combinations and verify the expected latch behavior.

The basic verification flow is:

**Test Stimulus → DUT → Output Observation → Functional Verification**

### 7. Simulation and Waveform Analysis

Analyze simulation waveforms to verify that the latches correctly perform set, reset, hold, and data-storage operations.

The waveform analysis includes:

- Input transitions
- Control/enable transitions
- Output transitions
- State retention
- Functional verification

### 8. RTL Schematic Analysis

Analyze the generated RTL schematic to understand how the Verilog description is represented as hardware logic.

This establishes the connection between:

**Verilog Code → RTL Structure → Hardware Logic**

### 9. Latch Inference

Understand how incomplete assignments in synthesizable Verilog can cause synthesis tools to infer latch hardware.

This is an important RTL coding concept because unintended latch inference can lead to unexpected hardware and timing behavior.

### 10. Sequential RTL Design Flow

Develop a disciplined RTL design and verification workflow:

**Specification → RTL Coding → Testbench → Simulation → Waveform Analysis → RTL Schematic → Functional Verification**

### 11. Foundation for Advanced RTL Design

These concepts provide the required foundation for studying:

- Flip-Flops
- Registers
- Counters
- Finite-State Machines
- Sequential RTL Design
- RTL Design IPs
- ASIC Front-End Design
- Advanced Verilog RTL Coding

---

## 🧰 Tools & Technologies

| Category          | Tool / Technology      |
| :---------------- | :--------------------- |
| HDL               | Verilog                |
| RTL Style         | Synthesizable RTL      |
| Editor            | Visual Studio Code     |
| Simulation        | Vivado Simulator       |
| RTL Analysis      | Vivado                 |
| Waveform Analysis | Vivado Waveform Viewer |
| Version Control   | Git                    |
| Repository        | GitHub                 |

---

## 📚 Reference Literature

- Neso Academy – Digital Electronics & Verilog HDL
- All About Electronics – Digital Electronics and Verilog HDL Tutorials

---

## 👤 Author

**Pruthviraj Kalashetty**

*Electronics & Communication Engineering Student*

**VLSI & RTL Design Learner**
