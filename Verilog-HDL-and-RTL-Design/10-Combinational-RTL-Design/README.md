# ◈ Combinational RTL Design & Digital Building Blocks

[![Stage](https://img.shields.io/badge/Stage-Combinational_RTL_Design-blue.svg?style=flat-square)](#)
[![Focus](https://img.shields.io/badge/Focus-Verilog_Combinational_Logic-green.svg?style=flat-square)](#)
[![Simulation](https://img.shields.io/badge/Simulator-AMD_Vivado-red.svg?style=flat-square&logo=xilinx)](#)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=flat-square)](#)

This module provides a comprehensive repository of fundamental combinational digital logic circuits and their synthesizable Verilog HDL implementations. It spans core logic gates, arithmetic blocks (adders, subtractors), data routing elements (multiplexers, demultiplexers), encoding/decoding modules, and binary magnitude comparators. Each design includes synthesizable RTL source code, self-checking testbenches, post-synthesis RTL schematics, and simulation waveforms.

---

## ⚡ Combinational RTL Design Quick Reference

| Module Category | Core Functionality | Primary Verilog Operators / Constructs | Output Characteristics |
| :--- | :--- | :--- | :--- |
| **Logic Gates** | Fundamental Boolean primitives | `assign`, `&`, `\|`, `~`, `^`, `~^` | Purely functional, memoryless bitwise logic. |
| **Adders & Subtractors** | Binary addition & subtraction | `+`, `-`, or structural primitive instances | Sum/Diff, Carry-out/Borrow-out generation. |
| **Multiplexers (MUX)** | Multi-to-one data selection | Continuous `? :` or procedural `case` / `if-else` | Routes one selected input to a single output. |
| **Demultiplexers (DEMUX)**| One-to-multi data routing | Procedural `case` with enable masking | Routes a single input to one of $2^n$ outputs. |
| **Decoders** | $n$-to-$2^n$ code translation | Bit-shift `1 << in` or explicit `case` | One-hot asserted output configuration. |
| **Encoders** | $2^n$-to-$n$ active line encoding | Procedural `case` / conditional logic | Encodes active inputs into binary output codes. |
| **Comparators** | Magnitude evaluation | Relational operators (`>`, `==`, `<`) | Asserts `A>B`, `A==B`, or `A<B` magnitude flags. |

---

## 🎯 Learning Objectives

By working through this module, you will be able to:

- Understand the fundamental concepts of combinational digital logic.
- Understand how outputs depend only on the current input values.
- Design and implement fundamental combinational digital circuits.
- Analyze truth tables and Boolean expressions.
- Understand data selection, data routing, encoding, decoding, arithmetic, and comparison operations.
- Write synthesizable Verilog RTL for combinational circuits.
- Develop dedicated Verilog testbenches for functional verification.
- Analyze RTL schematics and simulation waveforms.
- Understand the relationship between Verilog RTL and synthesized hardware.
- Build a strong foundation for sequential RTL design and advanced RTL IP development.

---

## 📂 Module Contents

| Module | Core Technical Focus |
| :--- | :--- |
| **[01-Logic-Gates](./01-Logic-Gates/)** | Design and verification of fundamental AND, OR, NOT, NAND, NOR, XOR, and XNOR logic gates using synthesizable Verilog RTL. |
| **[02-Adders](./02-Adders/)** | Design and verification of Half Adder, Full Adder, and Full Adder using two Half Adders for binary arithmetic operations. |
| **[03-Subctractor](./03-Subtractor/)** | Design and verification of Half Subtractor, Full Subtractor, and Full Subtractor using two Half Subtractors for binary subtraction. |
| **[04-Multiplexers](./04-Multiplexers/)** | Design and verification of 2×1, 4×1, and 8×1 multiplexers for selecting one input from multiple data inputs. |
| **[05-Demultiplexers](./05-Demultiplexers/)** | Design and verification of 1×2, 1×4, and 1×8 demultiplexers for routing a single input to one of multiple outputs. |
| **[06-Decoders](./06-Decoders/)** | Design and verification of 2×4, 3×8, and 4×16 decoders for converting binary input codes into one-hot output selections. |
| **[07-Encoders](./07-Encoders/)** | Design and verification of 4×2, 8×3, and 16×4 encoders for converting active input lines into binary output codes. |
| **[08-Comparators](./08-Comparators/)** | Design and verification of 1-bit, 2-bit, and 4-bit magnitude comparators for determining greater-than, equal-to, and less-than relationships. |

---

## 🌲 Directory Structure

```text
10-Combinational-RTL-Design/
├── 01-Logic-Gates/
│   ├── 01-AND-Gate/
│   │   ├── README.md
│   │   ├── and_gate.v
│   │   ├── and_gate_tb.v
│   │   ├── rtl-schematic.png
│   │   └── waveform.png
│   │
│   ├── 02-OR-Gate/
│   │   ├── README.md
│   │   ├── or_gate.v
│   │   ├── or_gate_tb.v
│   │   ├── rtl-schematiic.png
│   │   └── waveform.png
│   │
│   ├── 03-NOT-Gate/
│   │   ├── README.md
│   │   ├── not_gate.v
│   │   ├── not_gate_tb.v
│   │   ├── rtl-schematic.png
│   │   └── waveform.png
│   │
│   ├── 04-NAND-Gate/
│   │   ├── README.md
│   │   ├── nand_gate.v
│   │   ├── nand_gate_tb.v
│   │   ├── rtl-schematic.png
│   │   └── waveform.png
│   │
│   ├── 05-NOR-Gate/
│   │   ├── README.md
│   │   ├── nor_gate.v
│   │   ├── nor_gate_tb.v
│   │   ├── rtl-schematic.png
│   │   └── waveform.png
│   │
│   ├── 06-XOR-Gate/
│   │   ├── README.md
│   │   ├── xor_gate.v
│   │   ├── xor_gate_tb.v
│   │   ├── rtl-schematic.png
│   │   └── waveform.png
│   │
│   └── 07-XNOR-Gate/
│       ├── README.md
│       ├── xnor_gate.v
│       ├── xnor_gate_tb.v
│       ├── rtl-schematic.png
│       └── waveform.png
│
├── 02-Adders/
│   ├── 01-Half-Adder/
│   │   ├── README.md
│   │   ├── half_adder.v
│   │   ├── half_adder_tb.v
│   │   ├── rtl-schematic.png
│   │   └── waveform.png
│   │
│   ├── 02-Full-Adder/
│   │   ├── README.md
│   │   ├── full_adder.v
│   │   ├── full_adder_tb.v
│   │   ├── rtl-schematic.png
│   │   └── waveform.png
│   │
│   └── 03-Full-Adder-Using-Half-Adder/
│       ├── README.md
│       ├── full-adder-using-two-half-adder.v
│       ├── full-adder-using-two-half-adder_tb.v
│       ├── rtl-schematic.png
│       └── waveform.png
│
├── 03-Subctractor/
│   ├── 01-Half-Subctractor/
│   │   ├── README.md
│   │   ├── half_subctractor.v
│   │   ├── half_subctractor_tb.v
│   │   ├── rtl-schematic.png
│   │   └── waveform.png
│   │
│   ├── 02-Full-Subctractor/
│   │   ├── README.md
│   │   ├── full_subctractor.v
│   │   ├── full_subctractor_tb.v
│   │   ├── rtl-schematic.png
│   │   └── waveform.png
│   │
│   └── 03-Full-Subctractor-Using-Half-Subctractor/
│       ├── README.md
│       ├── full-subctractor-using-two-half-subctractor.v
│       ├── full-Adder-Using-Two-Half-Adder_tb.v
│       ├── rtl-schematic.png
│       └── waveform.png
│
├── 04-Multiplexers/
│   ├── 01-Mux-2x1/
│   │   ├── README.md
│   │   ├── mux_2x1.v
│   │   ├── mux_2x1_tb.v
│   │   ├── rtl-schematic.png
│   │   └── waveform.png
│   │
│   ├── 02-Mux-4x1/
│   │   ├── README.md
│   │   ├── mux_4x1.v
│   │   ├── mux_4x1_tb.v
│   │   ├── rtl-schematic.png
│   │   └── waveform.png
│   │
│   └── 03-Mux-8x1/
│       ├── README.md
│       ├── mux_8x1.v
│       ├── mux_8x1_tb.v
│       ├── rtl-schematic.png
│       └── waveform.png
│
├── 05-Demultiplexers/
│   ├── 01-Demux-1x2/
│   │   ├── README.md
│   │   ├── demux_1x2.v
│   │   ├── demux_1x2_tb.v
│   │   ├── rtl-schematic.png
│   │   └── waveform.png
│   │
│   ├── 02-Demux-1x4/
│   │   ├── README.md
│   │   ├── demux_1x4.v
│   │   ├── demux_1x4_tb.v
│   │   ├── rtl-schematic.png
│   │   └── waveform.png
│   │
│   └── 03-Demux-1x8/
│       ├── README.md
│       ├── demux_1x8.v
│       ├── demux_1x8_tb.v
│       ├── rtl-schematic.png
│       └── waveform.png
│
├── 06-Decoders/
│   ├── 01-Decoder-2x4/
│   │   ├── README.md
│   │   ├── decoder_2x4.v
│   │   ├── decoder_2x4_tb.v
│   │   ├── rtl-schematic.png
│   │   └── waveform.png
│   │
│   ├── 02-Decoder-3x8/
│   │   ├── README.md
│   │   ├── decoder_3x8.v
│   │   ├── decoder_3x8_tb.v
│   │   ├── rtl-schematic.png
│   │   └── waveform.png
│   │
│   └── 03-Decoder-4x16/
│       ├── README.md
│       ├── decoder_4x16.v
│       ├── decoder_4x16_tb.v
│       ├── rtl-schematic.png
│       └── waveform.png
│
├── 07-Encoders/
│   ├── 01-Encoder-4x2/
│   │   ├── README.md
│   │   ├── encoder_4x2.v
│   │   ├── encoder_4x2_tb.v
│   │   ├── rtl-schematic.png
│   │   └── waveform.png
│   │
│   ├── 02-Encoder-8x3/
│   │   ├── README.md
│   │   ├── encoder_8x3.v
│   │   ├── encoder_8x3_tb.v
│   │   ├── rtl-schematic.png
│   │   └── waveform.png
│   │
│   └── 03-Encoder-16x4/
│       ├── README.md
│       ├── encoder_16x4.v
│       ├── decoder_16x4_tb.v
│       ├── rtl-schematic.png
│       └── waveform.png
│
└── 08-Comparators/
    ├── 1-Bit-Comparator/
    │   ├── README.md
    │   ├── 1_bit_Comparator.v
    │   ├── 1_bit_Comparator_tb.v
    │   ├── rtl-schematic.png
    │   └── waveform.png
    │
    ├── 2-Bit-Comparator/
    │   ├── README.md
    │   ├── 2_bit_Comparator.v
    │   ├── 2_bit_Comparator_tb.v
    │   ├── rtl-schematic.png
    │   └── waveform.png
    │
    └── 4-Bit-Comparator/
        ├── README.md
        ├── 4_bit_Comparator.v
        ├── 4_bit_Comparator_tb.v
        ├── rtl-schematic.png
        └── waveform.png
```

---

## 🛠️ Core Concepts Covered

### 1. Combinational Logic Fundamentals

Understand combinational logic as digital logic in which the output depends only on the current input values.

Unlike sequential logic, combinational circuits do not require a clock or stored state.

The basic relationship is:

**Current Inputs → Combinational Logic → Current Outputs**

### 2. Logic Gates

Study the fundamental building blocks of digital logic:

- AND
- OR
- NOT
- NAND
- NOR
- XOR
- XNOR

Understand their truth tables, Boolean expressions, logic symbols, and Verilog RTL implementations.

### 3. Binary Arithmetic

Understand how digital systems perform basic binary arithmetic using combinational circuits.

The arithmetic section includes:

- Half Adder
- Full Adder
- Full Adder using two Half Adders
- Half Subtractor
- Full Subtractor
- Full Subtractor using two Half Subtractors

These circuits establish the foundation for arithmetic datapaths and ALU design.

### 4. Half Adder

Study a Half Adder that performs binary addition of two single-bit inputs.

The circuit produces:

- **Sum**
- **Carry**

The Boolean expressions are:

**Sum = A ⊕ B**

**Carry = A · B**

### 5. Full Adder

Study a Full Adder that performs binary addition of three single-bit inputs:

- Input A
- Input B
- Carry-In

The circuit produces:

- **Sum**
- **Carry-Out**

Understand how Full Adders are used to construct larger multi-bit arithmetic circuits.

### 6. Half Subtractor

Study a Half Subtractor that performs binary subtraction of two single-bit inputs.

The circuit produces:

- **Difference**
- **Borrow**

The Boolean expressions are:

**Difference = A ⊕ B**

**Borrow = A̅ · B**

### 7. Full Subtractor

Study a Full Subtractor that performs binary subtraction using:

- Input A
- Input B
- Borrow-In

The circuit produces:

- **Difference**
- **Borrow-Out**

Understand how Full Subtractors can be combined to perform multi-bit binary subtraction.

### 8. Multiplexer Fundamentals

Understand a multiplexer as a combinational circuit that selects one input from multiple input lines and forwards the selected input to a single output.

The basic relationship is:

**Multiple Inputs → Select Lines → Single Output**

The module includes:

- 2×1 MUX
- 4×1 MUX
- 8×1 MUX

Understand how select lines determine which input reaches the output.

### 9. Demultiplexer Fundamentals

Understand a demultiplexer as a combinational circuit that routes one input signal to one of multiple output lines according to the select-line combination.

The basic relationship is:

**Single Input → Select Lines → Multiple Outputs**

The module includes:

- 1×2 DEMUX
- 1×4 DEMUX
- 1×8 DEMUX

### 10. Decoder Fundamentals

Understand a decoder as a combinational circuit that converts an n-bit binary input into one of 2ⁿ possible output lines.

The module includes:

- 2×4 Decoder
- 3×8 Decoder
- 4×16 Decoder

Understand one-hot output selection and binary-to-decimal decoding.

### 11. Encoder Fundamentals

Understand an encoder as a combinational circuit that converts an active input line into a corresponding binary output code.

The module includes:

- 4×2 Encoder
- 8×3 Encoder
- 16×4 Encoder

Understand the relationship between active input lines and encoded binary outputs.

### 12. Comparator Fundamentals

Understand a comparator as a combinational circuit that compares two binary numbers and determines their relative magnitude.

A magnitude comparator generally produces three outputs:

- **A > B**
- **A = B**
- **A < B**

The module includes:

- 1-Bit Comparator
- 2-Bit Comparator
- 4-Bit Comparator

### 13. Verilog RTL Implementation

Implement combinational circuits using synthesizable Verilog HDL.

Key concepts include:

- Module declaration
- Port declaration
- `wire` and `reg`
- Continuous assignment
- Boolean operators
- Logical operators
- Relational operators
- Conditional statements
- `always @(*)`
- `case` statements
- Synthesizable RTL coding

### 14. Combinational RTL Coding

Understand how a hardware requirement is translated into Verilog RTL.

The basic RTL design flow is:

**Digital Logic → Boolean Expression → Verilog RTL → RTL Schematic → Synthesized Hardware**

Focus on writing clear, deterministic, and synthesizable combinational logic without unintended storage elements.

### 15. Testbench Development

Develop dedicated Verilog testbenches to apply input combinations and verify the expected outputs of each DUT.

The basic verification flow is:

**Test Stimulus → DUT → Output Observation → Functional Verification**

Testbenches include:

- DUT instantiation
- Input stimulus
- Output monitoring
- Simulation control
- Waveform generation
- Functional checking

### 16. Simulation and Waveform Analysis

Analyze simulation waveforms to verify that the RTL implementation behaves according to the expected truth table and Boolean logic.

The waveform analysis includes:

- Input transitions
- Select-line transitions
- Output transitions
- Arithmetic results
- Data routing
- Encoding and decoding
- Magnitude comparison
- Functional verification

### 17. RTL Schematic Analysis

Analyze the generated RTL schematic to understand how the Verilog description is represented as hardware logic.

This establishes the connection between:

**Verilog Code → RTL Structure → Hardware Logic**

RTL schematic analysis helps develop the ability to visualize the hardware generated from RTL code.

### 18. Hierarchical and Reusable Design

Understand how smaller combinational blocks can be reused to construct larger digital circuits.

Examples include:

- Full Adder using Half Adders
- Full Subtractor using Half Subtractors
- Multi-bit arithmetic circuits
- Larger multiplexing structures
- Larger encoding and decoding structures

This introduces an important RTL design principle:

**Small Verified Blocks → Hierarchical Design → Larger RTL System**

### 19. Synthesizable RTL Practices

Develop basic industry-oriented RTL coding habits for combinational logic.

Focus areas include:

- Complete combinational assignments
- Avoiding unintended latches
- Correct sensitivity lists
- Proper use of blocking assignments in combinational procedural logic
- Clear module interfaces
- Reusable RTL structures
- Functional correctness
- Hardware-oriented thinking

### 20. Applications of Combinational RTL

Understand how these fundamental circuits are used as building blocks in larger digital systems such as:

- Arithmetic Logic Units (ALUs)
- Processor datapaths
- Control logic
- Data routing
- Address decoding
- Memory selection
- Communication systems
- Bus systems
- FPGA designs
- ASIC designs
- RTL IP development

---

## 🧰 Tools & Technologies

| Category | Tool / Technology |
| :--- | :--- |
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
