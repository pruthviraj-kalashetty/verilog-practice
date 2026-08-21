# ◈ Comparators

# 08. Digital Comparators & Magnitude Evaluation Circuits

[![Stage](https://img.shields.io/badge/Stage-Combinational_RTL_Design-blue.svg?style=flat-square)](#)
[![Focus](https://img.shields.io/badge/Focus-Verilog_Comparator_Circuits-orange.svg?style=flat-square)](#)
[![Simulation](https://img.shields.io/badge/Simulator-AMD_Vivado-red.svg?style=flat-square&logo=xilinx)](#)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=flat-square)](#)

This module covers the design, logic synthesis, and functional verification of digital magnitude comparator circuits using synthesizable Verilog HDL. It details 1-bit, 2-bit, and 4-bit binary comparator architectures, complete with synthesizable RTL designs, self-checking testbenches, RTL schematics, and simulation waveforms.

---

## ⚡ Digital Comparators Quick Reference

| Circuit Type | Inputs ($A, B$) | Output Flags | Core Boolean Logic / Operator |
| :--- | :---: | :---: | :--- |
| **1-Bit Comparator** | $A[0], B[0]$ | $A > B, \, A = B, \, A < B$ | $A>B = A \cdot \overline{B}, \quad A=B = A \odot B, \quad A<B = \overline{A} \cdot B$ |
| **2-Bit Comparator** | $A[1:0], B[1:0]$ | $A > B, \, A = B, \, A < B$ | Hierarchical bitwise comparison starting from MSB. |
| **4-Bit Comparator** | $A[3:0], B[3:0]$ | $A > B, \, A = B, \, A < B$ | Behavioral relational operators (`>`, `==`, `<`) or cascaded logic. |

---

## 🎯 Learning Objectives

By working through this module, you will be able to:

- Understand the fundamental operation of digital comparators.
- Compare two binary numbers and determine their relative magnitude.
- Design and implement 1-bit, 2-bit, and 4-bit comparators.
- Analyze comparator truth tables and Boolean expressions.
- Understand the generation of Greater Than, Equal To, and Less Than outputs.
- Write synthesizable Verilog RTL for comparator circuits.
- Develop dedicated Verilog testbenches for functional verification.
- Analyze RTL schematics and simulation waveforms.

---

## 📂 Module Contents

| Module | Core Technical Focus |
| :--- | :--- |
| **[`1-Bit-Comparator`](./1-Bit-Comparator/)** | Design and verification of a 1-bit comparator that determines whether one single-bit input is greater than, equal to, or less than another. |
| **[`2-Bit-Comparator`](./2-Bit-Comparator/)** | Design and verification of a 2-bit comparator for comparing two 2-bit binary numbers. |
| **[`4-Bit-Comparator`](./4-Bit-Comparator/)** | Design and verification of a 4-bit comparator for comparing two 4-bit binary numbers and determining their relative magnitude. |

---

## 🌲 Directory Structure

    08-Comparators/
    ├── 1-Bit-Comparator/
    │   ├── 1_bit_Comparator.v
    │   ├── 1_bit_Comparator_tb.v
    │   ├── rtl-schematic.png
    │   └── waveform.png
    │
    ├── 2-Bit-Comparator/
    │   ├── 2_bit_Comparator.v
    │   ├── 2_bit_Comparator_tb.v
    │   ├── rtl-schematic.png
    │   └── waveform.png
    │
    └── 4-Bit-Comparator/
        ├── 4_bit_Comparator.v
        ├── 4_bit_Comparator_tb.v
        ├── rtl-schematic.png
        └── waveform.png

---

## 🛠️ Core Concepts Covered

### 1. Comparator Fundamentals

Understand a comparator as a combinational circuit that compares two binary numbers and determines their relative magnitude.

A digital comparator generally produces three outputs:

- **A > B**
- **A = B**
- **A < B**

Only one of these conditions is active for a valid comparison.

### 2. 1-Bit Comparator

Study the operation of a 1-bit comparator using two single-bit inputs:

- Input A
- Input B

The circuit determines whether:

**A > B**

**A = B**

**A < B**

The basic Boolean expressions are:

**A > B = A · B̅**

**A = B = A̅B̅ + AB**

**A < B = A̅ · B**

### 3. 2-Bit Comparator

Study the operation of a 2-bit comparator for comparing two 2-bit binary numbers.

The comparison begins with the most significant bit (MSB). If the MSBs are equal, the lower-order bits are compared.

This introduces the concept of hierarchical magnitude comparison.

### 4. 4-Bit Comparator

Study the operation of a 4-bit comparator for comparing two 4-bit binary numbers.

The comparison is performed from the most significant bit toward the least significant bit until a difference is found.

This provides a foundation for understanding larger multi-bit magnitude comparators.

### 5. Magnitude Comparison

Understand the three fundamental comparison conditions:

- **Greater Than:** A > B
- **Equal To:** A = B
- **Less Than:** A < B

For every valid binary comparison, exactly one condition is true.

### 6. Verilog RTL Implementation

Implement comparator circuits using synthesizable Verilog HDL.

Key concepts include:

- Module declaration
- Port declaration
- Continuous assignment
- Boolean operators
- Relational operators
- Conditional statements
- Synthesizable RTL coding

### 7. Testbench Development

Develop dedicated testbenches to apply different binary input combinations and verify the expected comparison outputs.

The basic verification flow is:

**Test Stimulus → DUT → Output Observation → Functional Verification**

### 8. Simulation and Waveform Analysis

Analyze simulation waveforms to verify that the comparator correctly identifies the relationship between the two input values.

The waveform analysis includes:

- Input transitions
- Greater-than output
- Equal-to output
- Less-than output
- Functional verification

### 9. RTL Schematic Analysis

Analyze the generated RTL schematic to understand how the Verilog description is represented as hardware logic.

This establishes the connection between:

**Verilog Code → RTL Structure → Hardware Logic**

### 10. Applications of Comparators

Understand the use of comparators in digital systems such as:

- ALUs
- Processor datapaths
- Address comparison
- Control logic
- Sorting circuits
- Decision-making circuits
- Memory systems
- FPGA and ASIC designs

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
