# ◈ Subtractors

[![Stage](https://img.shields.io/badge/Combinational--RTL--Design-blue.svg)](#)
[![Focus](https://img.shields.io/badge/Focus-Verilog%20Subtractor%20-orange.svg)](#)
[![Simulation](https://img.shields.io/badge/Simulation-Vivado%20Simulator-red.svg)](#)

This module covers the fundamental binary subtractor circuits and their Verilog HDL implementations. It includes the Half Subtractor, Full Subtractor, and Full Subtractor constructed using two Half Subtractors, along with dedicated testbenches, RTL schematics, and simulation waveforms.

The module provides practical experience in translating binary subtraction concepts into synthesizable RTL and verifying the resulting hardware behavior through simulation.

---

## 🎯 Learning Objectives

By working through this module, you will be able to:

- Understand the fundamental operation of binary subtractor circuits.
- Analyze Difference and Borrow generation in binary subtraction.
- Design and implement Half Subtractor and Full Subtractor circuits.
- Understand the construction of a Full Subtractor using two Half Subtractors.
- Write synthesizable Verilog RTL for arithmetic circuits.
- Develop dedicated Verilog testbenches for functional verification.
- Analyze RTL schematics and simulation waveforms.
- Build a foundation for designing larger arithmetic circuits.

---

## 📂 Module Contents

| Module | Core Technical Focus |
| :--- | :--- |
| **[`01-Half-Subtractor`](./01-Half-Subtractor/)** | Design and verification of a Half Subtractor for subtracting two single-bit binary inputs and generating Difference and Borrow outputs. |
| **[`02-Full-Subtractor`](./02-Full-Subtractor/)** | Design and verification of a Full Subtractor that subtracts two input bits along with a Borrow-in to generate Difference and Borrow-out. |
| **[`03-Full-subtractor-Using-Half-subtractor`](./03-Full-Subtractor-Using-Two-Half-Subtractor/)** | Structural implementation of a Full Subtractor using two Half Subtractor modules and an OR operation. |

---

## 🌲 Directory Structure

    03-Subctractor/
    ├── 01-Half-Subtractor/
    │   ├── README.md
    │   ├── half_subtractor.v
    │   ├── half_subtractor_tb.v
    │   ├── rtl-schematic.png
    │   └── waveform.png
    │
    ├── 02-Full-Subtractor/
    │   ├── README.md
    │   ├── full_subtractor.v
    │   ├── full_subtractor_tb.v
    │   ├── rtl-schematic.png
    │   └── waveform.png
    │
    └── 03-Full-subtractor-Using-Two-Half-subtractor/
        ├── README.md
        ├── full-subtractor-using-two-half-subtractor.v
        ├── full-Subtractor-Using-Two-Half-Subtractor_tb.v
        ├── rtl-schematic.png
        └── waveform.png

---

## 🛠️ Core Concepts Covered

### 1. Half Subtractor

Understand the Half Subtractor as a combinational circuit that subtracts one single-bit binary input from another.

It produces two outputs:

- **Difference**
- **Borrow**

The Boolean expressions are:

**Difference = A ⊕ B**

**Borrow = A̅ · B**

### 2. Full Subtractor

Understand the Full Subtractor as a combinational circuit that performs binary subtraction using three single-bit inputs:

- Minuend (A)
- Subtrahend (B)
- Borrow-in

It produces:

- **Difference**
- **Borrow-out**

The Borrow-in allows the circuit to account for a borrow generated from the previous lower-order bit.

### 3. Full Subtractor Using Two Half Subtractors

Understand how a Full Subtractor can be constructed using two Half Subtractor modules and an OR gate.

The basic structural relationship is:

**Half Subtractor 1 → Half Subtractor 2 → OR → Borrow-out**

This provides practical experience with module instantiation and structural RTL design.

### 4. Borrow Generation

Understand how borrow is generated when the minuend bit is smaller than the required subtraction value.

Borrow generation is fundamental to larger subtraction circuits and arithmetic datapaths.

### 5. Verilog RTL Implementation

Implement subtractor circuits using synthesizable Verilog HDL.

Key concepts include:

- Module declaration
- Port declaration
- Boolean operators
- Continuous assignment
- Module instantiation
- Structural RTL design

### 6. Testbench Development

Develop dedicated testbenches to apply input combinations and verify the expected Difference and Borrow outputs.

The basic verification flow is:

**Test Stimulus → DUT → Output Observation → Functional Verification**

### 7. Simulation and Waveform Analysis

Analyze simulation waveforms to verify that the RTL implementation produces the expected subtraction results.

The waveform analysis includes:

- Input transitions
- Difference transitions
- Borrow generation
- Borrow propagation
- Functional verification

### 8. RTL Schematic Analysis

Analyze the generated RTL schematic to understand how the Verilog description is represented as hardware logic.

This establishes the connection between:

**Verilog Code → RTL Structure → Hardware Logic**

### 9. Foundation for Larger Arithmetic Designs

These subtractor circuits provide the foundation for designing more complex arithmetic hardware such as:

- Multi-bit Subtractors
- Adders/Subtractors
- Arithmetic Logic Units
- Arithmetic Datapaths
- Processor Datapaths

---

## 🧰 Tools & Technologies

| Category | Tool / Technology |
|:---|:---|
| HDL | Verilog |
| RTL Style | Synthesizable RTL |
| Editor | Visual Studio Code |
| Simulation | Vivado Simulator |
| RTL Analysis | Vivado |
| Waveform Analysis | Vivado Waveform Viewer |
| Version Control | Git |
| Repository | GitHub |

---

## 📚 Reference Literature

- Neso Academy – Digital Electronics & Verilog HDL
- All About Electronics – Digital Electronics and Verilog HDL Tutorials

---

## 👤 Author

**Pruthviraj Kalashetty**

*Electronics & Communication Engineering Student*

**VLSI & RTL Design Learner**
