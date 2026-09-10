# ◈ Sequence Detectors

[![Stage](https://img.shields.io/badge/Stage-Pattern_Detection-blue.svg?style=flat-square)](#)
[![Focus](https://img.shields.io/badge/Focus-Overlapping_vs_Non--Overlapping-orange.svg?style=flat-square)](#)
[![Simulation](https://img.shields.io/badge/Simulator-AMD_Vivado-red.svg?style=flat-square&logo=xilinx)](#)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=flat-square)](#)

This module explores the design, state-machine formulation, and synthesizable Verilog HDL implementation of serial **Sequence Detectors**. Sequence detectors are core control primitives used across digital communications, packet framing, hardware handshakes, pattern matching, and protocol controllers to continuously monitor serial bitstreams and identify target bit sequences.

The module details both **overlapping** and **non-overlapping** detection mechanisms, comparing Mealy and Moore state-machine topologies through clean RTL code, comprehensive testbenches, synthesis schematics, and simulation waveforms.

---

## ⚡ Architectural Comparison Matrix

| Property / Feature | Overlapping Detection | Non-Overlapping Detection |
| :--- | :--- | :--- |
| **Bit Reuse Strategy** | Shares overlapping prefix/suffix bits with previous detection | Discards all bits of detected sequence; restarts search |
| **Target Example (`1011`)** | Input `1011011` yields **2 pulses** (at bit index 3 and 6) | Input `1011011` yields **1 pulse** (at bit index 3) |
| **Reset/Fallback State** | Fallbacks preserve valid sequence prefixes (e.g., $S_{101} \to S_{10}$ on `0`) | Complete sequence match forces state machine to $S_{\text{RESET}}$ |
| **Mealy State Count** | Requires $N$ states for sequence of length $N$ | Requires $N$ states for sequence of length $N$ |
| **Moore State Count** | Requires $N+1$ states for sequence of length $N$ | Requires $N+1$ states for sequence of length $N$ |
| **Primary Applications** | Framing sync, continuous pattern monitoring, error tracking | Fixed packet length boundary parsing, non-repetitive triggers |

---
## 🎯 Learning Objectives

By working through this module, you will be able to:

- Understand the fundamental operation of sequence detectors.
- Understand how FSMs are used to detect specific binary sequences.
- Understand overlapping and non-overlapping sequence detection.
- Design and implement a 1011 overlapping sequence detector.
- Design and implement a 1101 non-overlapping sequence detector.
- Analyze state diagrams and state transition behavior for sequence detection.
- Understand how input bits cause FSM state transitions.
- Understand how the detection output is generated.
- Write synthesizable Verilog RTL for FSM-based sequence detectors.
- Develop dedicated Verilog testbenches for functional verification.
- Analyze RTL schematics and simulation waveforms.
- Understand the practical applications of sequence detectors in digital systems.

---

## 📂 Module Contents

| Module | Core Technical Focus |
| :--- | :--- |
| **[01-Sequence-Detector-1011-Overlapping](./01-Sequence-Detector-1011-Overlapping/)** | Design and verification of an FSM-based overlapping sequence detector for detecting the binary pattern 1011. |
| **[02-Sequence-Detector-1101-Non-Overlapping](./02-Sequence-Detector-1011-Non-Overlapping/)** | Design and verification of an FSM-based non-overlapping sequence detector for detecting a specified binary pattern. |

---

## 🌲 Directory Structure
```
04-Sequence-detector/
├── 01-Sequence-Detector-1011-Overlapping/
│   ├── sequence_detector_1011_overlap.v
│   ├── sequence_detector_1011_overlap_tb.v
│   ├── rtl-schematic.png
│   └── waveform.png
│
└── 02-Sequence-Detector-1011-Non-Overlapping/
    ├── sequence_detector_1011_non_overlap.v
    ├── sequence_detector_1011_non_overlap_tb.v
    ├── rtl-schematic.png
    └── waveform.png
```
---

## 🛠️ Core Concepts Covered

### 1. Sequence Detector Fundamentals

Understand a sequence detector as a sequential digital circuit that monitors a serial stream of input bits and generates an output when a predefined binary pattern is detected.

The basic relationship is:

**Serial Input → FSM State Transitions → Pattern Detection → Output**

Sequence detectors are commonly implemented using Finite State Machines.

### 2. FSM-Based Sequence Detection

Understand how an FSM can remember previously received input bits through its current state.

For a sequence such as **1011**, the FSM progresses through states representing how much of the target pattern has been matched.

The basic concept is:

**Input Bit → State Evaluation → Next State → Pattern Progress**

### 3. State Representation

Understand how each FSM state represents the progress of matching the required sequence.

For example, while detecting **1011**, states may represent:

- No matching bits
- `1` detected
- `10` detected
- `101` detected
- `1011` detected

The exact state encoding is determined during RTL implementation.

### 4. Overlapping Sequence Detection

Understand overlapping detection as the ability to detect a new occurrence of the target sequence even when it shares input bits with the previous detected sequence.

For example, the sequence:

**1011011**

contains overlapping occurrences of **1011**.

After detecting the first occurrence, the FSM does not necessarily return to the initial state. Instead, it can retain useful matching information and continue searching.

### 5. 1011 Overlapping Sequence Detector

Study the design of an FSM that detects the binary pattern:

**1011**

The detector examines one input bit at a time and transitions through states according to the received pattern.

A successful detection occurs when:

**1 → 0 → 1 → 1**

The detection output is asserted when the complete sequence has been recognized.

### 6. Non-Overlapping Sequence Detection

Understand non-overlapping detection as a sequence-detection method in which, after detecting the required pattern, the FSM restarts the search without reusing the detected sequence's bits for another match.

The basic behavior is:

**Pattern Detected → Detection Output → Restart Search**

This prevents detected patterns from sharing bits with subsequent detections.

### 7. 1101 Non-Overlapping Sequence Detector

Study the design of an FSM-based non-overlapping sequence detector for the binary pattern specified by the module.

The detector processes the serial input one bit at a time and generates a detection output when the complete target sequence has been received.

After successful detection, the FSM returns to the appropriate starting state to begin searching for the next non-overlapping occurrence.

### 8. State Diagram

Understand how a state diagram represents the sequence detector's behavior.

A sequence detector state diagram contains:

- FSM states
- Input conditions
- State transition arrows
- Detection output
- Reset state

The state diagram provides the behavioral specification before RTL coding.

### 9. State Transition Table

Understand how the state transition table systematically describes the detector's behavior.

A typical sequence detector transition table contains:

| Current State | Input | Next State | Output |
| :--- | :--- | :--- | :--- |
| State A | 0 | State A | 0 |
| State A | 1 | State B | 0 |
| State B | 0 | State C | 0 |
| State B | 1 | State B | 0 |

The complete table is derived from the required sequence and FSM architecture.

### 10. Detection Output

Understand how the detection output indicates that the target sequence has been successfully received.

For a typical FSM-based detector:

**Sequence Match → Detection Output = 1**

Otherwise:

**Sequence Not Matched → Detection Output = 0**

Depending on the FSM architecture, the output may be generated from the current state alone or from the current state and input.

### 11. Mealy and Moore Sequence Detectors

Understand that sequence detectors can be implemented using either Mealy or Moore FSM architectures.

**Mealy FSM:**

**Output = f(Current State, Input)**

**Moore FSM:**

**Output = f(Current State)**

Mealy implementations can assert detection immediately based on the final input bit, while Moore implementations generally represent the detection condition using a dedicated state.

### 12. Verilog RTL Implementation

Implement FSM-based sequence detectors using synthesizable Verilog HDL.

Key concepts include:

- Module declaration
- State declaration
- State encoding
- State register
- Next-state logic
- Output logic
- Clock input
- Reset logic
- `always` blocks
- Non-blocking assignments
- Case statements
- Synthesizable RTL coding

### 13. Testbench Development

Develop dedicated testbenches to apply serial input patterns and verify whether the sequence detector produces the expected detection output.

The basic verification flow is:

**Serial Test Stimulus → Sequence Detector DUT → FSM State Transitions → Detection Output → Functional Verification**

Testbenches should include:

- Reset testing
- Correct sequence testing
- Incorrect sequence testing
- Repeated sequence testing
- Overlapping sequence testing
- Non-overlapping sequence testing
- Partial sequence testing

### 14. Simulation and Waveform Analysis

Analyze simulation waveforms to verify that the FSM correctly processes each input bit and produces the expected detection pulse.

The waveform analysis includes:

- Clock transitions
- Reset operation
- Serial input sequence
- FSM state transitions
- Detection output
- Overlapping matches
- Non-overlapping matches
- Functional verification

### 15. RTL Schematic Analysis

Analyze the generated RTL schematic to understand how the FSM-based sequence detector is represented as hardware.

This establishes the connection between:

**Sequence Specification → FSM → Verilog RTL → State Register + Logic → Hardware**

### 16. Sequence Detection Design Flow

Understand the systematic design process for creating a sequence detector.

The fundamental flow is:

**Required Sequence**
↓
**Identify FSM States**
↓
**Draw State Diagram**
↓
**Create State Transition Table**
↓
**Choose Mealy/Moore Architecture**
↓
**Define State Encoding**
↓
**Write RTL**
↓
**Develop Testbench**
↓
**Simulate & Verify**

### 17. Applications of Sequence Detectors

Understand the use of sequence detectors in digital systems such as:

- Communication protocols
- Serial data monitoring
- Pattern recognition
- Protocol controllers
- Error detection
- Digital control systems
- Data stream monitoring
- Security and access-control logic
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
