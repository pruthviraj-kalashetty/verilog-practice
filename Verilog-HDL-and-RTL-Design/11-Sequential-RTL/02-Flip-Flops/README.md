# ◈ Flip-Flops

[![Stage](https://img.shields.io/badge/Stage-Sequential_RTL_Design-blue.svg?style=flat-square)](#)
[![Focus](https://img.shields.io/badge/Focus-Verilog_Latches_&_Storage-orange.svg?style=flat-square)](#)
[![Simulation](https://img.shields.io/badge/Simulator-AMD_Vivado-red.svg?style=flat-square&logo=xilinx)](#)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=flat-square)](#)

This module explores fundamental edge-triggered flip-flop storage elements and their synthesizable Verilog HDL implementations. It covers D, JK, SR, and T flip-flops alongside dedicated self-checking testbenches, post-synthesis RTL schematics, and simulation timing waveforms in AMD Vivado.

Mastering edge-triggered storage, clock-domain dynamics, and non-blocking assignments (`<=`) forms the essential foundation for building pipeline registers, counters, shift registers, and Finite State Machines (FSMs).

---

## ⚡ Flip-Flop Operation & Characteristic Reference

| Flip-Flop Type | Inputs | Characteristic Equation $Q_{next}$ | Primary Operations | Key Application |
| :--- | :--- | :--- | :--- | :--- |
| **D Flip-Flop** | $D$ | $Q_{next} = D$ | Data Capture, Hold | Registers, Pipelines, Delay Elements |
| **JK Flip-Flop**| $J, K$ | $Q_{next} = J\bar{Q} + \bar{K}Q$ | Hold, Reset, Set, Toggle | Universal Counters, Control Logic |
| **SR Flip-Flop**| $S, R$ | $Q_{next} = S + \bar{R}Q$ *(where $S \cdot R = 0$)* | Hold, Reset, Set, Invalid ($S=R=1$) | Basic Memory, Latch Conversion |
| **T Flip-Flop** | $T$ | $Q_{next} = T \oplus Q$ | Hold, Toggle | Synchronous Counters, Frequency Dividers |

---

## 🎯 Learning Objectives

By working through this module, you will be able to:

- Understand the fundamental operation of flip-flops.
- Understand flip-flops as edge-triggered sequential storage elements.
- Understand the role of the clock in sequential RTL design.
- Design and implement D, JK, SR, and T flip-flops.
- Analyze flip-flop truth tables and state transitions.
- Understand Set, Reset, Hold, and Toggle operations.
- Understand positive-edge and negative-edge triggered behavior.
- Write synthesizable Verilog RTL for sequential circuits.
- Develop dedicated Verilog testbenches for functional verification.
- Generate and analyze clock signals in simulation.
- Analyze RTL schematics and simulation waveforms.
- Understand the relationship between Verilog RTL and sequential hardware.
- Build a strong foundation for registers, counters, FSMs, FIFOs, and advanced RTL IP development.

---

## 📂 Module Contents

| Module | Core Technical Focus |
| :--- | :--- |
| **[01-D-Flip-Flop](./01-D-Flip-Flop/)** | Design and verification of a D Flip-Flop for storing a single bit of data and transferring the input to the output at the active clock edge. |
| **[02-JK-Flip-Flop](./02-JK-Flip-Flop/)** | Design and verification of a JK Flip-Flop supporting Hold, Reset, Set, and Toggle operations based on J and K inputs. |
| **[03-SR-Flip-Flop](./03-SR-Flip-Flop/)** | Design and verification of an SR Flip-Flop supporting Set, Reset, Hold, and invalid input conditions under clock control. |
| **[04-T-Flip-Flop](./04-T-Flip-Flop/)** | Design and verification of a T Flip-Flop supporting Hold and Toggle operations for sequential state control and counter applications. |

---

## 🌲 Directory Structure

```text
02-Flip-Flops/
├── 01-D-Flip-Flop/
│   ├── d_flip_flop.v
│   ├── d_flip_flop_tb.v
│   ├── rtl-schematic.png
│   └── waveform.png
│
├── 02-JK-Flip-Flop/
│   ├── jk_flip_flop.v
│   ├── jk_flip_flop_tb.v
│   ├── rtl-schematic.png
│   └── waveform.png
│
├── 03-SR-Flip-Flop/
│   ├── sr_flip_flop.v
│   ├── sr_flip_flop_tb.v
│   ├── rtl-schematic.png
│   └── waveform.png
│
└── 04-T-Flip-Flop/
    ├── t_flip_flop.v
    ├── t_flip_flop_tb.v
    ├── rtl-schematic.png
    └── waveform.png
```

---

## 🛠️ Core Concepts Covered

### 1. Flip-Flop Fundamentals

Understand a flip-flop as an edge-triggered sequential storage element capable of storing one bit of information.

Unlike a latch, a flip-flop changes its state only at a specified clock edge.

The basic relationship is:

**Input + Clock Edge + Previous State → Next State**

### 2. Clock Fundamentals

Understand the clock as the timing reference that controls state transitions in synchronous digital systems.

Important clock concepts include:

- Clock signal
- Rising edge
- Falling edge
- Positive-edge triggering
- Negative-edge triggering
- Clock period
- Clock frequency

The basic relationship is:

**Clock Edge → State Update → State Retention**

### 3. D Flip-Flop

Study the D Flip-Flop as the fundamental data storage element.

The basic behavior is:

**At the active clock edge: Q ← D**

The D Flip-Flop provides a simple method of storing and transferring one bit of data.

Understand:

- Data input
- Clock input
- Stored output
- State retention
- Edge-triggered data capture

### 4. JK Flip-Flop

Study the JK Flip-Flop and understand its four fundamental operations:

- **J = 0, K = 0 → Hold**
- **J = 0, K = 1 → Reset**
- **J = 1, K = 0 → Set**
- **J = 1, K = 1 → Toggle**

Understand how the JK Flip-Flop provides a controlled method of changing the stored state.

### 5. SR Flip-Flop

Study the SR Flip-Flop and understand how Set and Reset inputs control the stored state at the active clock edge.

The fundamental operations include:

- **Set**
- **Reset**
- **Hold**
- **Invalid condition**

Understand the difference between an SR Latch and an SR Flip-Flop.

### 6. T Flip-Flop

Study the T Flip-Flop and understand its two fundamental operations:

- **T = 0 → Hold**
- **T = 1 → Toggle**

The T Flip-Flop is particularly useful for designing:

- Counters
- Frequency dividers
- Toggle-based control logic

### 7. State Retention

Understand how a flip-flop maintains its previous output value between active clock edges.

The basic behavior is:

**No Active Clock Edge → Hold Previous State**

This state-retention property forms the foundation of sequential digital systems.

### 8. State Transition

Understand how input conditions determine the next stored state of a flip-flop.

The basic sequential relationship is:

**Current State + Inputs → Next State**

This concept is essential for understanding:

- Registers
- Counters
- Shift registers
- Finite State Machines
- Control logic
- RTL IP

### 9. Verilog RTL Implementation

Implement flip-flops using synthesizable Verilog HDL.

Key concepts include:

- Module declaration
- Port declaration
- `reg`
- `wire`
- `always` blocks
- `always @(posedge clk)`
- `always @(negedge clk)`
- Conditional statements
- Blocking assignment
- Non-blocking assignment
- Synthesizable sequential RTL coding

### 10. Non-Blocking Assignment

Understand why non-blocking assignment is normally used for clocked sequential RTL.

The common sequential RTL style is:

**Clock Edge → Evaluate Right-Hand Side → Update State**

Using:

```verilog
always @(posedge clk)
    Q <= D;
```

This models the behavior of a flip-flop where the output state updates on the active clock edge.

### 11. Positive-Edge Triggering

Understand positive-edge-triggered flip-flops that update their state on the rising edge of the clock.

The event is represented in Verilog as:

```verilog
always @(posedge clk)
```

The basic timing relationship is:

**0 → 1 Clock Transition → State Update**

### 12. Negative-Edge Triggering

Understand negative-edge-triggered flip-flops that update their state on the falling edge of the clock.

The event is represented in Verilog as:

```verilog
always @(negedge clk)
```

The basic timing relationship is:

**1 → 0 Clock Transition → State Update**

### 13. Testbench Development

Develop dedicated Verilog testbenches to apply input combinations and clock transitions to each flip-flop DUT.

The basic verification flow is:

**Test Stimulus → Clock Edge → DUT State Update → Output Observation → Functional Verification**

Testbenches include:

- DUT instantiation
- Clock generation
- Input stimulus
- State-control stimulus
- Output monitoring
- Simulation control
- Waveform generation

### 14. Clock Generation in Testbench

Understand how a periodic clock is generated in a Verilog testbench.

The basic concept is:

**Clock = 0 → Delay → Clock = 1 → Delay → Repeat**

This creates the timing reference required to verify edge-triggered sequential logic.

### 15. Simulation and Waveform Analysis

Analyze simulation waveforms to verify that each flip-flop changes state only at the expected clock edge.

The waveform analysis includes:

- Clock transitions
- Input transitions
- Output transitions
- Set and Reset operations
- Hold behavior
- Toggle behavior
- State retention
- Functional verification

### 16. RTL Schematic Analysis

Analyze the generated RTL schematic to understand how the Verilog description is represented as sequential hardware logic.

This establishes the connection between:

**Verilog Code → RTL Structure → Sequential Hardware**

RTL schematic analysis helps develop hardware-oriented thinking while writing Verilog.

### 17. Flip-Flop Comparison

Understand the functional differences between the major flip-flop types.

| Flip-Flop | Main Operation |
| :--- | :--- |
| **D** | Stores input data |
| **JK** | Hold, Reset, Set, Toggle |
| **SR** | Set, Reset, Hold |
| **T** | Hold or Toggle |

Understanding these differences helps in selecting the appropriate sequential element for RTL design.

### 18. Synthesizable Sequential RTL Practices

Develop industry-oriented RTL coding habits for sequential logic.

Focus areas include:

- Correct clock sensitivity
- Correct use of edge triggering
- Proper use of non-blocking assignments
- Complete state-update behavior
- Clear sequential logic structure
- Avoiding unintended combinational behavior
- Deterministic state transitions
- Reusable RTL structures
- Hardware-oriented thinking

### 19. Timing Foundation

Use flip-flops as the foundation for understanding important digital timing concepts.

This module prepares for:

- Setup time
- Hold time
- Clock-to-Q delay
- Clock skew
- Clock jitter
- Clock uncertainty
- Timing constraints
- Static Timing Analysis
- Synchronous digital design

### 20. Applications of Flip-Flops

Understand how flip-flops are used as fundamental building blocks in larger digital systems such as:

- Registers
- Shift Registers
- Counters
- Frequency Dividers
- Finite State Machines
- Pipeline Registers
- Processor Datapaths
- Control Logic
- FIFOs
- Memory Interfaces
- FPGA Designs
- ASIC Designs
- RTL IP Development

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
