# ◈ Demultiplexers RTL Suite

[![Stage](https://img.shields.io/badge/Stage-Combinational_RTL_Design-blue.svg?style=flat-square)](#)
[![Focus](https://img.shields.io/badge/Focus-Verilog_Demultiplexer_Circuits-orange.svg?style=flat-square)](#)
[![Simulation](https://img.shields.io/badge/Simulator-AMD_Vivado-red.svg?style=flat-square&logo=xilinx)](#)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=flat-square)](#)

This directory contains synthesizable Verilog HDL implementations, structural/behavioral routing logic, and dedicated verification testbenches for fundamental demultiplexers ($1 \times 2$, $1 \times 4$, and $1 \times 8$). It provides hands-on experience with data distribution mechanisms, selection logic, synthesizable Verilog construct selection (`case` statements, bit-shift operations, continuous assignments), and functional RTL verification.

---

## ⚡ Demultiplexers Quick Reference

| Circuit | Input ($D$) | Select Lines ($N$) | Outputs ($2^N$) | Boolean Expression / Hardware Logic |
| :--- | :---: | :---: | :---: | :--- |
| **1×2 DEMUX** | $D$ | $S_0$ | $Y[1:0]$ | $Y_0 = \bar{S}_0 \cdot D$<br>$Y_1 = S_0 \cdot D$ |
| **1×4 DEMUX** | $D$ | $S_1, S_0$ | $Y[3:0]$ | $Y_0 = \bar{S}_1 \bar{S}_0 D, \quad Y_1 = \bar{S}_1 S_0 D$<br>$Y_2 = S_1 \bar{S}_0 D, \quad Y_3 = S_1 S_0 D$ |
| **1×8 DEMUX** | $D$ | $S_2, S_1, S_0$ | $Y[7:0]$ | $Y_k = m_k \cdot D \quad \text{where } m_k \text{ is the } k\text{-th minterm of } S[2:0]$. |

---

## 🎯 Learning Objectives

By working through this module, you will be able to:

- Understand the fundamental operation of demultiplexers.
- Understand how select lines control data distribution.
- Design and implement 1×2, 1×4, and 1×8 demultiplexers.
- Analyze demultiplexer truth tables and Boolean expressions.
- Write synthesizable Verilog RTL for demultiplexer circuits.
- Develop dedicated Verilog testbenches for functional verification.
- Analyze RTL schematics and simulation waveforms.
- Understand the role of demultiplexers in larger digital systems.

---

## 📂 Module Contents

| Module | Core Technical Focus |
| :--- | :--- |
| **[`01-Demux-1x2`](./01-Demux-1x2/)** | Design and verification of a 1×2 demultiplexer using one select line to route a single input to one of two outputs. |
| **[`02-Demux-1x4`](./02-Demux-1x4/)** | Design and verification of a 1×4 demultiplexer using two select lines to route a single input to one of four outputs. |
| **[`03-Demux-1x8`](./03-Demux-1x8/)** | Design and verification of a 1×8 demultiplexer using three select lines to route a single input to one of eight outputs. |

---

## 🌲 Directory Structure

    05-Demultiplexers/
    ├── 01-Demux-1x2/
    │   ├── demux_1x2.v
    │   ├── demux_1x2_tb.v
    │   ├── rtl-schematic.png
    │   └── waveform.png
    │
    ├── 02-Demux-1x4/
    │   ├── demux_1x4.v
    │   ├── demux_1x4_tb.v
    │   ├── rtl-schematic.png
    │   └── waveform.png
    │
    └── 03-Demux-1x8/
        ├── demux_1x8.v
        ├── demux_1x8_tb.v
        ├── rtl-schematic.png
        └── waveform.png

---

## 🛠️ Core Concepts Covered

### 1. Demultiplexer Fundamentals

Understand a demultiplexer as a combinational circuit that routes a single input signal to one of multiple output lines based on the select-line combination.

A demultiplexer is commonly referred to as a **DEMUX** or **data distributor**.

The basic relationship is:

**Single Input → Select Lines → Multiple Outputs**

### 2. Select Lines

Understand how select lines determine which output receives the input signal.

For a demultiplexer with **2ⁿ outputs**, the number of required select lines is **n**.

Examples:

- 1×2 DEMUX → 1 Select Line
- 1×4 DEMUX → 2 Select Lines
- 1×8 DEMUX → 3 Select Lines

### 3. 1×2 Demultiplexer

Study the operation of a 1×2 demultiplexer with:

- 1 Data Input
- 1 Select Line
- 2 Outputs

The input signal is routed to one of the two outputs according to the select input.

The Boolean expressions are:

**Y₀ = D · S̅**

**Y₁ = D · S**

### 4. 1×4 Demultiplexer

Study the operation of a 1×4 demultiplexer with:

- 1 Data Input
- 2 Select Lines
- 4 Outputs

The two select lines provide four possible selection combinations, allowing the input signal to be routed to one of the four outputs.

### 5. 1×8 Demultiplexer

Study the operation of a 1×8 demultiplexer with:

- 1 Data Input
- 3 Select Lines
- 8 Outputs

The three select lines provide eight possible selection combinations, allowing the input signal to be routed to one of the eight outputs.

### 6. Verilog RTL Implementation

Implement demultiplexer circuits using synthesizable Verilog HDL.

Key concepts include:

- Module declaration
- Port declaration
- Continuous assignment
- Boolean operators
- Conditional selection
- Case statements
- Synthesizable RTL coding

### 7. Testbench Development

Develop dedicated testbenches to apply different input and select-line combinations and verify the expected output.

The basic verification flow is:

**Test Stimulus → DUT → Output Observation → Functional Verification**

### 8. Simulation and Waveform Analysis

Analyze simulation waveforms to verify that the demultiplexer correctly routes the input to the required output according to the select lines.

The waveform analysis includes:

- Data input transitions
- Select-line transitions
- Output transitions
- Data routing
- Functional verification

### 9. RTL Schematic Analysis

Analyze the generated RTL schematic to understand how the Verilog description is represented as hardware logic.

This establishes the connection between:

**Verilog Code → RTL Structure → Hardware Logic**

### 10. Applications of Demultiplexers

Understand the use of demultiplexers in digital systems such as:

- Data routing
- Data distribution
- Communication systems
- Memory selection
- Control logic
- Bus systems
- Processor datapaths
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
