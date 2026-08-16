# ◈ Multiplexers

[![Stage](https://img.shields.io/badge/Combinational--RTL--Design-blue.svg)](#)
[![Focus](https://img.shields.io/badge/Focus-Verilog%20Multiplexers%20-orange.svg)](#)
[![Simulation](https://img.shields.io/badge/Simulation-Vivado%20Simulator-red.svg)](#)

This module covers the fundamental multiplexer circuits and their Verilog HDL implementations. It includes 2×1, 4×1, and 8×1 multiplexers, along with RTL designs, dedicated testbenches, RTL schematics, and simulation waveforms.

The module provides practical experience in understanding data selection, implementing multiplexers using synthesizable Verilog RTL, and verifying their functionality through simulation.

---

## 🎯 Learning Objectives

By working through this module, you will be able to:

- Understand the fundamental operation of multiplexers.
- Understand how select lines control data selection.
- Design and implement 2×1, 4×1, and 8×1 multiplexers.
- Analyze multiplexer truth tables and Boolean expressions.
- Write synthesizable Verilog RTL for multiplexer circuits.
- Develop dedicated Verilog testbenches for functional verification.
- Analyze RTL schematics and simulation waveforms.
- Understand the role of multiplexers in larger digital systems.

---

## 📂 Module Contents

| Module | Core Technical Focus |
| :--- | :--- |
| **[`01-Mux-2x1`](./01- Mux-2x1/)** | Design and verification of a 2×1 multiplexer using one select line to select one of two input signals. |
| **[`02-Mux-4x1`](./02- Mux-4x1/)** | Design and verification of a 4×1 multiplexer using two select lines to select one of four input signals. |
| **[`03-Mux-8x1`](./03- Mux-8x1/)** | Design and verification of an 8×1 multiplexer using three select lines to select one of eight input signals. |

---

## 🌲 Directory Structure

    04-Multiplexers/
    ├── 01-Mux-2x1/
    │   ├── README.md
    │   ├── mux_2x1.v
    │   ├── mux_2x1_tb.v
    │   ├── rtl-schematic.png
    │   └── waveform.png
    │
    ├── 02-Mux-4x1/
    │   ├── mux_4x1.v
    │   ├── mux_4x1_tb.v
    │   ├── rtl-schematic.png
    │   └── waveform.png
    │
    └── 03-Mux-8x1/
        ├── mux-8x1.v
        ├── mux-8x1_tb.v
        ├── rtl-schematic.png
        └── waveform.png

---

## 🛠️ Core Concepts Covered

### 1. Multiplexer Fundamentals

Understand a multiplexer as a combinational circuit that selects one input from multiple input signals and transfers the selected input to a single output.

A multiplexer is commonly referred to as a **MUX** or **data selector**.

The basic relationship is:

**Multiple Inputs → Select Lines → Single Output**

### 2. Select Lines

Understand how select lines determine which input signal is connected to the output.

For a multiplexer with **2ⁿ inputs**, the number of required select lines is **n**.

Examples:

- 2×1 MUX → 1 Select Line
- 4×1 MUX → 2 Select Lines
- 8×1 MUX → 3 Select Lines

### 3. 2×1 Multiplexer

Study the operation of a 2×1 multiplexer with:

- 2 Data Inputs
- 1 Select Line
- 1 Output

The Boolean expression is:

**Y = S̅I₀ + SI₁**

The select input determines whether **I₀** or **I₁** appears at the output.

### 4. 4×1 Multiplexer

Study the operation of a 4×1 multiplexer with:

- 4 Data Inputs
- 2 Select Lines
- 1 Output

The two select lines provide four possible selection combinations, allowing one of the four inputs to be transferred to the output.

### 5. 8×1 Multiplexer

Study the operation of an 8×1 multiplexer with:

- 8 Data Inputs
- 3 Select Lines
- 1 Output

The three select lines provide eight possible selection combinations, allowing one of the eight inputs to be transferred to the output.

### 6. Verilog RTL Implementation

Implement multiplexer circuits using synthesizable Verilog HDL.

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

Analyze simulation waveforms to verify that the multiplexer correctly selects the required input according to the select lines.

The waveform analysis includes:

- Data input transitions
- Select-line transitions
- Output transitions
- Input selection
- Functional verification

### 9. RTL Schematic Analysis

Analyze the generated RTL schematic to understand how the Verilog description is represented as hardware logic.

This establishes the connection between:

**Verilog Code → RTL Structure → Hardware Logic**

### 10. Applications of Multiplexers

Understand the use of multiplexers in digital systems such as:

- Data routing
- Bus selection
- Processor datapaths
- ALUs
- Communication systems
- Control logic
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
