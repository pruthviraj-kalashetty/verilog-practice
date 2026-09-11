# ◈ FSM RTL Design Patterns

[![Stage](https://img.shields.io/badge/Stage-RTL_Architecture-blue.svg?style=flat-square)](#)
[![Focus](https://img.shields.io/badge/Focus-2--Always_vs_3--Always_Process-orange.svg?style=flat-square)](#)
[![Simulation](https://img.shields.io/badge/Simulator-AMD_Vivado-red.svg?style=flat-square&logo=xilinx)](#)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=flat-square)](#)

This module provides a detailed exploration, architectural comparison, and synthesizable Verilog HDL implementation of core **Finite State Machine (FSM) RTL Design Patterns**. Designing robust, high-performance FSMs requires strict discipline in separating sequential state storage from combinational next-state decoding and output generation.

The module focuses on the two industry-standard coding patterns—the **2-Process (2-Always Block)** and **3-Process (3-Always Block)** FSM architectures—exploring their impact on RTL readability, latch prevention, static timing analysis (STA), glitch immunity, and synthesis netlist mapping.

---

## ⚡ Architectural Comparison Matrix

| Metric / Parameter | 2-Process (2-Always Block) Pattern | 3-Process (3-Always Block) Pattern |
| :--- | :--- | :--- |
| **Process 1 Responsibilities** | Sequential State Register (`always @(posedge clk)`) | Sequential State Register (`always @(posedge clk)`) |
| **Process 2 Responsibilities** | Combined Next-State & Output Logic (`always @(*)`) | Next-State Decoder Logic (`always @(*)`) |
| **Process 3 Responsibilities** | *Not applicable (merged into Process 2)* | Dedicated Output Decoder Logic (`always @(*)`) |
| **Code Modularity** | Compact, but can become cluttered in complex FSMs | Highly modular; clean functional separation |
| **Glitch Behavior** | Output logic shares combinational cone with next state | Decoupled output logic simplifies glitch analysis & pipelining |
| **Synthesis Safety** | Requires careful default assignments to prevent latches | Easiest pattern for static analysis tools to verify non-latching |
| **Primary Applications** | Simple control FSMs, counters, small protocols | Complex protocol engines, CPU controllers, bus arbiters |

---

## 🎯 Learning Objectives

By working through this module, you will be able to:

- Understand common RTL coding patterns used for FSM implementation.
- Understand the structure and purpose of a Two-Process FSM.
- Understand the structure and purpose of a Three-Process FSM.
- Separate sequential logic from combinational next-state and output logic.
- Design and implement FSMs using synthesizable Verilog RTL.
- Understand state register, next-state logic, and output logic organization.
- Compare Two-Process and Three-Process FSM coding styles.
- Develop dedicated Verilog testbenches for functional verification.
- Analyze RTL schematics and simulation waveforms.
- Understand coding practices used for clean, maintainable, and synthesizable FSM RTL.

---

## 📂 Module Contents

| Module | Core Technical Focus |
| :--- | :--- |
| **[01-Two-Process-FSM](./01-Two-Process-FSM/)** | Design and verification of an FSM using a Two-Process RTL pattern, separating sequential state-register logic from combinational next-state and output logic. |
| **[02-Three-Process-FSM](./02-Three-Process-FSM/)** | Design and verification of an FSM using a Three-Process RTL pattern, separating state-register, next-state, and output logic into dedicated processes. |

---

## 🌲 Directory Structure

06-FSM-RTL-Design-Patterns/
├── 01-Two-Process-FSM/
│   ├── two_process_fsm.v
│   ├── two_process_fsm _tb.v
│   ├── rtl-schematic.png
│   └── waveform.png
│
└── 02-Three-Process-FSM/
    ├── three_process_fsm.v
    ├── three_process_fsm _ tb.v
    ├── rtl-schematic.png
    └── waveform.png

---

## 🛠️ Core Concepts Covered

### 1. FSM RTL Design Patterns

Understand RTL design patterns as structured ways of organizing FSM logic in Verilog HDL.

A typical FSM contains three logical components:

**State Register → Next-State Logic → Output Logic**

Different RTL patterns determine how these components are divided into Verilog procedural blocks.

### 2. Two-Process FSM

Study the Two-Process FSM pattern, where the FSM is commonly divided into:

1. **Sequential Process** – stores the current state.
2. **Combinational Process** – calculates the next state and outputs.

The basic structure is:

**Process 1: Current State Register**

**Process 2: Next-State + Output Logic**

This approach keeps sequential and combinational behavior clearly separated while keeping related combinational logic together.

### 3. Three-Process FSM

Study the Three-Process FSM pattern, where the FSM is divided into three dedicated processes:

1. **State Register Process**
2. **Next-State Logic Process**
3. **Output Logic Process**

The structure is:

**State Register → Next-State Logic → Output Logic**

This approach provides a clear separation between the different functional components of an FSM and can make larger FSM designs easier to understand and maintain.

### 4. State Register Process

Understand the sequential process responsible for storing the current FSM state.

The state register normally updates on the active clock edge:

**Clock Edge → State Register → Current State**

The process may also include synchronous or asynchronous reset behavior depending on the FSM requirements.

### 5. Next-State Logic Process

Understand how combinational logic determines the next FSM state from:

- Current state
- Input signals
- Transition conditions

The general relationship is:

**Current State + Inputs → Next State**

The next-state process should completely define the next-state value for every valid condition.

### 6. Output Logic Process

Understand how FSM outputs are generated from the current state and, depending on the FSM architecture, input signals.

For a Moore-style output:

**Output = f(Current State)**

For a Mealy-style output:

**Output = f(Current State, Inputs)**

Separating output logic into its own process makes the FSM structure explicit and easier to analyze.

### 7. Combinational Logic Coding

Understand proper coding practices for combinational FSM processes.

Important concepts include:

- `always @(*)`
- Default assignments
- Complete assignments
- `case` statements
- Avoiding unintended latches
- Proper next-state initialization
- Proper output initialization

A common structure is:

**Default Assignment → Case Statement → State/Input-Based Logic**

### 8. Sequential Logic Coding

Understand proper coding practices for the state-register process.

Key concepts include:

- Clock sensitivity
- Reset behavior
- Non-blocking assignments
- State storage
- Synchronous state updates

Sequential state updates should generally use:

**Non-Blocking Assignment (`<=`)**

### 9. Two-Process vs Three-Process FSM

Compare the two common FSM coding patterns.

| Feature | Two-Process FSM | Three-Process FSM |
| :--- | :--- | :--- |
| State Register | Separate process | Separate process |
| Next-State Logic | Combined with output logic | Separate process |
| Output Logic | Combined with next-state logic | Separate process |
| Process Count | 2 | 3 |
| Code Organization | Compact | Highly separated |
| Debugging | Straightforward | Clear separation of responsibilities |
| Large FSMs | Can become more compact | Can improve readability and maintenance |

Both styles can describe the same synthesized hardware when coded correctly.

### 10. Reset Integration

Understand how reset is incorporated into FSM RTL.

Reset establishes the FSM in a known initial state.

The general behavior is:

**Reset → Initial State → Normal State Transitions**

FSM reset implementation may use:

- Synchronous reset
- Asynchronous reset

The selected reset style should match the design specification.

### 11. Verilog RTL Implementation

Implement Two-Process and Three-Process FSMs using synthesizable Verilog HDL.

Key concepts include:

- Module declaration
- State declarations
- `parameter` or `localparam`
- State register
- Next-state register
- Sequential `always` block
- Combinational `always @(*)` blocks
- `case` statements
- Reset logic
- Blocking assignments for combinational logic
- Non-blocking assignments for sequential logic
- Synthesizable RTL coding

### 12. Testbench Development

Develop dedicated testbenches to apply clock, reset, and input stimulus and verify correct FSM transitions and outputs.

The basic verification flow is:

**Test Stimulus → DUT → State Transition → Output Observation → Functional Verification**

The testbench should verify:

- Reset operation
- Initial state
- Valid state transitions
- Input-dependent transitions
- Output behavior
- Clocked state updates

### 13. Simulation and Waveform Analysis

Analyze simulation waveforms to verify the relationship between clock, inputs, states, and outputs.

The waveform analysis includes:

- Clock transitions
- Reset behavior
- Input transitions
- Current state
- Next-state behavior
- Output transitions
- State changes at clock edges

This establishes the connection between:

**RTL Code → Simulation → Waveform → Functional Behavior**

### 14. RTL Schematic Analysis

Analyze the generated RTL schematic to understand how the FSM coding pattern is translated into hardware.

The synthesized RTL structure generally contains:

**Flip-Flops + Combinational Logic**

Different Verilog coding patterns can describe equivalent hardware, so the RTL schematic helps verify that the intended hardware structure has been inferred.

### 15. RTL Coding Best Practices

Understand coding practices that improve FSM reliability and maintainability.

Important practices include:

- Clearly define FSM states.
- Separate sequential and combinational logic.
- Use appropriate assignment operators.
- Provide default assignments in combinational processes.
- Avoid incomplete combinational assignments.
- Handle illegal or unexpected states where appropriate.
- Keep state-transition logic readable.
- Use meaningful state names.
- Verify reset and transition behavior through simulation.

### 16. Applications of FSM RTL Patterns

Understand how these RTL design patterns are applied in practical digital systems such as:

- UART controllers
- SPI controllers
- I2C controllers
- Bus protocols
- Memory controllers
- Processor control units
- Communication interfaces
- DMA controllers
- Peripheral controllers
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
