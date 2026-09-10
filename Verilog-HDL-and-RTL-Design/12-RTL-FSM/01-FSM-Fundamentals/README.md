# ◈ Finite State Machine (FSM) Fundamentals

[![Stage](https://img.shields.io/badge/Stage-Control_Logic-blue.svg?style=flat-square)](#)
[![Focus](https://img.shields.io/badge/Focus-FSM_Architecture_&_Coding-orange.svg?style=flat-square)](#)
[![Simulation](https://img.shields.io/badge/Simulator-AMD_Vivado-red.svg?style=flat-square&logo=xilinx)](#)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=flat-square)](#)

This module explores the core principles, architectural partition, and synthesizable Verilog HDL implementation of **Finite State Machines (FSMs)**. FSMs are the primary sequential control block in digital systems, responsible for executing structured algorithms, managing communication protocols, controlling CPU datapaths, and driving complex state-dependent control logic.

The module details the translation of behavioral specifications and state transition diagrams into robust RTL using standardized coding templates, state encoding styles, and proper separation of combinational next-state/output logic from sequential state memory.

---

## ⚡ Architectural Comparison Matrix

| Feature / Metric | Moore FSM Architecture | Mealy FSM Architecture |
| :--- | :--- | :--- |
| **Output Dependence** | Output $= f(\text{Current State})$ | Output $= f(\text{Current State}, \text{Inputs})$ |
| **Glitch Susceptibility** | High immunity (outputs change synchronously at clock edge) | Higher risk (input glitches directly propagate to outputs) |
| **State Count Requirement** | Frequently requires more states for complex sequences | Typically requires fewer states than an equivalent Moore FSM |
| **Response Latency** | 1-cycle latency (outputs lag state transition) | Instantaneous output response to input changes within same cycle |
| **Synthesis & Timing Impact** | Clean output timing paths; easy setup/hold closure | Combinational path through FSM can create long critical paths |
| **Primary Use Cases** | Control units, bus arbiters, glitch-sensitive handshakes | High-speed sequence detection, protocol framing, low-latency control |

---

## 🎯 Learning Objectives

By working through this module, you will be able to:

- Understand the fundamental concept of a Finite State Machine (FSM).
- Understand the relationship between current state, inputs, next state, and outputs.
- Understand how FSMs represent sequential control behavior.
- Distinguish between current state and next state.
- Analyze and construct state diagrams.
- Convert state diagrams into synthesizable RTL.
- Construct and analyze state transition tables.
- Understand the basic structure of an FSM in Verilog HDL.
- Understand the separation of state memory, next-state logic, and output logic.
- Develop a systematic approach to FSM design.
- Analyze RTL schematics and simulation behavior of FSMs.
- Build a foundation for designing Mealy and Moore FSMs.

---

## 📂 Module Contents

| Module | Core Technical Focus |
| :--- | :--- |
| **[01-State-and-Next-State](./01-State-and-Next-State.md/)** | Understand current-state and next-state concepts and how sequential state transitions occur in an FSM. |
| **[02-State-Diagram-to-RTL](./02-State-Diagram-to-RTL.md/)** | Learn how to translate an FSM state diagram into a synthesizable Verilog RTL implementation. |
| **[03-State-Transition-Table](./03-State-Transition-Table.md/)** | Construct and analyze state transition tables describing FSM state changes for different input conditions. |
| **[04-FSM-Verilog-Structure](./04-FSM-Verilog-Structure.md/)** | Understand the standard Verilog RTL structure used to implement FSM state memory, next-state logic, and output logic. |

---

## 🌲 Directory Structure
```
01-FSM-Fundamentals/
├── 01-State-and-Next-State.md
│
├── 02-State-Diagram-to-RTL.md
│
├── 03-State-Transition-Table.md
│
└── 04-FSM-Verilog-Structure.md
```
---

## 🛠️ Core Concepts Covered

### 1. Finite State Machine Fundamentals

Understand a Finite State Machine (FSM) as a sequential digital system that operates through a finite number of defined states according to clock events and input conditions.

The basic relationship is:

**Current State + Input → Next State + Output**

FSMs are widely used to implement control logic in digital systems.

### 2. State

Understand a **state** as the stored condition or mode of operation of an FSM at a particular point in time.

The state is stored using sequential storage elements such as flip-flops.

Examples of states can represent:

- IDLE
- START
- WAIT
- ACTIVE
- DONE

### 3. Current State

Understand the **current state** as the state in which the FSM is presently operating.

The current state is stored in the state register and remains stable between active clock edges.

The basic concept is:

**State Register → Current State**

### 4. Next State

Understand the **next state** as the state that the FSM will enter after the next active clock edge.

The next state is determined by:

**Current State + Input Conditions → Next State**

The next-state logic is typically implemented using combinational logic.

### 5. State Transition

Understand a **state transition** as the movement of an FSM from one state to another based on the current state and input conditions.

The basic sequence is:

**Current State → Input Evaluation → Next State → Clock Edge → New Current State**

### 6. State Diagram

Understand a state diagram as a graphical representation of an FSM.

A state diagram normally contains:

- State nodes
- Transition arrows
- Input conditions
- Output conditions where applicable
- Initial or reset state

The diagram provides a high-level representation of the FSM behavior before RTL implementation.

### 7. State Transition Table

Understand a state transition table as a tabular representation of FSM behavior.

A typical transition table contains:

| Current State | Input | Next State | Output |
| :--- | :--- | :--- | :--- |
| State A | 0 | State A | 0 |
| State A | 1 | State B | 0 |
| State B | 0 | State A | 1 |
| State B | 1 | State B | 1 |

The table provides a systematic method for converting FSM behavior into RTL logic.

### 8. State Diagram to RTL

Learn how to convert an FSM specification into synthesizable Verilog RTL.

The general design flow is:

**Specification → State Diagram → State Transition Table → RTL → Simulation**

This process establishes a clear connection between the intended FSM behavior and its hardware implementation.

### 9. FSM RTL Architecture

Understand the fundamental hardware structure of an FSM.

The standard architecture consists of:

**Inputs → Next-State Logic → State Register → Current State**

and:

**Current State + Inputs → Output Logic → Outputs**

The state register provides the sequential storage, while next-state and output logic are generally combinational.

### 10. State Register

Understand the state register as the sequential portion of the FSM that stores the current state.

The state register is controlled by the clock and normally includes reset behavior.

The basic relationship is:

**Next State → Clock Edge → State Register → Current State**

### 11. Next-State Logic

Understand next-state logic as combinational logic that determines which state the FSM should enter based on the current state and input conditions.

The basic relationship is:

**Current State + Inputs → Next-State Logic → Next State**

### 12. Output Logic

Understand output logic as the logic responsible for generating FSM outputs.

Depending on the FSM architecture, outputs may depend on:

- Current state only
- Current state and inputs

This leads to the two major FSM models:

- Moore FSM
- Mealy FSM

### 13. Moore and Mealy Foundation

Establish the conceptual foundation for the two primary FSM architectures.

**Moore FSM:**

**Output = f(Current State)**

**Mealy FSM:**

**Output = f(Current State, Input)**

Detailed Moore and Mealy implementations can be developed after completing the FSM fundamentals.

### 14. Verilog FSM Structure

Understand the standard Verilog organization used for FSM implementation.

A typical FSM RTL design separates the functionality into:

- State declaration
- State register
- Next-state logic
- Output logic

This separation improves readability, debugging, verification, and maintainability of the RTL.

### 15. State Encoding

Understand how symbolic FSM states are represented internally as binary values.

Common state encoding approaches include:

- Binary encoding
- One-hot encoding
- Gray encoding

The selected encoding affects the resulting hardware implementation and may influence area, timing, and power characteristics.

### 16. Reset and Initial State

Understand the role of reset in establishing a known FSM starting state.

A reset condition typically forces the FSM into a defined state such as:

**RESET → IDLE**

This ensures predictable operation when the hardware starts or is reinitialized.

### 17. FSM Design Flow

Understand the systematic process used to design an FSM.

The fundamental flow is:

**Behavioral Requirement**
↓
**Identify States**
↓
**Draw State Diagram**
↓
**Create State Transition Table**
↓
**Define State Encoding**
↓
**Write RTL**
↓
**Simulate & Verify**
↓
**Analyze RTL Hardware**

### 18. Testbench and Verification Foundation

Understand how FSM behavior can be verified by applying different input sequences and observing state and output transitions.

The basic verification flow is:

**Test Stimulus → FSM DUT → State Transition → Output Observation → Functional Verification**

Important verification scenarios include:

- Reset behavior
- Valid state transitions
- Different input combinations
- State coverage
- Transition coverage
- Output behavior
- Unexpected input conditions

### 19. RTL Schematic Analysis

Analyze the generated RTL schematic to understand how the FSM description is represented as hardware.

This establishes the connection between:

**FSM Specification → Verilog RTL → State Register + Logic → Hardware**

### 20. Applications of FSMs

Understand the use of FSMs in digital systems such as:

- Control units
- Protocol controllers
- Sequence detectors
- Communication interfaces
- Bus controllers
- Memory controllers
- CPU control logic
- Traffic-light controllers
- Handshake controllers
- Peripheral controllers
- FPGA and ASIC designs

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
