# ◈ Logic Gates RTL Suite

[![Stage](https://img.shields.io/badge/Stage-Combinational_RTL_Design-blue.svg?style=flat-square)](#)
[![Focus](https://img.shields.io/badge/Focus-Verilog_Logic_Gates-orange.svg?style=flat-square)](#)
[![Simulation](https://img.shields.io/badge/Simulator-AMD_Vivado-red.svg?style=flat-square&logo=xilinx)](#)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=flat-square)](#)

This directory contains synthesizable Verilog HDL implementations and dedicated verification testbenches for fundamental digital logic gates. It provides hands-on practice with the end-to-end RTL design lifecycle: **Verilog HDL → Testbench → Functional Simulation → Waveform Inspection → RTL Schematic Analysis**.

---

## ⚡ Logic Gates Quick Reference

| Gate | Verilog Expression | Logic Symbol / Equation | Truth Table Summary |
| :---: | :---: | :---: | :---: |
| **AND** | `assign Y = A & B;` | $Y = A \cdot B$ | `1` only if all inputs are `1` |
| **OR** | `assign Y = A \| B;` | $Y = A + B$ | `1` if at least one input is `1` |
| **NOT** | `assign Y = ~A;` | $Y = \bar{A}$ | Inverts input bit (`0` $\rightarrow$ `1`, `1` $\rightarrow$ `0`) |
| **NAND** | `assign Y = ~(A & B);` | $Y = \overline{A \cdot B}$ | `0` only if all inputs are `1` (Universal) |
| **NOR** | `assign Y = ~(A \| B);` | $Y = \overline{A + B}$ | `1` only if all inputs are `0` (Universal) |
| **XOR** | `assign Y = A ^ B;` | $Y = A \oplus B$ | `1` if inputs differ |
| **XNOR** | `assign Y = ~(A ^ B);` | $Y = \overline{A \oplus B}$ | `1` if inputs are identical |

---

## 🎯 Learning Objectives

By working through this module, you will learn to:
- Translate Boolean expressions into clean, synthesizable Verilog HDL.
- Write self-checking or directed stimulus testbenches.
- Validate combinational logic behavior using waveform viewers.
- Analyze generated RTL schematics to map HDL code directly to hardware gates.
- Establish a structured RTL workspace layout for GitHub portfolios.

---

## 📂 Module Navigation & Contents

| Directory | Module | Description |
| :--- | :---: | :--- |
| 📁 **[`01-AND-Gate`](./01-AND-Gate/)** | `and_gate` | 2-Input AND Gate RTL, Testbench, Schematic & Waveform |
| 📁 **[`02-OR-Gate`](./02-OR-Gate/)** | `or_gate` | 2-Input OR Gate RTL, Testbench, Schematic & Waveform |
| 📁 **[`03-NOT-Gate`](./03-NOT-Gate/)** | `not_gate` | 1-Input Inverter RTL, Testbench, Schematic & Waveform |
| 📁 **[`04-NAND-Gate`](./04-NAND-Gate/)** | `nand_gate` | 2-Input Universal NAND Gate RTL & Verification |
| 📁 **[`05-NOR-Gate`](./05-NOR-Gate/)** | `nor_gate` | 2-Input Universal NOR Gate RTL & Verification |
| 📁 **[`06-XOR-Gate`](./06-XOR-Gate/)** | `xor_gate` | 2-Input Exclusive-OR Gate RTL & Verification |
| 📁 **[`07-XNOR-Gate`](./07-XNOR-Gate/)** | `xnor_gate` | 2-Input Exclusive-NOR Gate RTL & Verification |

---

## 🌲 Directory Layout

```text
01-Logic-Gates/
├── 01-AND-Gate/
│   ├── README.md          # Dedicated module documentation
│   ├── and_gate.v         # Synthesizable RTL design
│   ├── and_gate_tb.v      # Directed testbench
│   ├── rtl-schematic.png  # Synthesized gate schematic
│   └── waveform.png       # Simulation output waveform
├── 02-OR-Gate/
│   └── ...
├── 03-NOT-Gate/
│   └── ...
├── 04-NAND-Gate/
│   └── ...
├── 05-NOR-Gate/
│   └── ...
├── 06-XOR-Gate/
│   └── ...
└── 07-XNOR-Gate/
    └── ...
