# Requirements and Design

| Field | Value |
|---|---|
| Document version | 1.0 |
| Status | Approved for implementation |
| Target HDL | Verilog-2001 synthesizable subset |
| Design style | Parameterized Moore FSM |

## 1. Project purpose

Design and verify a synthesizable Verilog controller for a three-floor elevator system. The controller operates between three floors:

- **Floor 0**
- **Floor 1**
- **Floor 2**

The controller accepts a destination floor request, controls elevator movement between floors, manages door operation, and provides current-floor and status indications. An emergency-stop input is included to place the elevator into a safe emergency state.

## 2. Scope

### Included in version 1

- A synchronous finite-state-machine (FSM) controller.
- A single clock input and synchronous active-high reset.
- Three-floor operation using Floor 0, Floor 1, and Floor 2.
- Valid floor requests for Floor 0, Floor 1, and Floor 2.
- Upward and downward elevator movement.
- Fixed, parameterized door-open duration.
- Door open and door close control.
- Current-floor indication.
- Emergency-stop control and emergency state.
- Individual RTL modules for elevator control, floor request handling, door timing, and floor display.
- Verilog testbenches for functional verification of the major RTL modules.

### Not included in version 1

- Multiple simultaneous floor-request scheduling.
- Nearest-floor or optimized request scheduling.
- Multiple elevators.
- Door-obstruction detection.
- Overload detection.
- Physical FPGA implementation.
- UART or external communication interface.
- Real-time clock or real-world second-based timing hardware.

These features can be added as later versions without changing the basic elevator control and safety model.

## 3. Functional requirements

| ID | Requirement |
|---|---|
| FR-01 | After reset, the elevator must be at Floor 0, stopped, with the door closed and emergency mode inactive. |
| FR-02 | The controller must accept valid destination requests for Floor 0, Floor 1, and Floor 2. |
| FR-03 | The elevator must move upward when the requested floor is above the current floor. |
| FR-04 | The elevator must move downward when the requested floor is below the current floor. |
| FR-05 | The elevator must remain stopped when the requested floor is the current floor. |
| FR-06 | The elevator must move by one floor per clock cycle while in the corresponding movement state. |
| FR-07 | The elevator must stop when the requested destination floor is reached. |
| FR-08 | The door must open after the elevator reaches the requested floor. |
| FR-09 | The door-open interval must last `DOOR_OPEN_CYCLES` clock cycles. |
| FR-10 | The door must close after the configured door-open interval expires. |
| FR-11 | The elevator must remain stopped while the door is open. |
| FR-12 | The current floor must be available through the `current_floor` output. |
| FR-13 | The value `2'b11` must be treated as an invalid floor request and must not cause elevator movement. |
| FR-14 | The controller must process another valid floor request after completing the current operation. |
| FR-15 | The controller must stop immediately and enter emergency mode when `emergency_stop` is asserted. |
| FR-16 | The controller must ignore floor requests while emergency mode is active. |
| FR-17 | The controller must exit emergency mode only after reset is applied. |

## 4. Safety requirements

| ID | Requirement |
|---|---|
| SR-01 | The elevator must never move upward and downward at the same time. |
| SR-02 | The elevator must never move outside the valid floor range of Floor 0 to Floor 2. |
| SR-03 | The elevator must remain stopped while the door is open. |
| SR-04 | The door must not open before the elevator reaches the requested destination floor. |
| SR-05 | Reset must place the controller in a known safe state: Floor 0, stopped, door closed, and emergency mode inactive. |
| SR-06 | An invalid floor request `2'b11` must not cause unintended elevator movement. |
| SR-07 | Emergency stop must have priority over normal elevator operation. |
| SR-08 | During emergency mode, the elevator must remain stopped and the door must remain closed. |
| SR-09 | Floor requests must be ignored while the controller is in the EMERGENCY state. |
| SR-10 | Emergency mode must only be cleared by reset. |

## 5. Interface definition

| Signal | Direction | Width | Description |
|---|---:|---:|---|
| `clk` | Input | 1 | System clock; state, floor, and timer update on its rising edge. |
| `reset` | Input | 1 | Active-high synchronous reset, sampled on the rising edge of `clk`. |
| `floor_request` | Input | 2 | Requested destination floor. |
| `emergency_stop` | Input | 1 | Active-high emergency-stop request. |
| `current_floor` | Output | 2 | Indicates the elevator's current floor. |
| `move_up` | Output | 1 | Indicates upward elevator movement. |
| `move_down` | Output | 1 | Indicates downward elevator movement. |
| `door_open` | Output | 1 | Indicates that the elevator door is open. |
| `floor_display` | Output | 2 | Represents the current floor for display logic. |
| `emergency_active` | Output | 1 | Indicates that emergency-stop mode is active. |

### Floor encoding

The floor request and current-floor values use binary encoding.

| Name | Value | Meaning |
|---|---:|---|
| `FLOOR_0` | `2'b00` | Floor 0 |
| `FLOOR_1` | `2'b01` | Floor 1 |
| `FLOOR_2` | `2'b10` | Floor 2 |
| `INVALID` | `2'b11` | Invalid floor request |

## 6. FSM State Definition

The design is implemented as a 7-state Moore finite-state machine. Control outputs depend strictly on the active state, and state transitions occur according to the current floor, requested floor, emergency condition, and configured door-timer duration.

| State | Encoding | `move_up` | `move_down` | `door_open` | `emergency_active` | Duration / Condition | Next State |
|---|:---:|:---:|:---:|:---:|:---:|---|---|
| `IDLE` | `3'b000` | `0` | `0` | `0` | `0` | Wait for a valid request | `MOVE_UP`, `MOVE_DOWN`, `DOOR_OPEN`, or `IDLE` |
| `MOVE_UP` | `3'b001` | `1` | `0` | `0` | `0` | One floor per clock cycle | `MOVE_UP` or `DOOR_OPEN` |
| `MOVE_DOWN` | `3'b010` | `0` | `1` | `0` | `0` | One floor per clock cycle | `MOVE_DOWN` or `DOOR_OPEN` |
| `DOOR_OPEN` | `3'b011` | `0` | `0` | `1` | `0` | Door opening state | `DOOR_TIMER` |
| `DOOR_TIMER` | `3'b100` | `0` | `0` | `1` | `0` | `DOOR_OPEN_CYCLES` clock cycles | `DOOR_TIMER` or `DOOR_CLOSE` |
| `DOOR_CLOSE` | `3'b101` | `0` | `0` | `0` | `0` | Door closing state | `IDLE` |
| `EMERGENCY` | `3'b110` | `0` | `0` | `0` | `1` | Remains active until reset | `EMERGENCY` or `IDLE` |

* **Invalid State (`3'b111`):** Default recovery shall force the controller to a safe `IDLE` condition with movement disabled, door closed, and emergency mode inactive.

## 7. Timing assumptions

- All time values are expressed in **clock cycles**, not seconds.
- The external simulation environment is responsible for selecting the clock frequency when relating simulation cycles to real-world time.
- The elevator moves by one floor per clock cycle while in `MOVE_UP` or `MOVE_DOWN`.
- The door-open duration is controlled by the `DOOR_OPEN_CYCLES` parameter.
- `DOOR_OPEN_CYCLES` must be a positive integer.
- The default door-open duration is `DOOR_OPEN_CYCLES = 16`.
- The door timer begins when the controller enters the `DOOR_TIMER` state.
- The elevator remains stopped while the controller is in `DOOR_OPEN`, `DOOR_TIMER`, or `DOOR_CLOSE`.
- Emergency stop has priority over normal state operation.
- While in `EMERGENCY`, the controller remains stopped until reset is asserted.
- Version 1 uses one common door-open duration for all floors.

## 8. Verification acceptance criteria

The testbench must demonstrate all of the following:

1. Reset initializes the elevator at Floor 0 with the door closed and movement stopped.
2. A request from Floor 0 to Floor 1 causes the elevator to move upward and stop at Floor 1.
3. A request from Floor 0 to Floor 2 causes the elevator to move upward through Floor 1 and stop at Floor 2.
4. A request from Floor 2 to Floor 0 causes the elevator to move downward through Floor 1 and stop at Floor 0.
5. A request from Floor 2 to Floor 1 causes the elevator to move downward and stop at Floor 1.
6. A request for the current floor causes the elevator to remain stopped and open the door.
7. The door remains open for the configured `DOOR_OPEN_CYCLES` duration.
8. The door closes after the timer expires and the controller returns to `IDLE`.
9. An invalid request `2'b11` does not cause elevator movement.
10. An emergency stop during movement stops the elevator and enters the `EMERGENCY` state.
11. Floor requests are ignored while the controller is in the `EMERGENCY` state.
12. Reset during `EMERGENCY` returns the controller to Floor 0 and `IDLE`.
13. No sampled clock cycle has both `move_up` and `move_down` active.
14. The current-floor indication always remains within the valid Floor 0 to Floor 2 range.

## 9. Future enhancement path

Future revisions can add additional request handling and safety features while preserving the basic rule that the elevator must remain within the valid floor range and conflicting movement commands must never be active together. Suitable next additions are multiple floor-request inputs, nearest-floor request scheduling, elevator-call buttons for each floor, door-obstruction detection, overload detection, FPGA implementation using switches, LEDs, and a seven-segment display, UART-based elevator-status monitoring, and support for more floors.

## 10. Related Engineering Documentation

- [FSM Specification](./03-fsm-specification.md)
- [Timing Specification](./04-timing-specification.md)
- [Verification Plan](./05-verification-plan.md)
- [Design Decisions](./06-design-decisions.md)
