 <div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:0D1117,50:161B22,100:238636&height=120&section=header&text=ELEVATOR%20CONTROLLER&fontSize=30&fontColor=FFFFFF&animation=fadeIn&fontAlignY=65"/>

<br>

### Moore FSM • Floor Request Handling • Emergency Control

<p>
  <img src="https://img.shields.io/badge/%E2%97%88%20TYPE-MOORE%20FSM-0F172A?style=for-the-badge&labelColor=020617&color=3B82F6"/>
  <img src="https://img.shields.io/badge/%E2%97%88%20FLOORS-3-0F172A?style=for-the-badge&labelColor=020617&color=14B8A6"/>
  <img src="https://img.shields.io/badge/%E2%97%88%20RTL-VERILOG-0F172A?style=for-the-badge&labelColor=020617&color=8B5CF6"/>
  <img src="https://img.shields.io/badge/%E2%97%88%20VERIFICATION-MAIN%20TB%20PASSING-0F172A?style=for-the-badge&labelColor=020617&color=F59E0B"/>
</p>

</div>

---

## 📋 Introduction

Digital control systems use sequential logic to manage operations in a predictable and organized manner. An elevator controller is one example. It processes floor requests, controls movement, manages door timing, and responds to emergency conditions.

This project implements an **Elevator Controller using Verilog HDL** with a **seven-state Moore Finite State Machine (FSM)**. The design supports three valid floors, upward and downward movement, current-floor requests, timed door operation, and a latched emergency-stop condition.

The project is organized into RTL modules and testbenches to support simulation, debugging, and verification. It provides practical experience with FSM design, sequential logic, counters, module integration, and digital hardware verification.

---

## 📌 Project Summary

* **Architecture:** Seven-state Moore Finite State Machine (FSM)
* **Design Language:** Verilog HDL (Verilog-2001 coding style)
* **Floor Support:** Three floors — Floor 0, Floor 1, and Floor 2
* **Control Features:** Synchronous active-high reset, floor request handling, movement control, door timing, and emergency-stop handling
* **Door Timing:** 16 clock cycles
* **Verification Scope:** Main controller testbench and separate submodule testbenches

## 🔌 Interface Specifications

> [!NOTE]
> **Quick Interface Overview**
>
> Refer to the existing Requirements & Design documentation, if included in the project, for the complete interface specification.

| Port | Direction | Width | Description |
| :--- | :--- | :--- | :--- |
| `clk` | Input | 1 | Master system clock |
| `reset` | Input | 1 | Synchronous active-high reset |
| `floor_request` | Input | 2 | Encoded requested floor |
| `emergency_stop` | Input | 1 | Emergency-stop input |
| `move_up` | Output | 1 | Indicates upward movement |
| `move_down` | Output | 1 | Indicates downward movement |
| `door_open` | Output | 1 | Indicates that the door is open |
| `floor_display` | Output | 2 | Current floor in binary encoding |
| `emergency_active` | Output | 1 | Indicates an active emergency condition |

> **Note:** Confirm the port names and widths against the final RTL source before submission. This table reflects the interface signals used in the project context.

## 🏗️ Architecture

The elevator controller uses a state register, transition logic, floor request handling, and door-timing logic. The controller determines whether to remain idle, move between floors, open the door, wait for the door timer, close the door, or remain in an emergency state.

The design separates supporting functionality into modules for floor request handling, door timing, and seven-segment display decoding.

### Block Diagram

![Block Diagram](./02-architecture/01-block-diagram.png)

### FSM State Diagram

![FSM State Diagram](./02-architecture/02-fsm-state-diagram.png)

### Timing Diagram

![Timing Diagram](./02-architecture/03-timing-diagram.png)

> [!NOTE]
> **Detailed FSM Behavior**
>
> Use the actual state diagram and finalized design requirements to document the precise state-transition conditions. The timing diagram should be added after generating and checking the corresponding simulation waveform.

## 💻 RTL Implementation

The RTL design is organized into separate Verilog modules:

- **Elevator Controller:** Manages the main FSM, floor movement, door control, and emergency behavior.
- **Floor Request Handler:** Handles floor-request information and request acceptance.
- **Door Timer:** Controls the duration of the door-open interval.
- **Seven-Segment Display:** Converts supported floor information into display output.

The controller uses the following seven-state encoding:

| State | Encoding | Purpose |
| :--- | :--- | :--- |
| `IDLE` | `3'b000` | Waits for a floor request |
| `MOVE_UP` | `3'b001` | Controls upward movement |
| `MOVE_DOWN` | `3'b010` | Controls downward movement |
| `DOOR_OPEN` | `3'b011` | Opens the door |
| `DOOR_TIMER` | `3'b100` | Tracks the door-open interval |
| `DOOR_CLOSE` | `3'b101` | Closes the door |
| `EMERGENCY` | `3'b110` | Holds the controller in emergency mode |

The RTL implementation focuses on:

- Clocked sequential logic and FSM state transitions
- Synchronous active-high reset behavior
- Floor request acceptance and target-floor tracking
- Upward and downward movement control
- Door timing using a counter
- Emergency-stop behavior and recovery through reset
- Modular RTL design and testbench-based debugging

The Verilog source and testbench files are available in:

- [RTL Design](./03-rtl-design-and-verification/rtl-design/)
- [Testbenches](./03-rtl-design-and-verification/testbench/)

<table align="center">
<tr>
<td align="center" width="50%">

<img src="https://img.shields.io/badge/RTL%20DESIGN%20SOURCE-58A6FF?style=for-the-badge&logo=verilog&logoColor=white"/>

<br><br>

<img src="https://img.icons8.com/fluency/96/document.png" width="55"/>

<br>

### Elevator Controller RTL

**Synthesizable Verilog RTL**

`01_elevator_controller.v`

<br>

[Open RTL Source →](./03-rtl-design-and-verification/rtl-design/01_elevator_controller.v)

</td>
<td align="center" width="50%">

<img src="https://img.shields.io/badge/VERIFICATION%20TESTBENCH-F0883E?style=for-the-badge&logo=verilog&logoColor=white"/>

<br><br>

<img src="https://img.icons8.com/fluency/96/test-tube.png" width="55"/>

<br>

### Elevator Controller Testbench

**Simulation & Verification**

`01_elevator_controller_tb.v`

<br>

[Open Testbench →](./03-rtl-design-and-verification/testbench/01_elevator_controller_tb.v)

</td>
</tr>
</table>

## 🧪 Verification Strategy

The main controller testbench is used to verify:

- Reset and return to the initial state
- Movement from Floor 0 to Floor 1
- Movement from Floor 0 to Floor 2
- Return movement from Floor 2 to Floor 0
- Movement from Floor 2 to Floor 1
- Emergency-stop activation during movement
- Emergency condition remaining active after the stop input is released
- Ignoring new floor requests during emergency mode
- Reset recovery from emergency mode
- Invalid floor requests
- Requests for the current floor
- Door timing, closure, and return to `IDLE`

Separate testbenches are provided for the supporting modules:

- Floor request handler
- Door timer
- Seven-segment display

> [!NOTE]
> **Verification Status**
>
> The main controller simulation output shows passing results for the checks listed above. The separate submodule simulations and final clean-run verification should be completed before claiming full project verification.

## 📈 Simulation Evidence

### Waveform

![Elevator Controller Waveform](./03-rtl-design-and-verification/verification-results/waveform.png)

The waveform can be used to examine the relationship between the clock, reset, floor requests, FSM state, movement outputs, door control, and emergency signals.

### RTL Schematic

![Elevator Controller RTL Schematic](./03-rtl-design-and-verification/verification-results/rtl-schematic.png)

The RTL schematic can provide a hardware-oriented view of the structures inferred from the Verilog design, once generated using a synthesis tool.

> **Before submission:** Add these images only after confirming that the files exist and that the screenshots represent the final RTL. If your existing files use different names or locations, update the links to match.

## 📚 Documentation

Add or link the following documents when they are present in the project:

- [Requirements & Design](./01-docs/01-requirements-and-design.md)
- [FSM Specification](./01-docs/02-fsm-specification.md)
- [Verification Summary](./01-docs/03-verification-summary.md)
- [Design Decisions & Trade-offs](./01-docs/04-design-decisions.md)

These links follow the documentation structure used in the Traffic Light Controller README. Keep them only if the corresponding Elevator Controller documents exist at these locations.

## 🧪 Verification & Simulation Results

The following table summarizes the results visible in the current main-controller simulation output.

| Test Case | Scenario Description | Expected Behavior | Observed Result | Status |
| :--- | :--- | :--- | :--- | :--- |
| **TC_01** | Controller reset | Controller returns to `IDLE` | Reset check passed | ✅ PASS |
| **TC_02** | Floor 0 to Floor 2 | Elevator reaches Floor 2 | Destination reached | ✅ PASS |
| **TC_03** | Floor 2 to Floor 0 | Elevator returns to Floor 0 | Destination reached | ✅ PASS |
| **TC_04** | Floor 0 to Floor 1 | Elevator reaches Floor 1 | Destination reached | ✅ PASS |
| **TC_05** | Floor 2 to Floor 1 | Elevator reaches Floor 1 | Destination reached | ✅ PASS |
| **TC_06** | Emergency during movement | Movement stops and emergency activates | Emergency state confirmed | ✅ PASS |
| **TC_07** | Emergency input released | Emergency remains latched | Emergency remains active | ✅ PASS |
| **TC_08** | New request during emergency | New request is ignored | Request acceptance disabled | ✅ PASS |
| **TC_09** | Reset during emergency | Emergency clears and controller returns to `IDLE` | Reset recovery check passed | ✅ PASS |
| **TC_10** | Invalid floor request | Invalid request does not cause movement | Check passed | ✅ PASS |
| **TC_11** | Current-floor request | Door opens without movement | Check passed | ✅ PASS |
| **TC_12** | Door timing and closure | Door closes and controller returns to `IDLE` | Check passed | ✅ PASS |

**Verification note:** These results are based on the main testbench output available during project development. They do not establish that all separate submodule tests or synthesis checks have passed.

## Repository Structure

The following tree reflects the known project layout. Keep the final tree aligned with the actual folders and filenames in your repository.

```text
05-Elevator-Controller/
│
├── README.md
│
├── 01-docs/
│   ├── 01-requirements-and-design.md
│   ├── 02-fsm-specification.md
│   ├── 03-verification-summary.md
│   └── 04-design-decisions.md
│
├── 02-architecture/
│   ├── 01-block-diagram.png
│   ├── 02-fsm-state-diagram.png
│   └── 03-timing-diagram.png
│
└── 03-rtl-design-and-verification/
    │
    ├── rtl-design/
    │   ├── 01_elevator_controller.v
    │   ├── 02_floor_request_handler.v
    │   ├── 03_door_timer.v
    │   └── 04_seven_segment_display.v
    │
    ├── testbench/
    │   ├── 01_elevator_controller_tb.v
    │   ├── 02_floor_request_handler_tb.v
    │   ├── 03_door_timer_tb.v
    │   └── 04_seven_segment_display_tb.v
    │
    └── verification-results/
        ├── waveform.png
        └── rtl-schematic.png
```

> **Important:** This is a proposed presentation tree based on the known file paths and the template. Verify the actual root directory, documentation folder, architecture folder, and evidence filenames before using it as the final repository tree.

## 🛠️ Tools & Technologies

- **HDL:** Verilog HDL
- **Simulation Engine:** Icarus Verilog
- **Waveform Debugger:** GTKWave
- **Synthesis & RTL Inspection:** Xilinx Vivado, if used for this project
- **Version Control:** Git & GitHub

## 📚 Key RTL Concepts Applied

- **Moore FSM:** State-based control for movement, doors, and emergency operation.
- **Sequential Logic:** Clocked state updates and registered control behavior.
- **Floor Request Handling:** Accepting and tracking a requested destination.
- **Counters and Timing:** Controlling a fixed door-open interval.
- **Emergency Control:** Stopping movement and maintaining emergency mode until reset.
- **Modular RTL Design:** Separating the controller and supporting functions into distinct modules.
- **Testbench Verification:** Checking expected behavior through simulation.
- **Waveform Debugging:** Observing signal changes over time to understand the controller's behavior.

## 💬 Interview Questions

**Q: Why is an FSM used in an elevator controller?**  
A: An FSM organizes the controller's behavior into defined states, making transitions and control conditions easier to design and verify.

**Q: Why is the controller divided into separate modules?**  
A: Modular design separates responsibilities, improves readability, and allows individual components to be tested independently.

**Q: What is the purpose of the door timer?**  
A: It measures the door-open interval and signals when the door should proceed toward closure.

**Q: Why should an emergency stop be latched?**  
A: Latching keeps the controller in emergency mode after the input is released, until the specified recovery condition occurs.

**Q: How are invalid floor requests handled?**  
A: The encoding `2'b11` represents an invalid floor and should not initiate movement. The behavior is checked in the main testbench.

**Q: Why are separate testbenches useful?**  
A: They help isolate faults in individual modules before and after integration with the complete controller.

**Q: How can this controller be extended?**  
A: Possible extensions include additional floors, request queuing, improved door safety inputs, and a defined communication interface.

## ⚖️ Design Decisions & Trade-offs

- **Moore FSM:** Provides state-based control outputs and a clear state-transition structure.
- **Synchronous reset:** Aligns reset behavior with the active clock edge.
- **Separate modules:** Makes the design easier to maintain and test.
- **Binary floor encoding:** Uses two bits to represent three valid floors and one invalid encoding.
- **Fixed door timing:** Keeps the initial design focused on a predictable door-open interval.
- **Latched emergency state:** Prevents normal operation from resuming merely because the emergency input is released.
- **Testbench-driven development:** Uses simulation output to check behavior before final submission.

> [!NOTE]
> **Design Decisions & Trade-offs**
>
> Add the finalized Design Decisions document when it is available. It should explain the actual choices made in the RTL rather than introducing features that are not implemented.

## 🚀 Future Improvements

- Add a formal request queue to manage multiple pending floor requests.
- Extend the controller to support more floors.
- Add door obstruction detection and safety interlocks.
- Add debouncing or synchronization where external inputs require it.
- Integrate the controller with a defined peripheral interface.
- Improve automated verification with additional self-checking assertions and corner cases.
- Run synthesis and inspect the generated RTL schematic.
- Expand timing analysis and verification evidence.

These are possible future extensions, not features claimed to exist in the current implementation.

## 🔗 Related

Part of the [RTL Mini-Projects](../README.md) collection.

This project builds practical skills in FSM-based RTL design, sequential control, counters, modular hardware design, and simulation-based verification. It provides a foundation for larger digital hardware projects and future RTL design work.



--------

# Elevator Controller using Verilog HDL

## Overview

This project implements a three-floor Elevator Controller using Verilog HDL. The controller manages floor requests, upward and downward movement, door timing, emergency-stop behavior, and floor display output.

The design uses a Finite State Machine (FSM) and is divided into separate RTL modules for easier understanding, simulation, and verification.

## Features

- Three-floor operation: Floor 0, Floor 1, and Floor 2
- FSM-based elevator control
- Upward and downward floor movement
- Floor request handling
- Invalid floor request rejection (`2'b11`)
- Parameterized door timer with a default value of 16 cycles
- Emergency-stop handling with reset-based recovery
- Seven-segment display decoding for the three valid floors
- Separate testbenches for the main controller and supporting modules

## Design Architecture

The project contains four RTL modules:

| Module | Description |
|---|---|
| `elevator_controller.v` | Main controller that manages the FSM, floor movement, door control, and emergency state |
| `floor_request_handler.v` | Accepts valid floor requests, stores the requested floor, and clears completed requests |
| `door_timer.v` | Counts clock cycles and indicates when the configured timing interval has completed |
| `seven_segment_display.v` | Converts the binary floor value into a seven-segment display pattern |

## FSM States

The main controller uses the following seven states:

| State | Encoding | Purpose |
|---|---|---|
| `IDLE` | `3'b000` | Waits for a floor request |
| `MOVE_UP` | `3'b001` | Moves the elevator upward |
| `MOVE_DOWN` | `3'b010` | Moves the elevator downward |
| `DOOR_OPEN` | `3'b011` | Opens the door |
| `DOOR_TIMER` | `3'b100` | Maintains the door-open condition while timing |
| `DOOR_CLOSE` | `3'b101` | Closes the door |
| `EMERGENCY` | `3'b110` | Stops normal operation until reset |

### Normal Operation

The normal movement sequence is:

```text
IDLE → MOVE_UP → DOOR_OPEN → DOOR_TIMER → DOOR_CLOSE → IDLE
```

For downward movement, `MOVE_UP` is replaced with `MOVE_DOWN`.

When the requested floor is the current floor, the controller proceeds directly from `IDLE` to `DOOR_OPEN`.

The emergency state remains active until reset is applied.

## Repository Structure

```text
05-Elevator-Controller/
├── README.md
├── docs/
│   ├── 01-requirements-and-design.md
│   ├── 02-fsm-specification.md
│   ├── 03-verification-summary.md
│   └── 04-design-decisions.md
└── 03-rtl-design-and-verification/
    ├── rtl-design/
    │   ├── 01_elevator_controller.v
    │   ├── 02_floor_request_handler.v
    │   ├── 03_door_timer.v
    │   └── 04_seven_segment_display.v
    ├── testbench/
    │   ├── 01_elevator_controller_tb.v
    │   ├── 02_floor_request_handler_tb.v
    │   ├── 03_door_timer_tb.v
    │   └── 04_seven_segment_display_tb.v
    └── verification-results/
```

*Adjust this tree if your actual folder structure differs.*

## Tools Used

- **HDL:** Verilog-2001
- **Simulation:** Icarus Verilog
- **Waveform Analysis:** GTKWave
- **Version Control:** Git and GitHub

## Simulation and Verification

The RTL modules were simulated using Icarus Verilog.

The reported simulation results include:

- Main controller: reset, floor movement, current-floor requests, invalid requests, emergency activation and recovery, and door-timer behavior produced the expected PASS messages.
- Floor request handler: valid request acceptance, invalid request rejection, and request clearing passed.
- Door timer: timer completion and clearing passed.
- Seven-segment display: Floor 0, Floor 1, and Floor 2 output checks passed.

The main simulation also generated a VCD waveform for inspection in GTKWave.

Some safety properties, including explicit checks for simultaneous movement outputs and door closure during emergency, require additional confirmation before being described as fully verified.

## Running the Simulations

Run the following commands from the `03-rtl-design-and-verification` directory.

### 1. Main Elevator Controller

```bash
iverilog -o elevator_test rtl-design/01_elevator_controller.v rtl-design/02_floor_request_handler.v rtl-design/03_door_timer.v rtl-design/04_seven_segment_display.v testbench/01_elevator_controller_tb.v
vvp elevator_test
```

### 2. Floor Request Handler

```bash
iverilog -o floor_request_test rtl-design/02_floor_request_handler.v testbench/02_floor_request_handler_tb.v
vvp floor_request_test
```

### 3. Door Timer

```bash
iverilog -o door_timer_test rtl-design/03_door_timer.v testbench/03_door_timer_tb.v
vvp door_timer_test
```

### 4. Seven-Segment Display

```bash
iverilog -o seven_segment_test rtl-design/04_seven_segment_display.v testbench/04_seven_segment_display_tb.v
vvp seven_segment_test
```

## Waveform Inspection

The simulations generate VCD waveform files that can be inspected using GTKWave.

For example:

```bash
gtkwave 01_elevator_controller.vcd
```

Use the actual waveform filename generated by your testbench if it differs.

## Learning Objectives

- Understand FSM-based RTL design
- Practise sequential and combinational logic in Verilog
- Learn modular hardware design
- Implement request handling and counter-based timing
- Verify RTL using simulation testbenches
- Inspect digital signals and state transitions using waveforms

## Project Status

**Status:** Core RTL simulations completed with the reported test cases passing. Additional explicit safety verification remains to be completed.

## Author

**Pruthviraj Kalashetty**

Electronics and Communication Engineering (ECE)


