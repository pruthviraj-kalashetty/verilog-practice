# ◈ State Encoding

[![Stage](https://img.shields.io/badge/Stage-RTL_Optimization-blue.svg?style=flat-square)](#)
[![Focus](https://img.shields.io/badge/Focus-Binary_vs_One--Hot_vs_Gray-orange.svg?style=flat-square)](#)
[![Simulation](https://img.shields.io/badge/Simulator-AMD_Vivado-red.svg?style=flat-square&logo=xilinx)](#)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=flat-square)](#)

This module provides a detailed evaluation and synthesizable Verilog HDL implementation of core **FSM State Encoding Techniques**: **Binary**, **One-Hot**, and **Gray** encoding. State encoding directly impacts the physical implementation of an FSM, dictating state register width, next-state logic depth, dynamic switching power, and maximum operating frequency ($f_{\max}$).

The module explores the architectural trade-offs between ASIC and FPGA targets, detailing how state assignment styles affect lookup table (LUT) utilization, register counts, clock-to-q delays, and setup/hold timing closure in high-speed digital designs.

---

## ⚡ Architectural Comparison Matrix

| Metric / Parameter | Binary Encoding | One-Hot Encoding | Gray Encoding |
| :--- | :--- | :--- | :--- |
| **Flip-Flop Count ($N$ States)** | $\lceil\log_2(N)\rceil$ | $N$ | $\lceil\log_2(N)\rceil$ |
| **Combinational Logic Depth** | Complex ($N$-input decoding trees) | Minimal (single-bit check per state) | Moderate (similar to binary) |
| **Bit Toggles per Transition** | Multiple bits (up to $\log_2 N$) | Exactly 2 bits ($1 \to 0$ and $0 \to 1$) | Exactly 1 bit (adjacent states) |
| **Dynamic Power Consumption** | Higher due to multi-bit toggles | Moderate (minimal logic activity) | Lowest for sequential transitions |
| **Optimal Target Technology** | ASICs, dense low-register designs | FPGAs (LUT/FF rich architecture) | Asynchronous interfaces, counter FSMs |
| **Critical Path Impact** | Decoding logic grows with $N$ | High-speed decode ($O(1)$ state check) | Minimal hazard risk on single-bit shift |

---

## 🎯 Learning Objectives

By working through this module, you will be able to:

- Understand the purpose of state encoding in FSM design.
- Understand how symbolic FSM states are represented using binary values.
- Design and implement Binary state encoding.
- Design and implement One-Hot state encoding.
- Design and implement Gray state encoding.
- Compare the hardware characteristics of different state encoding techniques.
- Write synthesizable Verilog RTL for different state encoding styles.
- Develop dedicated Verilog testbenches for functional verification.
- Analyze RTL schematics and simulation waveforms.
- Understand the trade-offs between area, speed, switching activity, and implementation complexity.
- Understand the role of state encoding in ASIC and FPGA FSM implementations.

---

## 📂 Module Contents

| Module | Core Technical Focus |
| :--- | :--- |
| **[01-Binary-Encoding](./01-Binary-Encoding/)** | Design and verification of an FSM using binary state encoding, where each state is represented using the minimum number of flip-flops required for the number of states. |
| **[02-One-Hot-Encoding](./02-One-Hot-Encoding/)** | Design and verification of an FSM using one-hot state encoding, where each FSM state is represented by a dedicated flip-flop. |
| **[03-Gray-Encoding](./03-Gray-Encoding/)** | Design and verification of an FSM using Gray state encoding, where adjacent states are assigned codes that differ by only one bit. |

---

## 🌲 Directory Structure
```
05-State-Encoding/
├── 01-Binary-Encoding/
│   ├── binary_encoding.v
│   ├── binary_encoding_tb.v
│   ├── rtl-schematic.png
│   └── waveform.png
│
├── 02-One-Hot-Encoding/
│   ├── one_hot_encoding.v
│   ├── one_hot_encoding_tb.v
│   ├── rtl-schematic.png
│   └── waveform.png
│
└── 03-Gray-Encoding/
    ├── gray_encoding.v
    ├── gray_encoding _tb.v
    ├── rtl-schematic.png
    └── waveform.png
```
---

## 🛠️ Core Concepts Covered

### 1. State Encoding Fundamentals

Understand state encoding as the process of assigning binary values to the symbolic states of an FSM.

For example, an FSM with four states can represent those states using different encoding schemes:

**State → Encoded Binary Value**

The selected encoding affects the number of state-register bits, combinational logic, switching activity, and potentially the timing and area of the resulting implementation.

### 2. Binary State Encoding

Study binary encoding, where an FSM with **N states** generally requires:

**⌈log₂(N)⌉ flip-flops**

For example:

- 2 states → 1 flip-flop
- 4 states → 2 flip-flops
- 8 states → 3 flip-flops
- 16 states → 4 flip-flops

Binary encoding provides compact state representation and is commonly useful when minimizing the number of state-storage elements is important.

### 3. One-Hot State Encoding

Study one-hot encoding, where each FSM state is represented by one dedicated flip-flop.

For an FSM with **N states**, one-hot encoding generally uses:

**N flip-flops**

For example, a four-state FSM can be represented as:

- State 0 → `0001`
- State 1 → `0010`
- State 2 → `0100`
- State 3 → `1000`

Only one state bit is asserted at a time during normal operation.

One-hot encoding can simplify state-transition and output logic and is particularly common in FPGA implementations where flip-flops are relatively abundant.

### 4. Gray State Encoding

Study Gray encoding, where adjacent FSM states are assigned codes that differ by only one bit.

For example, a four-state sequence can be represented as:

- State 0 → `00`
- State 1 → `01`
- State 2 → `11`
- State 3 → `10`

Only one state bit changes between adjacent states in the sequence.

Gray encoding can help reduce simultaneous bit transitions and switching activity for suitable state-transition patterns.

### 5. State Encoding Comparison

Compare the three encoding techniques based on their hardware characteristics.

| Encoding | Flip-Flops | Main Characteristic |
| :--- | :--- | :--- |
| **Binary** | ⌈log₂(N)⌉ | Compact state representation |
| **One-Hot** | N | Simple decoding and potentially fast control logic |
| **Gray** | ⌈log₂(N)⌉ | Adjacent states differ by one bit |

The most suitable encoding depends on the target technology, FSM structure, timing requirements, area constraints, and synthesis results.

### 6. State Register Implementation

Understand how the selected state encoding is stored in sequential logic using flip-flops.

The basic FSM relationship is:

**Current State → Next-State Logic → Next State**

The state register updates on the active clock edge and stores the encoded representation of the current FSM state.

### 7. Next-State Logic

Understand how the encoded current state and input conditions determine the next encoded state.

The general FSM flow is:

**Current State + Inputs → Next-State Logic → Next State**

The next-state logic must correctly interpret the selected encoding scheme and generate the appropriate encoded state.

### 8. Output Logic

Understand how FSM outputs can be generated from the encoded state and, where applicable, from external inputs.

State encoding can influence the complexity of output decoding because different encoding schemes produce different bit patterns for the same symbolic states.

### 9. Verilog RTL Implementation

Implement FSM state encoding techniques using synthesizable Verilog HDL.

Key concepts include:

- State registers
- `parameter` or `localparam` state definitions
- Binary state values
- One-hot state values
- Gray state values
- Sequential `always` blocks
- Combinational next-state logic
- Case statements
- Reset logic
- Synthesizable RTL coding

### 10. Testbench Development

Develop dedicated testbenches to apply clock, reset, and input stimulus and verify correct state transitions for each encoding technique.

The basic verification flow is:

**Test Stimulus → DUT → State Transition → Output Observation → Functional Verification**

The testbench should verify that different encoding implementations produce the expected FSM behavior.

### 11. Simulation and Waveform Analysis

Analyze simulation waveforms to observe how the encoded state changes with each clock cycle.

The waveform analysis includes:

- Clock transitions
- Reset behavior
- Input transitions
- Current-state values
- Next-state behavior
- State encoding transitions
- Output transitions
- Functional verification

Waveform analysis is especially useful for comparing how Binary, One-Hot, and Gray encoding represent the same FSM sequence.

### 12. RTL Schematic Analysis

Analyze the generated RTL schematic to understand how each state encoding technique is represented as hardware logic.

This establishes the connection between:

**FSM Description → State Encoding → RTL Structure → Flip-Flops + Logic**

Comparing RTL schematics can help identify differences in state-register width and surrounding combinational logic.

### 13. ASIC and FPGA Considerations

Understand that state encoding is not universally optimal across all implementation technologies.

Important considerations include:

- Flip-flop utilization
- Combinational logic complexity
- Timing performance
- Area
- Power and switching activity
- Synthesis optimization
- Target technology
- FSM size and structure

In ASIC design, binary or tool-optimized encodings are often attractive when state storage and area are important. One-hot encoding can be advantageous in some timing-critical FSMs but uses more flip-flops. Gray encoding can be useful when minimizing state-transition bit toggling is beneficial.

### 14. Applications of State Encoding

Understand the use of state encoding in digital systems such as:

- Control FSMs
- Processor control units
- Communication controllers
- Protocol controllers
- UART and SPI controllers
- Bus interfaces
- Memory controllers
- Sequencers
- ASIC control logic
- FPGA control logic

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
