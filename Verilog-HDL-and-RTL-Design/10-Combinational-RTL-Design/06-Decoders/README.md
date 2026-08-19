# ◈ Decoders RTL Suite

[![Stage](https://img.shields.io/badge/Stage-Combinational_RTL_Design-blue.svg?style=flat-square)](#)
[![Focus](https://img.shields.io/badge/Focus-Verilog_Decoder_Circuits-orange.svg?style=flat-square)](#)
[![Simulation](https://img.shields.io/badge/Simulator-AMD_Vivado-red.svg?style=flat-square&logo=xilinx)](#)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=flat-square)](#)

This directory contains synthesizable Verilog HDL implementations, behavioral decoding logic, and dedicated verification testbenches for fundamental binary decoders ($2 \times 4$, $3 \times 8$, and $4 \times 16$). It provides hands-on experience with binary decoding mechanisms, minterm generation, synthesizable Verilog construct selection (`case` statements, bit-shift operators, continuous assignments), and functional RTL verification.

---

## ⚡ Decoders Quick Reference

| Circuit | Inputs ($N$) | Outputs ($2^N$) | Minterm Range | Hardware / Verilog Logic |
| :--- | :---: | :---: | :---: | :--- |
| **2×4 Decoder** | $A[1:0]$ | $Y[3:0]$ | $m_0 \dots m_3$ | $Y[k] = 1 \iff A = k$<br>`assign Y = 1'b1 << A;` |
| **3×8 Decoder** | $A[2:0]$ | $Y[7:0]$ | $m_0 \dots m_7$ | $Y[k] = 1 \iff A = k$<br>Behavioral `case` or shift operator realization. |
| **4×16 Decoder** | $A[3:0]$ | $Y[15:0]$ | $m_0 \dots m_{15}$ | $Y[k] = 1 \iff A = k$<br>Full binary-to-one-hot mapping matrix. |

---

## 🎯 Learning Objectives

By working through this module, you will be able to:

- Understand the fundamental operation of binary decoders.
- Understand the relationship between input combinations and output lines.
- Design and implement 2×4, 3×8, and 4×16 decoders.
- Analyze decoder truth tables and Boolean expressions.
- Write synthesizable Verilog RTL for decoder circuits.
- Develop dedicated Verilog testbenches for functional verification.
- Analyze RTL schematics and simulation waveforms.
- Understand the role of decoders in larger digital systems.

---

## 📂 Module Contents

| Module | Core Technical Focus |
| :--- | :--- |
| **[`01-Decoder-2x4`](./01-Decoder-2x4/)** | Design and verification of a 2×4 decoder that activates one of four output lines based on a two-bit binary input. |
| **[`02-Decoder-3x8`](./02-Decoder-3x8/)** | Design and verification of a 3×8 decoder that activates one of eight output lines based on a three-bit binary input. |
| **[`03-Decoder-4x16`](./03-Decoder-4x16/)** | Design and verification of a 4×16 decoder that activates one of sixteen output lines based on a four-bit binary input. |

---

## 🌲 Directory Structure

    06-Decoders/
    ├── 01-Decoder-2x4/
    │   ├── decoder_2x4.v
    │   ├── decoder_2x4_tb.v
    │   ├── rtl-schematic.png
    │   └── waveform.png
    │
    ├── 02-Decoder-3x8/
    │   ├── decoder_3x8.v
    │   ├── decoder_3x8_tb.v
    │   ├── rtl-schematic.png
    │   └── waveform.png
    │
    └── 03-Decoder-4x16/
        ├── decoder_4x16.v
        ├── decoder_4x16_tb.v
        ├── rtl-schematic.png
        └── waveform.png

---

## 🛠️ Core Concepts Covered

### 1. Decoder Fundamentals

Understand a decoder as a combinational circuit that converts an n-bit binary input into one of 2ⁿ possible output lines.

The basic relationship is:

**n Input Lines → Decoder → 2ⁿ Output Lines**

For each valid input combination, one corresponding output line is activated.

### 2. 2×4 Decoder

Study the operation of a 2×4 decoder with:

- 2 Input Lines
- 4 Output Lines

The two input bits provide four possible binary combinations, allowing one of the four outputs to be activated.

### 3. 3×8 Decoder

Study the operation of a 3×8 decoder with:

- 3 Input Lines
- 8 Output Lines

The three input bits provide eight possible binary combinations, allowing one of the eight outputs to be activated.

### 4. 4×16 Decoder

Study the operation of a 4×16 decoder with:

- 4 Input Lines
- 16 Output Lines

The four input bits provide sixteen possible binary combinations, allowing one of the sixteen outputs to be activated.

### 5. Binary Decoding

Understand how binary input combinations are mapped to individual output lines.

Examples:

- 2 inputs → 4 possible outputs
- 3 inputs → 8 possible outputs
- 4 inputs → 16 possible outputs

This concept forms the foundation of address decoding and selection logic.

### 6. Verilog RTL Implementation

Implement decoder circuits using synthesizable Verilog HDL.

Key concepts include:

- Module declaration
- Port declaration
- Continuous assignment
- Boolean operators
- Conditional selection
- Case statements
- Synthesizable RTL coding

### 7. Testbench Development

Develop dedicated testbenches to apply different input combinations and verify that the correct output line is activated.

The basic verification flow is:

**Test Stimulus → DUT → Output Observation → Functional Verification**

### 8. Simulation and Waveform Analysis

Analyze simulation waveforms to verify that each binary input combination activates the expected decoder output.

The waveform analysis includes:

- Input transitions
- Output transitions
- Binary-to-output mapping
- Output selection
- Functional verification

### 9. RTL Schematic Analysis

Analyze the generated RTL schematic to understand how the Verilog description is represented as hardware logic.

This establishes the connection between:

**Verilog Code → RTL Structure → Hardware Logic**

### 10. Applications of Decoders

Understand the use of decoders in digital systems such as:

- Memory address decoding
- Chip selection
- Instruction decoding
- Control logic
- Demultiplexing
- Processor datapaths
- Peripheral selection
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
