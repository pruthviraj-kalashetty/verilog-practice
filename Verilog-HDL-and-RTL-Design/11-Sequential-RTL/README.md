# ◈ Sequential RTL

[![Stage](https://img.shields.io/badge/Stage-Sequential_Logic-blue.svg?style=flat-square)](#)
[![Focus](https://img.shields.io/badge/Focus-Storage_Elements_&_State_Machines-orange.svg?style=flat-square)](#)
[![Simulation](https://img.shields.io/badge/Simulator-AMD_Vivado-red.svg?style=flat-square&logo=xilinx)](#)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=flat-square)](#)

This module provides a comprehensive exploration of sequential digital logic design and hardware implementation using synthesizable Verilog HDL. Unlike combinational circuits, sequential circuits maintain internal state using bistable storage elements (latches and flip-flops), enabling clock-driven state transitions, temporary data storage, serial/parallel data conversion, and event counting.

The module covers level-sensitive latches, edge-triggered flip-flops, multi-bit shift registers, and ripple/synchronous counter architectures, accompanied by complete Verilog source files, self-checking testbenches, RTL synthesis schematics, and simulation waveforms.

---

## ⚡ Architectural Comparison Matrix

| Storage / State Category | Trigger Mechanism | Clocking Scheme | Primary Hardware Primitive | Typical System Application |
| :--- | :--- | :--- | :--- | :--- |
| **Level-Sensitive Latches** | Enable Level (`HIGH`/`LOW`) | Asynchronous / Level Gate | Transparent Latch / Gate | Asynchronous buses, pipeline hold stages |
| **Edge-Triggered Flip-Flops** | Clock Edge (`posedge`/`negedge`) | Common Synchronous Clock | D / JK / T Flip-Flops | Pipeline registers, FSM state registers |
| **Shift Registers** | Active Clock Edge | Synchronous Shift Clock | Cascaded D Flip-Flops | Serial buses (SPI/UART), PISO/SIPO conversion |
| **Asynchronous Counters** | Cascaded Output Edge | Ripple Clock ($Q_n \to CLK_{n+1}$) | T / JK Flip-Flops | Low-power ripple dividers (low-frequency) |
| **Synchronous Counters** | Active Clock Edge | Shared Global Clock | D/T Flip-Flops + Carry Gates | High-speed timers, address generation, FPGAs |

---

## 🎯 Learning Objectives

By working through this module, you will be able to:

- Understand the fundamental concepts of sequential digital logic.
- Understand the difference between combinational and sequential circuits.
- Understand latches and their level-sensitive operation.
- Understand flip-flops and their edge-triggered operation.
- Design and implement SR and D latches.
- Design and implement D, JK, SR, and T flip-flops.
- Understand serial and parallel data transfer using shift registers.
- Design and implement SISO, SIPO, PISO, and PIPO shift registers.
- Understand asynchronous and synchronous counter architectures.
- Design and implement 3-bit and 4-bit asynchronous up and down counters.
- Design and implement 3-bit and 4-bit synchronous up and down counters.
- Understand the operation of ring counters.
- Analyze state transitions and timing behavior of sequential circuits.
- Write synthesizable Verilog RTL for sequential circuits.
- Develop dedicated Verilog testbenches for functional verification.
- Analyze RTL schematics and simulation waveforms.
- Understand the role of sequential RTL in larger digital systems.

---

## 📂 Module Contents

| Module | Core Technical Focus |
| :--- | :--- |
| **[01-Latches](./01-Latches/)** | Design and verification of level-sensitive storage elements, including SR and D latches. |
| **[02-Flip-Flops](./02-Flip-Flops/)** | Design and verification of edge-triggered storage elements, including D, JK, SR, and T flip-flops. |
| **[03-Shift-Registers](./03-Shift-Registers/)** | Design and verification of SISO, SIPO, PISO, and PIPO shift registers for serial and parallel data transfer. |
| **[04-Counters](./04-Counters/)** | Design and verification of asynchronous counters, synchronous counters, and ring counters. |

---

## 🌲 Directory Structure

```
11-Sequential-RTL/
├── 01-Latches/
│   ├── 01-SR-Latch/
│   │   ├── sr_latch.v
│   │   ├── sr_latch_tb.v
│   │   ├── rtl-schematic.png
│   │   └── waveform.png
│   │
│   └── 02-D-Latch/
│       ├── d_latch.v
│       ├── d_latch_tb.v
│       ├── rtl-schematic.png
│       └── waveform.png
│
├── 02-Flip-Flops/
│   ├── 01-D-Flip-Flop/
│   │   ├── d_flip_flop.v
│   │   ├── d_flip_flop_tb.v
│   │   ├── rtl-schematic.png
│   │   └── waveform.png
│   │
│   ├── 02-JK-Flip-Flop/
│   │   ├── jk_flip_flop.v
│   │   ├── jk_flip_flop_tb.v
│   │   ├── rtl-schematic.png
│   │   └── waveform.png
│   │
│   ├── 03-SR-Flip-Flop/
│   │   ├── sr_flip_flop.v
│   │   ├── sr_flip_flop_tb.v
│   │   ├── rtl-schematic.png
│   │   └── waveform.png
│   │
│   └── 04-T-Flip-Flop/
│       ├── t_flip_flop.v
│       ├── t_flip_flop_tb.v
│       ├── rtl-schematic.png
│       └── waveform.png
│
├── 03-Shift-Registers/
│   ├── 01-Serial-In-Serial-Out/
│   │   ├── siso.v
│   │   ├── siso_tb.v
│   │   ├── rtl-schematic.png
│   │   └── waveform.png
│   │
│   ├── 02-Serial-In-Parallel-Out/
│   │   ├── sipo.v
│   │   ├── sipo_tb.v
│   │   ├── rtl-schematic.png
│   │   └── waveform.png
│   │
│   ├── 03-Parallel-In-Serial-Out/
│   │   ├── piso.v
│   │   ├── piso_tb.v
│   │   ├── rtl-schematic.png
│   │   └── waveform.png
│   │
│   └── 04-Parallel-In-Parallel-Out/
│       ├── pipo.v
│       ├── pipo_tb.v
│       ├── rtl-schematic.png
│       └── waveform.png
│
└── 04-Counters/
    ├── 01-Asynchronous-Counters/
    │   ├── 01-Three-Bit-Asynchoronous-Up-Counter/
    │   │   ├── three_bit_asynchoronous_up_counter.v
    │   │   ├── three_bit_asynchoronous_up_counter_tb.v
    │   │   ├── rtl-schematic.png
    │   │   └── waveform.png
    │   │
    │   ├── 02-Three-Bit-Asynchoronous-Down-Counter/
    │   │   ├── three_bit_asynchoronous_down_counter.v
    │   │   ├── three_bit_asynchoronous_down_counter_tb.v
    │   │   ├── rtl-schematic.png
    │   │   └── waveform.png
    │   │
    │   ├── 03-Four-Bit-Asynchoronous-Up-Counter/
    │   │   ├── four_bit_asynchoronous_up_counter.v
    │   │   ├── four_bit_asynchoronous_up_counter_tb.v
    │   │   ├── rtl-schematic.png
    │   │   └── waveform.png
    │   │
    │   └── 04-Four-Bit-Asynchoronous-Down-Counter/
    │       ├── four_bit_asynchoronous_down_counter.v
    │       ├── four_bit_asynchoronous_down_counter_tb.v
    │       ├── rtl-schematic.png
    │       └── waveform.png
    │
    ├── 02-Synchronous-Counters/
    │   ├── 01-Three-Bit-Synchoronous-Up-Counter/
    │   │   ├── three_bit_synchoronous_up_counter.v
    │   │   ├── three_bit_synchoronous_up_counter_tb.v
    │   │   ├── rtl-schematic.png
    │   │   └── waveform.png
    │   │
    │   ├── 02-Three-Bit-Synchoronous-Down-Counter/
    │   │   ├── three_bit_synchoronous_down_counter.v
    │   │   ├── three_bit_synchoronous_down_counter_tb.v
    │   │   ├── rtl-schematic.png
    │   │   └── waveform.png
    │   │
    │   ├── 03-Four-Bit-Synchoronous-Up-Counter/
    │   │   ├── four_bit_synchoronous_up_counter.v
    │   │   ├── four_bit_synchoronous_up_counter_tb.v
    │   │   ├── rtl-schematic.png
    │   │   └── waveform.png
    │   │
    │   └── 04-Four-Bit-Synchoronous-Down-Counter/
    │       ├── four_bit_synchoronous_down_counter.v
    │       ├── four_bit_synchoronous_down_counter_tb.v
    │       ├── rtl-schematic.png
    │       └── waveform.png
    │
    └── 03-Ring-Counter
        ├── ring_counter.v
        ├── ring_counter_tb.v
        ├── rtl-schematic.png
        └── waveform.png
```
---

## 🛠️ Core Concepts Covered

### 1. Sequential Logic Fundamentals

Understand sequential logic as digital logic whose output depends on both the current inputs and previously stored state.

The basic relationship is:

**Inputs + Previous State → Sequential Logic → Next State**

Unlike combinational logic, sequential circuits contain memory elements that allow them to store information.

### 2. Latches

Understand latches as level-sensitive storage elements that can store one bit of information.

Study:

- SR Latch
- D Latch
- Set and reset operation
- Enable-controlled data storage
- Level-sensitive behavior
- Invalid conditions in SR latches

### 3. SR Latch

Study the fundamental SR latch and understand how Set and Reset inputs control the stored output state.

The basic operations are:

- **S = 1** → Set
- **R = 1** → Reset
- **S = 0, R = 0** → Hold
- Invalid condition depends on the latch implementation

### 4. D Latch

Understand how a D latch eliminates the invalid input combination of the basic SR latch by using a single data input.

The D latch provides:

**Data Input → Enable → Stored Output**

When enabled, the output follows the input. When disabled, the previous state is retained.

### 5. Flip-Flops

Understand flip-flops as edge-triggered storage elements that store one bit of information and change state in response to a clock edge.

Study:

- D Flip-Flop
- JK Flip-Flop
- SR Flip-Flop
- T Flip-Flop
- Clock triggering
- State retention
- Setup and hold concepts
- Edge-triggered operation

### 6. D Flip-Flop

Study the D flip-flop as a fundamental storage element in synchronous digital systems.

The basic relationship is:

**Q(next) = D**

The input data is captured on the active clock edge and stored until the next relevant clock event.

### 7. JK Flip-Flop

Understand the JK flip-flop and its four fundamental operations:

- Hold
- Reset
- Set
- Toggle

The JK flip-flop is commonly used for implementing counters and other sequential circuits.

### 8. SR Flip-Flop

Study the clocked SR flip-flop and understand how Set and Reset inputs control the stored state in synchronization with the clock.

### 9. T Flip-Flop

Understand the T flip-flop as a toggle-based storage element.

Its fundamental behavior is:

- **T = 0** → Hold
- **T = 1** → Toggle

T flip-flops are particularly useful in counter and frequency-division circuits.

### 10. Shift Registers

Understand shift registers as sequential circuits used to store and move binary data from one flip-flop stage to another.

The basic relationship is:

**Input Data → Flip-Flop Chain → Shifted Data**

Study:

- Serial data transfer
- Parallel data transfer
- Left and right shifting
- Data storage
- Data conversion between serial and parallel formats

### 11. SISO Shift Register

Study the **Serial-In Serial-Out (SISO)** shift register.

Data enters one bit at a time and exits one bit at a time after propagating through the register stages.

### 12. SIPO Shift Register

Study the **Serial-In Parallel-Out (SIPO)** shift register.

Serial input data is shifted into the register and becomes available simultaneously at multiple parallel outputs.

### 13. PISO Shift Register

Study the **Parallel-In Serial-Out (PISO)** shift register.

Multiple bits are loaded simultaneously and then shifted out serially.

### 14. PIPO Shift Register

Study the **Parallel-In Parallel-Out (PIPO)** shift register.

Multiple bits are loaded and transferred simultaneously, making it useful for temporary parallel data storage.

### 15. Counters

Understand counters as sequential circuits that progress through a predefined sequence of states according to clock events.

Study:

- Asynchronous counters
- Synchronous counters
- Up counters
- Down counters
- Counter state sequences
- Counter rollover
- Frequency division

### 16. Asynchronous Counters

Understand asynchronous or ripple counters in which the clocking of successive flip-flops is derived from the output of the previous stage.

The basic structure is:

**Clock → FF₀ → FF₁ → FF₂ → FF₃**

The propagation delay accumulates through the counter stages.

### 17. Synchronous Counters

Understand synchronous counters in which all flip-flops receive the same clock signal.

The basic structure is:

**Common Clock → FF₀, FF₁, FF₂, FF₃**

This provides coordinated state transitions and better timing behavior compared with ripple counters.

### 18. Ring Counter

Understand a ring counter as a shift-register-based sequential circuit in which a bit pattern circulates through the flip-flop stages.

A typical 4-bit one-hot sequence is:

**0001 → 0010 → 0100 → 1000 → 0001**

Ring counters are useful for generating sequential control signals and one-hot timing sequences.

### 19. Verilog RTL Implementation

Implement sequential circuits using synthesizable Verilog HDL.

Key concepts include:

- Module declaration
- Port declaration
- `always` blocks
- Edge-sensitive event controls
- Level-sensitive event controls
- Non-blocking assignments
- Clock signals
- Reset signals
- State storage
- Shift operations
- Counter operations
- Synthesizable RTL coding

### 20. Testbench Development

Develop dedicated testbenches to generate clock and input stimulus, apply reset conditions, observe outputs, and verify expected sequential behavior.

The basic verification flow is:

**Test Stimulus → DUT → State Transition → Output Observation → Functional Verification**

### 21. Simulation and Waveform Analysis

Analyze simulation waveforms to verify the timing and functional behavior of sequential circuits.

The waveform analysis includes:

- Input transitions
- Clock transitions
- Enable signals
- Reset operation
- Stored state
- Flip-flop transitions
- Shift-register operation
- Counter sequences
- Ring-counter state circulation

### 22. RTL Schematic Analysis

Analyze the generated RTL schematic to understand how the Verilog description is represented as hardware logic.

This establishes the connection between:

**Verilog Code → RTL Structure → Storage Elements & Logic → Hardware**

### 23. Applications of Sequential RTL

Understand the use of sequential circuits in digital systems such as:

- Registers
- Counters
- Data storage
- Data transfer
- Control units
- Finite state machines
- Processor datapaths
- Communication systems
- Timers
- Frequency dividers
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
