# ◈ FSM Reset and Initialization

[![Stage](https://img.shields.io/badge/Stage-RTL_Architecture-blue.svg?style=flat-square)](#)
[![Focus](https://img.shields.io/badge/Focus-Synchronous_vs_Asynchronous_Reset-orange.svg?style=flat-square)](#)
[![Simulation](https://img.shields.io/badge/Simulator-AMD_Vivado-red.svg?style=flat-square&logo=xilinx)](#)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=flat-square)](#)

This module provides an in-depth architectural breakdown, hardware analysis, and synthesizable Verilog HDL implementation of **FSM Reset and Initialization Strategies**. Establishing deterministic starting states is vital for hardware stability, power-on safety, predictable simulation state machines, and preventing uninitialized logic states (`X`-propagation).

The module contrasts **Synchronous Reset** and **Asynchronous Reset** paradigms, evaluating their impact on clock tree synthesis (CTS), flip-flop control input mapping, recovery/removal static timing analysis (STA), and noise-glitch sensitivity across ASIC and FPGA targets.

---

## ⚡ Architectural Comparison Matrix

| Property / Parameter | Synchronous Reset | Asynchronous Reset |
| :--- | :--- | :--- |
| **Trigger Mechanism** | Evaluated strictly on active clock edge (`posedge clk`) | Asserts immediately on reset edge (`negedge rst_n`) |
| **Sensitivity List** | `always @(posedge clk)` | `always @(posedge clk or negedge rst_n)` |
| **Clock Dependence** | Requires active system clock to enter reset state | Resets state register even if system clock is gated/dead |
| **FF Realization** | Data-path multiplexer feeding D-input | Dedicated asynchronous clear/preset (`CLR`/`PRE`) pins |
| **Noise & Glitch Vulnerability** | Highly immune; glitches filtered between clock edges | High; transient glitches on reset net trigger false resets |
| **STA Critical Timings** | Setup and Hold times relative to clock edge | **Recovery** ($t_{\text{rec}}$) and **Removal** ($t_{\text{rem}}$) times |
| **Primary Applications** | Synchronous DSP, high-noise environments, FPGAs | System startup, global system clear, safety-critical power-up |

---

## 🎯 Learning Objectives

By working through this module, you will be able to:

- Understand the purpose of reset and initialization in FSM design.
- Understand the difference between synchronous and asynchronous reset.
- Design and implement FSMs using synchronous reset.
- Design and implement FSMs using asynchronous reset.
- Understand how reset affects the FSM state register.
- Analyze reset behavior relative to the clock.
- Write synthesizable Verilog RTL for different reset styles.
- Develop dedicated Verilog testbenches for reset verification.
- Analyze RTL schematics and simulation waveforms.
- Understand reset considerations in practical ASIC and FPGA RTL design.

---

## 📂 Module Contents

| Module | Core Technical Focus |
| :--- | :--- |
| **[01-Synchronous-Reset](./01-Synchronous-Reset/)** | Design and verification of an FSM using synchronous reset, where the FSM state is reset only on the active clock edge. |
| **[02-Asynchronous-Reset](./02-Asynchronous-Reset/)** | Design and verification of an FSM using asynchronous reset, where the FSM state can be reset independently of the clock edge. |

---

## 🌲 Directory Structure

07-FSM-Reset-and-Initialization/
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

---

## 🛠️ Core Concepts Covered

### 1. FSM Reset Fundamentals

Understand reset as a control mechanism used to place an FSM into a known initial state.

The basic reset relationship is:

**Reset → Initial State → Normal FSM Operation**

A properly designed FSM should enter a predictable state when reset is asserted.

### 2. FSM Initialization

Understand why an FSM requires a well-defined initial state.

Initialization ensures that:

- The FSM starts from a known state.
- State transitions begin predictably.
- Outputs have defined behavior.
- Simulation does not remain in an unknown (`X`) state.
- The hardware enters a valid operating condition.

A typical FSM initialization sequence is:

**Reset Asserted → Initial State → Reset Released → State Transitions**

### 3. Synchronous Reset

Study synchronous reset, where the reset condition is evaluated only at the active clock edge.

The general behavior is:

**Reset = 1 + Active Clock Edge → FSM enters Reset State**

If reset changes between clock edges, the state register does not immediately change. The reset takes effect when the next active clock edge occurs.

### 4. Asynchronous Reset

Study asynchronous reset, where the reset condition can affect the state register independently of the clock.

The general behavior is:

**Reset Asserted → FSM Immediately Enters Reset State**

The state register responds to reset without waiting for an active clock edge.

This makes asynchronous reset useful when the design requires rapid initialization or reset control independent of normal clock operation.

### 5. Synchronous vs Asynchronous Reset

Compare the two reset techniques based on their timing behavior.

| Feature | Synchronous Reset | Asynchronous Reset |
| :--- | :--- | :--- |
| Reset response | At active clock edge | Immediately when reset is asserted |
| Clock required for reset action | Yes | No |
| State change during reset | Clock dependent | Reset dependent |
| RTL sensitivity | Clock only | Clock and reset |
| Typical coding | `always @(posedge clk)` | `always @(posedge clk or posedge reset)` |
| Timing consideration | Clock-based | Reset assertion/deassertion timing |

The choice depends on the system architecture, reset requirements, technology, and design methodology.

### 6. State Register and Reset

Understand how reset directly controls the FSM state register.

For a synchronous reset:

**Clock Edge → Reset Check → State Register**

For an asynchronous reset:

**Clock Edge OR Reset Event → State Register**

The reset state is normally assigned explicitly so that the FSM always has a known starting point.

### 7. Reset Polarity

Understand reset signal polarity and how it determines when reset is active.

Common forms include:

- Active-high reset
- Active-low reset

For an active-high reset:

**reset = 1 → Reset Active**

For an active-low reset:

**reset_n = 0 → Reset Active**

The RTL implementation must correctly reflect the specified reset polarity.

### 8. Reset Release and State Transitions

Understand the difference between reset assertion and reset release.

The general sequence is:

**Reset Asserted → Reset State → Reset Released → Normal FSM Operation**

For synchronous reset, reset release is recognized on an active clock edge.

For asynchronous reset, the state register leaves reset according to the clocked sequential logic after reset is released.

### 9. Verilog RTL Implementation

Implement synchronous and asynchronous FSM resets using synthesizable Verilog HDL.

Key concepts include:

- State declaration
- State register
- Reset condition
- Clock sensitivity
- Reset sensitivity
- Sequential `always` blocks
- Combinational next-state logic
- `case` statements
- Non-blocking assignments
- Reset state definition
- Synthesizable RTL coding

### 10. Testbench Development

Develop dedicated testbenches to verify reset behavior and normal FSM operation.

The testbench should apply:

- Clock stimulus
- Reset assertion
- Reset release
- Input stimulus
- State-transition conditions
- Output observation

The basic verification flow is:

**Reset Stimulus → DUT → State Initialization → Normal Operation → Functional Verification**

### 11. Simulation and Waveform Analysis

Analyze simulation waveforms to understand how synchronous and asynchronous resets affect the FSM.

For synchronous reset, verify that the state changes to the reset state on the appropriate clock edge.

For asynchronous reset, verify that the state responds immediately when reset is asserted.

Waveform analysis includes:

- Clock
- Reset
- Inputs
- Current state
- Next state
- Outputs
- Reset assertion
- Reset release
- State transitions

This establishes the connection between:

**RTL Code → Reset Behavior → Simulation → Waveform**

### 12. RTL Schematic Analysis

Analyze the generated RTL schematic to understand how reset is incorporated into the FSM state-register hardware.

The RTL structure generally contains:

**State Register + Reset Logic + Combinational FSM Logic**

The schematic helps establish how the selected reset style is represented in the inferred sequential hardware.

### 13. Reset Coding Best Practices

Understand coding practices for reliable FSM reset implementation.

Important practices include:

- Clearly define the reset state.
- Use the correct reset sensitivity for the selected reset style.
- Use non-blocking assignments in sequential logic.
- Keep reset behavior deterministic.
- Provide complete combinational assignments.
- Avoid unintended latch inference.
- Verify both reset assertion and reset release.
- Test reset behavior under different clock and input conditions.
- Maintain consistent reset polarity throughout the design.

### 14. ASIC Reset Considerations

Understand that reset design becomes important in practical ASIC RTL because reset signals can affect large numbers of sequential elements.

Important considerations include:

- Reset distribution
- Reset timing
- Reset synchronization
- Reset assertion
- Reset deassertion
- Recovery and removal timing
- Reset-domain considerations

At the RTL-learning level, the key focus is understanding correct reset behavior and writing synthesizable reset logic.

### 15. FPGA and ASIC Reset Considerations

Understand that reset implementation can differ depending on the target technology.

Important factors include:

- Available reset resources
- Technology-specific flip-flop behavior
- Synthesis optimization
- Reset distribution
- Timing requirements
- Design methodology

The RTL should first satisfy the functional specification, while synthesis and implementation tools determine the final hardware realization for the target technology.

### 16. Applications of FSM Reset and Initialization

Understand the use of reset and initialization techniques in digital systems such as:

- UART controllers
- SPI controllers
- I2C controllers
- Processor control units
- Communication controllers
- Bus interfaces
- Memory controllers
- DMA controllers
- Peripheral controllers
- Protocol controllers
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
