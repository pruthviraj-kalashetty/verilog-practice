# 📘 Elevator Controller — Documentation

<p align="center">
  <strong>Design Specifications • FSM Architecture • Timing • Verification Planning</strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Design%20Specification-Complete-success?style=for-the-badge" alt="Design Specification Complete">
  <img src="https://img.shields.io/badge/HDL-Verilog--2001-blue?style=for-the-badge" alt="Verilog-2001">
  <img src="https://img.shields.io/badge/Design-3--Floor%20Elevator-orange?style=for-the-badge" alt="Three-Floor Elevator">
</p>

---

## 📌 Overview

This directory contains the engineering documentation for the **Elevator Controller**, a three-floor digital control system designed using a **Verilog-2001 synthesizable subset** and a **parameterized Moore finite-state machine (FSM)**.

The documents define the system requirements, architecture, state transitions, timing behavior, verification strategy, and major design decisions before RTL implementation.

The purpose of this documentation is to establish a clear and consistent design reference for RTL development, simulation, debugging, and future maintenance.

---

## 🗂️ Documentation Structure

    docs/
    ├── README.md
    ├── 01-requirements-and-specification.md
    ├── 02-block-diagram.md
    ├── 03-fsm-specification.md
    ├── 04-timing-specification.md
    ├── 05-verification-plan.md
    └── 06-design-decisions.md

---

## 📑 Document Index

| No. | Document | Description |
|:---:|---|---|
| 01 | [Requirements and Specification](01-requirements-and-specification.md) | Defines system scope, inputs, outputs, functional requirements, and safety requirements. |
| 02 | [Block Diagram](02-block-diagram.md) | Defines the system architecture and module-level connections. |
| 03 | [FSM Specification](03-fsm-specification.md) | Defines the seven FSM states, state transitions, and output-control behavior. |
| 04 | [Timing Specification](04-timing-specification.md) | Defines clocked behavior, floor movement timing, door timing, reset behavior, and emergency-stop timing. |
| 05 | [Verification Plan](05-verification-plan.md) | Defines planned test cases, expected behavior, and simulation-based acceptance criteria. |
| 06 | [Design Decisions](06-design-decisions.md) | Records key design choices, alternatives, trade-offs, and Version 1 limitations. |

---

## 🔄 Documentation Workflow

    System Requirements
           │
           ▼
      Block Diagram
           │
           ▼
      FSM Specification
           │
           ▼
     Timing Specification
           │
           ▼
      Verification Plan
           │
           ▼
      Design Decisions
           │
           ▼
       RTL Development
           │
           ▼
     Simulation & Debugging
           │
           ▼
     Verification Report

Each document serves a specific purpose and should remain consistent with the other design documents as the project progresses.

---

## ⚙️ Design Scope

| Feature | Specification |
|---|---|
| System | Three-floor elevator controller |
| Supported floors | Floor 0, Floor 1, Floor 2 |
| Hardware description language | Verilog-2001 |
| Control architecture | Parameterized Moore FSM |
| Reset | Synchronous, active-high |
| Floor request | Two-bit input |
| Door timing | Configurable clock-cycle counter |
| Emergency handling | Emergency stop with reset-based recovery |
| Implementation scope | RTL design and simulation |
| FPGA implementation | Not required for Version 1 |

---

## 🧪 Verification Approach

Verification will be performed after the RTL modules and testbenches are implemented.

Planned verification activities include:

- Reset and initialization checks.
- Upward and downward floor movement.
- Same-floor request handling.
- Door-open duration and automatic closing.
- Invalid floor-request handling.
- Emergency-stop behavior and reset recovery.
- Safety checks for movement outputs and door operation.

**Verification results will be documented only after the corresponding simulations have been executed.**

---

## 📍 Project Status

| Project Phase | Status |
|---|---|
| Requirements and specifications | Complete |
| Block-diagram documentation | Complete |
| FSM and timing documentation | Complete |
| Verification planning | Complete |
| Design-decision documentation | Complete |
| RTL implementation | Pending |
| Testbench development | Pending |
| Simulation and waveform analysis | Pending |
| Final verification report | Pending |

---

## 🚀 Future Extension Possibilities

Potential future enhancements include:

- Multiple queued floor requests.
- Request scheduling and floor prioritization.
- Door obstruction detection.
- Overload detection.
- Support for additional floors.
- More advanced elevator-control strategies.

These features are outside the current Version 1 scope.

---

## 🔗 Project Navigation

- [⬅️ Back to Main Project README](../README.md)
- [📋 Requirements and Specification](01-requirements-and-specification.md)
- [🗺️ Block Diagram](02-block-diagram.md)
- [🔀 FSM Specification](03-fsm-specification.md)
- [⏱️ Timing Specification](04-timing-specification.md)
- [🧪 Verification Plan](05-verification-plan.md)
- [⚖️ Design Decisions](06-design-decisions.md)

---

<p align="center">
  <strong>Elevator Controller | RTL Design & Simulation</strong>
  <br>
  <sub>Clear specifications. Structured implementation. Evidence-based verification.</sub>
</p>
