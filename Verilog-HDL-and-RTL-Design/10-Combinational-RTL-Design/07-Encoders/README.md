# ◈ Encoders & Binary Encoding Circuits

[![Stage](https://img.shields.io/badge/Stage-Combinational_RTL_Design-blue.svg?style=flat-square)](#)
[![Focus](https://img.shields.io/badge/Focus-Verilog_Encoder_Circuits-orange.svg?style=flat-square)](#)
[![Simulation](https://img.shields.io/badge/Simulator-AMD_Vivado-red.svg?style=flat-square&logo=xilinx)](#)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=flat-square)](#)

This module covers the design, logic synthesis, and functional verification of binary encoder circuits using synthesizable Verilog HDL. It details $4\times2$, $8\times3$, and $16\times4$ standard binary encoder architectures, complete with synthesizable RTL modules, self-checking testbenches, RTL schematics, and simulation waveforms.

---

## ⚡ Binary Encoders Quick Reference

| Encoder Type | Input Lines ($2^n$) | Output Lines ($n$) | Standard Encoding Relationship |
| :--- | :---: | :---: | :--- |
| **$4\times2$ Encoder** | $4$ | $2$ | $Y[1:0] = f(I[3:0])$ |
| **$8\times3$ Encoder** | $8$ | $3$ | $Y[2:0] = f(I[7:0])$ |
| **$16\times4$ Encoder** | $16$ | $4$ | $Y[3:0] = f(I[15:0])$ |.

---

## 🎯 Learning Objectives

By working through this module, you will be able to:

- Understand the fundamental operation of binary encoders.
- Understand the relationship between active input lines and encoded binary outputs.
- Design and implement 4×2, 8×3, and 16×4 encoders.
- Analyze encoder truth tables and Boolean expressions.
- Write synthesizable Verilog RTL for encoder circuits.
- Develop dedicated Verilog testbenches for functional verification.
- Analyze RTL schematics and simulation waveforms.
- Understand the role of encoders in larger digital systems.

---

## 📂 Module Contents

| Module | Core Technical Focus |
| :--- | :--- |
| **[`01-Encoder-4x2`](./01-Encoder-4x2/)** | Design and verification of a 4×2 encoder that converts one of four active input lines into a two-bit binary output. |
| **[`02-Encoder-8x3`](./02-Encoder-8x3/)** | Design and verification of an 8×3 encoder that converts one of eight active input lines into a three-bit binary output. |
| **[`03-Encoder-16x4`](./03-Encoder-16x4/)** | Design and verification of a 16×4 encoder that converts one of sixteen active input lines into a four-bit binary output. |

---

## 🌲 Directory Structure

    07-Encoders/
    ├── 01-Encoder-4x2/
    │   ├── encoder_4x2.v
    │   ├── encoder_4x2_tb.v
    │   ├── rtl-schematic.png
    │   └── waveform.png
    │
    ├── 02-Encoder-8x3/
    │   ├── encoder_8x3.v
    │   ├── encoder_8x3_tb.v
    │   ├── rtl-schematic.png
    │   └── waveform.png
    │
    └── 03-Encoder-16x4/
        ├── encoder_16x4.v
        ├── encoder_16x4_tb.v
        ├── rtl-schematic.png
        └── waveform.png

---

## 🛠️ Core Concepts Covered

### 1. Encoder Fundamentals

Understand an encoder as a combinational circuit that converts one active input among multiple input lines into a corresponding binary output code.

The basic relationship is:

**2ⁿ Input Lines → Encoder → n Output Lines**

For a standard encoder, one input is assumed to be active at a time.

### 2. 4×2 Encoder

Study the operation of a 4×2 encoder with:

- 4 Input Lines
- 2 Output Lines

The four possible input positions are represented by a two-bit binary output code.

### 3. 8×3 Encoder

Study the operation of an 8×3 encoder with:

- 8 Input Lines
- 3 Output Lines

The eight possible input positions are represented by a three-bit binary output code.

### 4. 16×4 Encoder

Study the operation of a 16×4 encoder with:

- 16 Input Lines
- 4 Output Lines

The sixteen possible input positions are represented by a four-bit binary output code.

### 5. Binary Encoding

Understand how an active input line is converted into its corresponding binary representation.

Examples:

- 4 inputs → 2-bit encoded output
- 8 inputs → 3-bit encoded output
- 16 inputs → 4-bit encoded output

This concept forms the foundation of data encoding and control logic.

### 6. Verilog RTL Implementation

Implement encoder circuits using synthesizable Verilog HDL.

Key concepts include:

- Module declaration
- Port declaration
- Continuous assignment
- Boolean operators
- Conditional selection
- Case statements
- Synthesizable RTL coding

### 7. Testbench Development

Develop dedicated testbenches to apply different input combinations and verify that the correct binary output code is generated.

The basic verification flow is:

**Test Stimulus → DUT → Output Observation → Functional Verification**

### 8. Simulation and Waveform Analysis

Analyze simulation waveforms to verify that each active input produces the expected encoded binary output.

The waveform analysis includes:

- Input transitions
- Output transitions
- Input-to-code mapping
- Binary encoding
- Functional verification

### 9. RTL Schematic Analysis

Analyze the generated RTL schematic to understand how the Verilog description is represented as hardware logic.

This establishes the connection between:

**Verilog Code → RTL Structure → Hardware Logic**

### 10. Applications of Encoders

Understand the use of encoders in digital systems such as:

- Keyboard interfaces
- Interrupt controllers
- Data encoding
- Control logic
- Communication systems
- Processor systems
- Priority and selection logic
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
