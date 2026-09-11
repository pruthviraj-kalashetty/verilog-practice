# ◈ RTL FSM

[![Stage](https://img.shields.io/badge/Stage-Control_Logic-blue.svg?style=flat-square)](#)
[![Focus](https://img.shields.io/badge/Focus-FSM_Architecture_&_Coding-orange.svg?style=flat-square)](#)
[![Simulation](https://img.shields.io/badge/Simulator-AMD_Vivado-red.svg?style=flat-square&logo=xilinx)](#)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=flat-square)](#)

This module provides an in-depth architectural breakdown, hardware analysis, and synthesizable Verilog HDL implementation of FSM Reset and Initialization Strategies. Establishing deterministic starting states is vital for hardware stability, power-on safety, predictable simulation state machines, and preventing uninitialized logic states (X-propagation).

The module contrasts Synchronous Reset and Asynchronous Reset paradigms, evaluating their impact on clock tree synthesis (CTS), flip-flop control input mapping, recovery/removal static timing analysis (STA), and noise-glitch sensitivity across ASIC and FPGA targets.

---

## ⚡ Comprehensive FSM Architecture & Encoding Matrix

| FSM Parameter / Topology | Primary Characteristic | Hardware Realization | Timing & Critical Path | Best Use-Case |
| :--- | :--- | :--- | :--- | :--- |
| **Moore Architecture** | Output = $f(\text{Current State})$ | Decoupled output logic from inputs | Clean output timing; registered or glitchless | Protocol control, deterministic state flags |
| **Mealy Architecture** | Output = $f(\text{Current State}, \text{Inputs})$ | Input-to-output combinational feedthrough | 0-cycle response; susceptible to input glitches | High-speed handshakes, sequence detectors |
| **Binary Encoding** | Dense binary assignment | $\lceil\log_2 N\rceil$ flip-flops | Higher logic depth for next-state decode | Minimal area requirements, dense ASIC blocks |
| **One-Hot Encoding** | Single bit high per state | $N$ flip-flops | Minimal decode logic depth; maximum $f_{\max}$ | FPGA architectures, timing-critical FSMs |
| **Gray Encoding** | 1-bit Hamming distance | $\lceil\log_2 N\rceil$ flip-flops | Reduced simultaneous bit toggles | Low-power design, asynchronous boundaries |
| **2-Process Pattern** | Sequential state + Combined Comb logic | Flip-flops + Shared combinational block | Compact RTL structure | Simple state machines, counters |
| **3-Process Pattern** | State + Next-State + Output processes | Modular, decoupled logic blocks | Simplified STA, zero hazard risk | Complex protocol engines, large control units |

---

## 🎯 Learning Objectives

By working through this module, you will be able to:

- Understand the fundamental architecture and operation of Finite State Machines.
- Understand states, next states, state transitions, and state-transition tables.
- Translate FSM state diagrams into synthesizable Verilog RTL.
- Understand the fundamental structure of an FSM implementation.
- Design and implement Moore FSMs.
- Design and implement Mealy FSMs.
- Understand the differences between Moore and Mealy FSM architectures.
- Design and implement overlapping and non-overlapping sequence detectors.
- Understand Binary, One-Hot, and Gray state encoding techniques.
- Compare different FSM state encoding approaches.
- Implement FSMs using Two-Process and Three-Process RTL design patterns.
- Understand synchronous and asynchronous reset techniques for FSMs.
- Develop dedicated Verilog testbenches for functional verification.
- Analyze RTL schematics and simulation waveforms.
- Apply clean, structured, and synthesizable FSM coding practices.
- Understand FSM design considerations relevant to ASIC and FPGA development.

---

## 📂 Module Contents

| Module | Core Technical Focus |
| :--- | :--- |
| **[01-FSM-Fundamentals](./01-FSM-Fundamentals/)** | Covers FSM fundamentals including state and next-state concepts, state diagrams, state-transition tables, and the basic Verilog RTL structure of an FSM. |
| **[02-Moore-FSM](./02-Moore-FSM/)** | Design and verification of a Moore FSM, where outputs depend only on the current state. |
| **[03-Mealy-FSM](./03-Mealy-FSM/)** | Design and verification of a Mealy FSM, where outputs depend on the current state and input conditions. |
| **[04-Sequence-detector](./04-Sequence-detector/)** | Design and verification of overlapping and non-overlapping sequence detectors using FSM-based RTL. |
| **[05-State-Encoding](./05-State-Encoding/)** | Study and implementation of Binary, One-Hot, and Gray state encoding techniques used for FSM state representation. |
| **[06-FSM-RTL-Design-Patterns](./06-FSM-RTL-Design-Patterns/)** | Study of Two-Process and Three-Process FSM RTL coding patterns for structured and maintainable FSM implementation. |
| **[07-FSM-Reset-and-Initialization](./07-FSM-Reset-and-Initialization/)** | Study and implementation of synchronous and asynchronous reset techniques for reliable FSM initialization and operation. |

---

## 🌲 Directory Structure
```
12-RTL-FSM/
├── 01-FSM-Fundamentals/
│   ├── 01-State-and-Next-State/
│   ├── 02-State-Diagram-to-RTL/
│   ├── 03-State-Transition-Table/
│   └── 04-FSM-Verilog-Structure/
│
├── 02-Moore-FSM/
│   ├── moore_fsm.v
│   ├── moore_fsm_tb.v
│   ├── rtl-schematic.png
│   └── waveform.png
│
├── 03-Mealy-FSM/
│   ├── moore_fsm.v
│   ├── moore_fsm_tb.v
│   ├── rtl-schematic.png
│   └── waveform.png
│
├── 04-Sequence-detector/
│   ├── 01-Sequence-Detector-1011-overlapping/
│   │   ├── sequence_detector_1011_overlap.v
│   │   ├── sequence_detector_1011_overlap_tb.v
│   │   ├── rtl-schematic.png
│   │   └── waveform.png
│   │
│   └── 02-Sequence-Detector-1101-non-overlapping/
│       ├── sequence_detector_1011_non_overlap.v
│       ├── sequence_detector_1011_non_overlap_tb.v
│       ├── rtl-schematic.png
│       └── waveform.png
│
├── 05-State-Encoding/
│   ├── 01-Binary-Encoding/
│   │   ├── binary_encoding.v
│   │   ├── binary_encoding_tb.v
│   │   ├── rtl-schematic.png
│   │   └── waveform.png
│   │
│   ├── 02-One-Hot-Encoding/
│   │   ├── one_hot_encoding.v
│   │   ├── one_hot_encoding_tb.v
│   │   ├── rtl-schematic.png
│   │   └── waveform.png
│   │
│   └── 03-Gray-Encoding/
│       ├── gray_encoding.v
│       ├── gray_encoding _tb.v
│       ├── rtl-schematic.png
│       └── waveform.png
│
├── 06-FSM-RTL-Design-Patterns/
│   ├── 01-Two-Process-FSM/
│   │   ├── two_process_fsm.v
│   │   ├── two_process_fsm _tb.v
│   │   ├── rtl-schematic.png
│   │   └── waveform.png
│   │
│   └── 02-Three-Process-FSM/
│       ├── three_process_fsm.v
│       ├── three_process_fsm _ tb.v
│       ├── rtl-schematic.png
│       └── waveform.png
│
└── 07-FSM-Reset-and-Initialization/
    ├── 01-Synchronous-Reset/
    │   ├── two_process_fsm.v
    │   ├── two_process_fsm _tb.v
    │   ├── rtl-schematic.png
    │   └── waveform.png
    │
    └── 02-Asynchronous-Reset/
        ├── three_process_fsm.v
        ├── three_process_fsm _tb.v
        ├── rtl-schematic.png
        └── waveform.png
```
---

## 🛠️ Core Concepts Covered

### 1. FSM Fundamentals

Understand a Finite State Machine as a sequential digital system that operates through a defined set of states and changes between those states according to clock and input conditions.

The basic FSM relationship is:

**Current State + Inputs → Next State → Outputs**

FSMs are widely used to implement control-oriented behavior in digital systems.

### 2. State and Next State

Understand the difference between the current state and the next state.

- **Current State** – the state currently stored in the state register.
- **Next State** – the state that the FSM will enter after the next active clock edge.

The basic relationship is:

**Current State → Next-State Logic → Next State**

### 3. State Diagram

Understand how an FSM specification can be represented graphically using states and transitions.

A state diagram contains:

- State nodes
- Transition arrows
- Input conditions
- Output information
- Initial/reset state

The state diagram provides a high-level representation before the design is translated into RTL.

### 4. State-Transition Table

Understand how state diagrams can be converted into state-transition tables.

A typical transition table contains:

| Current State | Input | Next State | Output |
| :--- | :--- | :--- | :--- |
| State A | 0 | State A | Output |
| State A | 1 | State B | Output |
| State B | 0 | State A | Output |
| State B | 1 | State B | Output |

The transition table provides a systematic representation of FSM behavior for RTL implementation and verification.

### 5. FSM Verilog Structure

Understand the basic RTL structure required to implement an FSM.

The major components are:

**State Register + Next-State Logic + Output Logic**

The state register stores the current state, while combinational logic determines the next state and output behavior.

### 6. Moore FSM

Study the Moore FSM architecture, where the output depends only on the current state.

The relationship is:

**Output = f(Current State)**

Moore FSMs generally produce outputs associated with states and are useful when predictable state-based output behavior is required.

### 7. Mealy FSM

Study the Mealy FSM architecture, where the output depends on both the current state and input.

The relationship is:

**Output = f(Current State, Inputs)**

Mealy FSMs can respond to input conditions without requiring a transition into another state, which can reduce the number of states in some designs.

### 8. Moore vs Mealy FSM

Compare the two major FSM architectures.

| Feature | Moore FSM | Mealy FSM |
| :--- | :--- | :--- |
| Output depends on | Current state | Current state + inputs |
| Output changes | Typically with state changes | Can respond to input changes |
| State count | May require more states | May require fewer states |
| Output timing | More predictable | Potentially faster response |
| Output logic | State dependent | State and input dependent |

The appropriate architecture depends on the functional and timing requirements of the design.

### 9. Sequence Detector

Understand sequence detectors as FSM-based circuits that identify a specific sequence of input bits.

For example:

**Input Sequence → FSM State Transitions → Detection Output**

Sequence detectors provide practical experience in state design, transition logic, output generation, and overlapping/non-overlapping behavior.

### 10. Overlapping Sequence Detection

Understand overlapping sequence detection, where a portion of a previously detected sequence can also become the beginning of the next sequence.

This requires carefully designed state transitions so that useful partial matches are retained.

### 11. Non-Overlapping Sequence Detection

Understand non-overlapping sequence detection, where the FSM restarts the detection process after successfully detecting the target sequence.

This provides practical experience in designing different sequence-detection behaviors using state transitions.

### 12. State Encoding

Understand state encoding as the process of assigning binary representations to symbolic FSM states.

The major encoding techniques covered are:

- Binary Encoding
- One-Hot Encoding
- Gray Encoding

State encoding influences state-register size, decoding logic, switching activity, and implementation characteristics.

### 13. Binary Encoding

Study binary encoding, where an FSM with **N states** generally requires:

**⌈log₂(N)⌉ flip-flops**

Binary encoding provides a compact representation of FSM states and can be useful when reducing state-storage requirements is important.

### 14. One-Hot Encoding

Study one-hot encoding, where each state is represented using a dedicated flip-flop.

For an FSM with **N states**, one-hot encoding generally uses:

**N flip-flops**

Only one state bit is normally asserted at a time.

One-hot encoding can simplify state decoding and is particularly common in FPGA-oriented FSM implementations.

### 15. Gray Encoding

Study Gray encoding, where adjacent states are assigned codes that differ by only one bit.

Gray encoding can reduce the number of simultaneous state-bit transitions for suitable state-transition sequences and can therefore help reduce switching activity in appropriate designs.

### 16. FSM RTL Design Patterns

Understand structured RTL coding patterns used to implement FSMs.

The module covers:

- Two-Process FSM
- Three-Process FSM
- State-register process
- Next-state process
- Output-logic process

These patterns provide consistent ways to organize sequential and combinational FSM logic.

### 17. Two-Process FSM

Understand the Two-Process FSM structure:

**Process 1 → State Register**

**Process 2 → Next-State + Output Logic**

This approach separates sequential logic from combinational logic while keeping next-state and output logic together.

### 18. Three-Process FSM

Understand the Three-Process FSM structure:

**Process 1 → State Register**

**Process 2 → Next-State Logic**

**Process 3 → Output Logic**

This approach provides a clear separation of FSM responsibilities and can improve readability and maintainability for larger designs.

### 19. FSM Reset and Initialization

Understand how reset places an FSM into a known initial state.

The basic sequence is:

**Reset → Initial State → Reset Release → Normal FSM Operation**

A well-defined reset state prevents the FSM from starting in an unknown or invalid state.

### 20. Synchronous FSM Reset

Study synchronous reset, where the reset condition is evaluated on the active clock edge.

The general behavior is:

**Reset + Active Clock Edge → Reset State**

The FSM does not immediately change state when reset changes between clock edges.

### 21. Asynchronous FSM Reset

Study asynchronous reset, where the state register responds to reset independently of the clock.

The general behavior is:

**Reset Asserted → Immediate Reset State**

This allows the FSM to enter its reset state without waiting for a clock edge.

### 22. FSM Verification

Develop dedicated testbenches to verify FSM functionality.

Verification should cover:

- Reset behavior
- Initial state
- State transitions
- Input combinations
- Output behavior
- Moore and Mealy behavior
- Sequence detection
- Encoding behavior
- Clock interaction

The basic verification flow is:

**Test Stimulus → DUT → State Transition → Output Observation → Functional Verification**

### 23. Simulation and Waveform Analysis

Analyze simulation waveforms to verify the relationship between clock, reset, inputs, states, and outputs.

The waveform analysis includes:

- Clock transitions
- Reset assertion and release
- Input transitions
- Current-state changes
- Next-state behavior
- Output transitions
- Sequence detection
- State encoding transitions

This establishes the connection between:

**RTL Code → Simulation → Waveform → Functional Behavior**

### 24. RTL Schematic Analysis

Analyze generated RTL schematics to understand how FSM descriptions are translated into hardware structures.

The general hardware representation is:

**State Flip-Flops + Combinational Next-State Logic + Output Logic**

RTL schematic analysis helps connect the Verilog description to the inferred digital hardware.

### 25. FSM RTL Coding Best Practices

Understand coding practices for reliable and maintainable FSM RTL.

Important practices include:

- Clearly define FSM states.
- Use meaningful state names.
- Separate sequential and combinational logic.
- Use non-blocking assignments for sequential logic.
- Use blocking assignments for combinational logic.
- Provide default assignments in combinational processes.
- Avoid unintended latch inference.
- Define reset behavior clearly.
- Handle unexpected or illegal states where appropriate.
- Verify all important state transitions through simulation.

### 26. ASIC and FPGA Considerations

Understand how FSM implementation can differ depending on the target technology.

Important considerations include:

- State encoding
- Flip-flop utilization
- Combinational logic
- Timing performance
- Area
- Power and switching activity
- Synthesis optimization
- Reset implementation
- Technology-specific resources

The final implementation should be evaluated using synthesis and timing results rather than assuming that one encoding or coding pattern is always optimal.

### 27. Applications of RTL FSMs

Understand the use of FSMs in practical digital systems such as:

- UART controllers
- SPI controllers
- I2C controllers
- Communication protocols
- Bus controllers
- Memory controllers
- DMA controllers
- Processor control units
- Peripheral controllers
- Sequence detectors
- Control sequencers
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
