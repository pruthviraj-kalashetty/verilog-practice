# 02. Adders

[![Stage](https://img.shields.io/badge/Combinational--RTL--Design-blue.svg)](#)
[![Focus](https://img.shields.io/badge/Focus-Verilog%20Adders%20Verilog-orange.svg)](#)
[![Simulation](https://img.shields.io/badge/Simulation-Vivado%20Simulator-red.svg)](#)

This module covers the fundamental binary adder circuits and their Verilog HDL implementations. It includes the Half Adder, Full Adder, and Full Adder constructed using two Half Adders, along with dedicated testbenches, RTL schematics, and simulation waveforms.

The module provides practical experience in translating digital arithmetic concepts into synthesizable RTL and verifying the resulting hardware behavior through simulation.

---

## 🎯 Learning Objectives

By working through this module, you will be able to:

- Understand the fundamental operation of binary adders.
- Analyze Sum and Carry generation in binary addition.
- Design and implement Half Adder and Full Adder circuits.
- Understand the construction of a Full Adder using two Half Adders.
- Write synthesizable Verilog RTL for arithmetic circuits.
- Develop dedicated Verilog testbenches for functional verification.
- Analyze RTL schematics and simulation waveforms.
- Build a foundation for designing multi-bit arithmetic circuits.

---

## 📂 Module Contents

| Module | Core Technical Focus |
| :--- | :--- |
| **[`01-Half-Adder`](./01-Half-Adder/)** | Design and verification of a Half Adder for adding two single-bit binary inputs and generating Sum and Carry outputs. |
| **[`02-Full-Adder`](./02-Full-Adder/)** | Design and verification of a Full Adder that adds two input bits and a Carry-in to generate Sum and Carry-out. |
| **[`03-Full-Adder-Using-Two-Half-Adder`](./03-Full-Adder-Using-Two-Half-Adder/)** | Structural implementation of a Full Adder using two Half Adder modules and an OR operation. |

---

## 🌲 Directory Structure

```text
02-Adders/
├── 01-Half-Adder/
│   ├── README.md
│   ├── half_adder.v
│   ├── half_adder_tb.v
│   ├── rtl-schematic.png
│   └── waveform.png
│
├── 02-Full-Adder/
│   ├── README.md
│   ├── full_adder.v
│   ├── full_adder_tb.v
│   ├── rtl-schematic.png
│   └── waveform.png
│
└── 03-Full-Adder-Using-Half-Adder/
    ├── README.md
    ├── full_adder_using_two_half_adder.v
    ├── full_adder_using_two_half_adder_tb.v
    ├── rtl-schematic.png
    └── waveform.png
```

---

## 🛠️ Core Concepts Covered

### 1. Half Adder

Understand the Half Adder as a combinational circuit that adds two single-bit binary inputs.

It produces two outputs:

- **Sum**
- **Carry**

The Boolean expressions are:

**Sum = A ⊕ B**

**Carry = A · B**

### 2. Full Adder

Understand the Full Adder as a combinational circuit that adds three single-bit inputs:

- Input A
- Input B
- Carry-in

It produces:

- **Sum**
- **Carry-out**

The Full Adder extends the Half Adder by incorporating the carry generated from the previous bit position.

### 3. Full Adder Using Two Half Adders

Understand how a Full Adder can be constructed using two Half Adder modules and an OR gate.

The basic structure is:

**Half Adder 1 → Half Adder 2 → OR → Carry-out**

This provides practical experience with module instantiation and structural RTL design.

### 4. Carry Generation

Understand how carry is generated during binary addition and how it becomes an input to the next higher-order bit.

Carry generation is fundamental to larger arithmetic circuits such as:

- Ripple Carry Adders
- Carry Look-Ahead Adders
- Carry Select Adders
- Arithmetic Logic Units (ALUs)

### 5. Verilog RTL Implementation

Implement the adder circuits using synthesizable Verilog HDL.

Key concepts include:

- Module declaration
- Port declaration
- Boolean operators
- Continuous assignment
- Module instantiation
- Structural RTL design

### 6. Testbench Development

Develop dedicated testbenches to apply input combinations and verify the expected Sum and Carry outputs.

The basic verification flow is:

**Test Stimulus → DUT → Output Observation → Functional Verification**

### 7. Simulation and Waveform Analysis

Analyze simulation waveforms to verify that the RTL implementation produces the expected arithmetic results.

The waveform analysis includes:

- Input transitions
- Sum transitions
- Carry generation
- Carry propagation
- Functional verification

### 8. RTL Schematic Analysis

Analyze the generated RTL schematic to understand how the Verilog description is represented as hardware logic.

This establishes the connection between:

**Verilog Code → RTL Structure → Hardware Logic**

### 9. Foundation for Larger Arithmetic Designs

These adder circuits provide the foundation for designing more complex arithmetic hardware such as:

- Multi-bit Adders
- Ripple Carry Adders
- Carry Look-Ahead Adders
- Carry Select Adders
- Arithmetic Logic Units
- Processor Datapaths

---

## 🧰 Tools & Technologies

| Category | Tool / Technology |
|:---|:---|
| **HDL** | Verilog HDL |
| **RTL Design** | Synthesizable RTL |
| **Code Editor** | Visual Studio Code |
| **Simulation** | AMD Vivado Simulator |
| **Synthesis & RTL Analysis** | AMD Vivado |
| **Waveform Analysis** | Vivado Waveform Viewer |
| **RTL Schematic** | Vivado RTL Schematic |
| **Version Control** | Git |
| **Repository & Collaboration** | GitHub |

---

## 📚 Reference Literature

- Neso Academy – Digital Electronics & Verilog HDL
- All About Electronics – Digital Electronics and Verilog HDL Tutorials

---

## 👤 Author

**Pruthviraj Kalashetty**

*Electronics & Communication Engineering Student*

**VLSI & RTL Design Learner**
