# Requirements and Design

| Field | Value |
|---|---|
| Document version | 1.1 |
| Status | Approved for implementation |
| Target HDL | Verilog-2001 synthesizable subset |
| Design style | Parameterized Moore FSM |

## 1. Project purpose

Design and verify a synthesizable Verilog controller for a standard four-way road intersection. The controller operates two opposing traffic flows:

- **North/South (NS)**
- **East/West (EW)**

Each flow receives a red, yellow, or green indication. Opposing directions in the same flow share an indication; for example, northbound and southbound traffic are both represented by the NS output.

## 2. Scope

### Included in version 1

- A synchronous finite-state-machine (FSM) controller.
- A single clock input and synchronous active-high reset.
- Fixed, parameterized durations for green, yellow, and all-red intervals.
- Individual 3-bit outputs for NS and EW lights.
- A Verilog testbench that checks the normal sequence and reset behavior.

### Not included in version 1

- Pedestrian crossing requests.
- Vehicle sensors, adaptive timing, or traffic-priority rules.
- Flashing operation, fault detection, or emergency-vehicle pre-emption.
- Separate left-turn phases.
- Physical signal-driver circuitry or clock-divider hardware.

These features can be added as later versions without changing the basic safety model.

## 3. Functional requirements

| ID | Requirement |
|---|---|
| FR-01 | After reset, NS must be green and EW must be red. |
| FR-02 | The controller must follow this repeating order: NS green → NS yellow → all red → EW green → EW yellow → all red → NS green. |
| FR-03 | A green interval must last `GREEN_CYCLE` clock cycles. |
| FR-04 | A yellow interval must last `YELLOW_CYCLE` clock cycles. |
| FR-05 | Each all-red clearance interval must last `ALL_RED_CYCLE` clock cycles. |
| FR-06 | During either green or yellow interval, the other traffic flow must remain red. |
| FR-07 | During an all-red interval, both traffic flows must be red. |
| FR-08 | The timing parameters must be compile-time Verilog parameters, allowing different timing plans without changing the FSM logic. |

## 4. Safety requirements

| ID | Requirement |
|---|---|
| SR-01 | NS and EW must never both be green. |
| SR-02 | NS and EW must never both be yellow. |
| SR-03 | Every change of right-of-way must include an all-red clearance state. |
| SR-04 | Reset and invalid FSM states must produce a safe state: NS green and EW red after reset; both red while an invalid state is being recovered. |

## 5. Interface definition

| Signal | Direction | Width | Description |
|---|---:|---:|---|
| `clk` | Input | 1 | System clock; state and timer update on its rising edge. |
| `reset` | Input | 1 | Active-high synchronous reset, sampled on the rising edge of `clk`. |
| `north_south` | Output | 3 | NS traffic-light indication. |
| `east_west` | Output | 3 | EW traffic-light indication. |

### Light encoding

The output is one-hot encoded to simplify connection to three separate lamps.

| Name | Value | Meaning |
|---|---:|---|
| `RED` | `3'b100` | Stop |
| `YELLOW` | `3'b010` | Prepare to stop |
| `GREEN` | `3'b001` | Proceed |

## 6. FSM State Definition

The design is implemented as a 6-state Moore finite-state machine. Light outputs depend strictly on the active state, and state transitions occur once the elapsed clock count matches the configured parameter duration.

| State | Encoding | NS Output (`north_south`) | EW Output (`east_west`) | Duration (Cycles) | Next State |
|---|:---:|:---:|:---:|:---:|---|
| `NS_GREEN` | `3'b000` | `GREEN` (`3'b001`) | `RED` (`3'b100`) | `GREEN_CYCLES` | `NS_YELLOW` |
| `NS_YELLOW` | `3'b001` | `YELLOW` (`3'b010`) | `RED` (`3'b100`) | `YELLOW_CYCLES` | `ALL_RED_TO_EW` |
| `ALL_RED_TO_EW` | `3'b010` | `RED` (`3'b100`) | `RED` (`3'b100`) | `ALL_RED_CYCLES` | `EW_GREEN` |
| `EW_GREEN` | `3'b011` | `RED` (`3'b100`) | `GREEN` (`3'b001`) | `GREEN_CYCLES` | `EW_YELLOW` |
| `EW_YELLOW` | `3'b100` | `RED` (`3'b100`) | `YELLOW` (`3'b010`) | `YELLOW_CYCLES` | `ALL_RED_TO_NS` |
| `ALL_RED_TO_NS` | `3'b101` | `RED` (`3'b100`) | `RED` (`3'b100`) | `ALL_RED_CYCLES` | `NS_GREEN` |

* **Invalid States (`3'b110`, `3'b111`):** Default recovery transitions immediately to `ALL_RED_TO_NS` with both outputs forced to `RED` (`3'b100`).
  

## 7. Timing assumptions

- All time values are expressed in **clock cycles**, not seconds.
- The external system is responsible for selecting a clock frequency and converting real-world seconds to parameter values. For example, with a 1 Hz clock, `GREEN_TIME = 30` means a 30-second green phase.
- `GREEN_TIME`, `YELLOW_TIME`, and `ALL_RED_TIME` must be positive integers.
- Version 1 gives NS and EW equal green durations. Independent `NS_GREEN_TIME` and `EW_GREEN_TIME` parameters may be introduced later if the junction needs unequal timings.

## 8. Verification acceptance criteria

The testbench must demonstrate all of the following:

1. Reset initializes NS to green and EW to red.
2. Each state appears in the required order.
3. Each state remains active for its configured number of clock cycles.
4. Both outputs are red during both clearance states.
5. No sampled clock cycle has green on both NS and EW.
6. The FSM repeats from `ALL_RED_2` back to `NS_GREEN`.

## 9. Future enhancement path

Future revisions can add request inputs and additional states while preserving the safety rule that conflicting flows are never permitted together. Suitable next additions are pedestrian phases, sensor-triggered green extensions, independent NS/EW green durations, and an emergency all-red override.

## 10. Related Engineering Documentation


- [FSM Specification](./fsm-specification.md)
- [Verification Summary](./verification-summary.md)
- [Design Decisions & Trade-offs](./design-decisions.md)

