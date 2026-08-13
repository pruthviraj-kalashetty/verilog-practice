# 01. Logic Gates

[![Stage](https://img.shields.io/badge/Combinational--RTL--Design-blue.svg)](#)
[![Focus](https://img.shields.io/badge/Focus-Verilog%20Logic%20Gates-orange.svg)](#)

This module contains Verilog HDL implementations of fundamental digital logic gates. Each gate is designed using synthesizable RTL and verified using a dedicated Verilog testbench.

The simulations are analyzed using RTL schematics and waveform results, providing practical experience with the complete RTL design flow from **Verilog coding → testbench → simulation → waveform → RTL schematic**.

---

## 🎯 Learning Objectives

By working through this module, you will be able to:

- Understand the Verilog implementation of fundamental logic gates.
- Write simple synthesizable Verilog modules.
- Create dedicated testbenches for RTL designs.
- Simulate Verilog designs and verify their logical behavior.
- Analyze simulation waveforms and RTL schematics.
- Understand the relationship between Boolean logic and Verilog operators.
- Build practical experience with the basic RTL design and verification flow.

---

## 📂 Module Contents

| Module | Core Technical Focus |
| :--- | :--- |
| **[`01-AND-Gate`](./01-AND-Gate/)** | Verilog implementation and verification of an AND gate with RTL schematic and simulation waveform. |
| **[`02-OR-Gate`](./02-OR-Gate/)** | Verilog implementation and verification of an OR gate with RTL schematic and simulation waveform. |
| **[`03-NOT-Gate`](./03-NOT-Gate/)** | Verilog implementation and verification of a NOT gate with RTL schematic and simulation waveform. |
| **[`04-NAND-Gate`](./04-NAND-Gate/)** | Verilog implementation and verification of a NAND gate with RTL schematic and simulation waveform. |
| **[`05-NOR-Gate`](./05-NOR-Gate/)** | Verilog implementation and verification of a NOR gate with RTL schematic and simulation waveform. |
| **[`06-XOR-Gate`](./06-XOR-Gate/)** | Verilog implementation and verification of an XOR gate with RTL schematic and simulation waveform. |
| **[`07-XNOR-Gate`](./07-XNOR-Gate/)** | Verilog implementation and verification of an XNOR gate with RTL schematic and simulation waveform. |

---

## 🌲 Directory Structure

```text
01-Logic-Gates/
├── README.md
│
├── 01-AND-Gate/
│   ├── and_gate.v
│   ├── and_gate_tb.v
│   ├── rtl-schematic.png
│   └── waveform.png
│
├── 02-OR-Gate/
│   ├── or_gate.v
│   ├── or_gate_tb.v
│   ├── rtl-schematic.png
│   └── waveform.png
│
├── 03-NOT-Gate/
│   ├── README.md
│   ├── not_gate.v
│   ├── not_gate_tb.v
│   ├── rtl-schematic.png
│   └── waveform.png
│
├── 04-NAND-Gate/
│   ├── README.md
│   ├── nand_gate.v
│   ├── nand_gate_tb.v
│   ├── rtl-schematic.png
│   └── waveform.png
│
├── 05-NOR-Gate/
│   ├── README.md
│   ├── nor_gate.v
│   ├── nor_gate_tb.v
│   ├── rtl-schematic.png
│   └── waveform.png
│
├── 06-XOR-Gate/
│   ├── README.md
│   ├── xor_gate.v
│   ├── xor_gate_tb.v
│   ├── rtl-schematic.png
│   └── waveform.png
│
└── 07-XNOR-Gate/
    ├── README.md
    ├── xnor_gate.v
    ├── xnor_gate_tb.v
    ├── rtl-schematic.png
    └── waveform.png
```

---

## 🛠️ Core Concepts Covered

### 1. Fundamental Logic Gates

Implement and verify the basic Boolean logic gates used as building blocks for digital circuits:

- AND
- OR
- NOT
- NAND
- NOR
- XOR
- XNOR

### 2. Verilog RTL Implementation

Learn how Boolean expressions are translated into synthesizable Verilog HDL.

Key concepts include:

- Module declaration
- Input and output ports
- Logic operators
- Continuous assignment
- Synthesizable RTL
- Hardware representation

### 3. Testbench Development

Each logic gate is accompanied by a testbench used to apply input combinations and verify the expected output.

The testbenches provide practical experience with:

- Test stimulus
- Input combinations
- Output observation
- Simulation execution
- Functional verification

### 4. Simulation and Waveform Analysis

Verify the behavior of each design by observing simulation results.

The waveform helps confirm that:

**Input combinations → Expected Boolean output**

This develops the fundamental skill of comparing RTL behavior against the expected truth table.

### 5. RTL Schematic Analysis

Analyze the generated RTL schematic to understand how the Verilog description is interpreted as hardware logic.

This creates a direct connection between:

**Verilog Code → RTL Structure → Hardware Logic**

### 6. Complete RTL Design Flow

This module provides hands-on practice with a basic RTL development workflow:

**RTL Coding → Testbench → Simulation → Waveform Verification → RTL Schematic**

### 7. Foundation for RTL Design

These concepts provide the foundation for designing more complex digital systems such as:

- Adders
- Subtractors
- Multiplexers
- Decoders
- Encoders
- Comparators
- ALUs
- Registers
- Counters
- Finite State Machines

---

## 📚 Reference Literature

- Neso Academy – Verilog HDL
- All About Electronics – Digital Electronics and Verilog HDL Tutorials

---

## 👤 Author

**Pruthviraj Kalashetty**

*Electronics & Communication Engineering Student*

**VLSI & RTL Design Learner**
