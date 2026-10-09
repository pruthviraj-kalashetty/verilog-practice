# Timing Specification

## 1. Overview

The elevator controller uses a synchronous timing model in which state transitions, floor updates, and timer operations are coordinated with the rising edge of `clk`.

The design supports three floors: Floor 0, Floor 1, and Floor 2. The elevator moves one floor at a time, opens the door after reaching the requested floor, and keeps the door open for a configurable number of clock cycles.

The default door-open duration is controlled by the `DOOR_OPEN_CYCLES` parameter. All timing values are expressed in clock cycles rather than physical seconds.

## 2. Clock and Reset Timing

| Parameter or Signal | Description |
|---|---|
| `clk` | System clock used to synchronize the FSM, floor updates, and timer operations. |
| `reset` | Active-high synchronous reset. |
| Rising edge of `clk` | The point at which registered state and counter values are updated. |
| `DOOR_OPEN_CYCLES` | Configurable number of clock cycles for the door-open timing interval. Default value: `16`. |

The FSM and sequential registers update on the rising edge of `clk`.

When `reset = 1` at a rising clock edge:

- The FSM enters `IDLE`.
- `current_floor` is initialized to Floor 0.
- `move_up` and `move_down` are deasserted.
- `door_open` is deasserted.
- `emergency_active` is deasserted.
- The door timer counter is cleared.

Because reset is synchronous, asserting reset between rising clock edges does not immediately update the registered state.

## 3. Floor Movement Timing

The elevator moves one floor at a time toward the requested destination.

| Current Floor | Requested Floor | Movement Direction | Floor Sequence |
|---|---|---|---|
| Floor 0 | Floor 1 | Up | 0 → 1 |
| Floor 0 | Floor 2 | Up | 0 → 1 → 2 |
| Floor 1 | Floor 0 | Down | 1 → 0 |
| Floor 1 | Floor 2 | Up | 1 → 2 |
| Floor 2 | Floor 0 | Down | 2 → 1 → 0 |
| Floor 2 | Floor 1 | Down | 2 → 1 |
| Any valid floor | Same floor | Stopped | No floor change |

During upward movement:

- `move_up = 1`
- `move_down = 0`
- `door_open = 0`

During downward movement:

- `move_up = 0`
- `move_down = 1`
- `door_open = 0`

The current floor must remain within the valid range of Floor 0 through Floor 2.

The exact clock edge on which the first floor update occurs shall be implemented consistently in the RTL and verified in simulation. Each subsequent floor update occurs according to the synchronous movement logic.

## 4. Door Operation Timing

The door operation is divided into three FSM states:

- `DOOR_OPEN`
- `DOOR_TIMER`
- `DOOR_CLOSE`

The `DOOR_OPEN` state initiates the door-open phase. The `DOOR_TIMER` state maintains the open condition while the timer counts. The `DOOR_CLOSE` state deasserts the door-open output before the controller returns to `IDLE`.

### Door Timing Table

| State | `door_open` | Movement | Timing Behavior |
|---|---:|---|---|
| `DOOR_OPEN` | `1` | Stopped | Initiates the door-open phase. |
| `DOOR_TIMER` | `1` | Stopped | Maintains the open condition while the timer counts. |
| `DOOR_CLOSE` | `0` | Stopped | Closes the door and prepares to return to `IDLE`. |

The door timer uses the parameter:

    DOOR_OPEN_CYCLES = 16

The configured duration must satisfy:

    DOOR_OPEN_CYCLES >= 1

The timer must be cleared when reset is asserted and when a new door-timing interval begins.

The precise total duration for which `door_open` remains high depends on the defined entry, counting, and exit behavior of the FSM. The RTL and testbench must use the same counting convention so that the configured duration is verified accurately.

## 5. Door Timer Counter Operation

The door timer counter measures elapsed clock cycles during the `DOOR_TIMER` state.

For a configured duration of `D` cycles:

1. The controller reaches the requested floor.
2. The FSM enters `DOOR_OPEN`.
3. The FSM enters `DOOR_TIMER` and begins the defined counting interval.
4. The counter advances on rising edges of `clk`.
5. When the terminal-count condition is met, the FSM transitions to `DOOR_CLOSE`.
6. The counter is cleared for the next timing interval or by reset.

The counter must not cause the door to close before the configured interval has elapsed.

The timer must not continue a previous interval when a new door-timing interval begins.

The terminal-count comparison and counter update must be designed together to avoid an off-by-one timing error.

## 6. Emergency Stop Timing

The emergency-stop input has priority over normal movement and door-timing transitions.

When `emergency_stop = 1` is sampled at a rising clock edge during normal operation:

- The FSM transitions to `EMERGENCY`.
- `move_up = 0`.
- `move_down = 0`.
- `door_open = 0`.
- `emergency_active = 1`.
- The current floor holds its value.
- Normal floor requests are ignored.

The emergency response is synchronous. The controller updates its registered state and outputs according to the clocked implementation.

Once the FSM enters `EMERGENCY`, it remains there until reset is asserted and sampled on a rising clock edge.

### Emergency Timing Table

| Condition | Expected Timing Behavior |
|---|---|
| Emergency stop asserted between clock edges | No immediate synchronous state update. |
| Emergency stop sampled high at a rising edge | Controller enters the emergency state according to the RTL transition logic. |
| Controller in `EMERGENCY` | Movement remains disabled and the door remains closed. |
| Reset sampled high at a rising edge during emergency | Controller returns to `IDLE` with the current floor initialized to Floor 0. |

## 7. Timing Diagram

The following conceptual timing sequence illustrates a request to move from Floor 0 to Floor 1. It is not a cycle-accurate waveform; the exact edge alignment depends on the RTL implementation.

    Clock edge       E0       E1       E2       E3       E4       E5
                      |        |        |        |        |        |
    clk             _/‾\_____/‾\_____/‾\_____/‾\_____/‾\_____/‾\_

    Request          ____|‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾
    FSM state        IDLE    MOVE_UP  MOVE_UP  DOOR_OPEN DOOR_TIMER ...
    move_up           0        1        1        0        0
    move_down         0        0        0        0        0
    door_open         0        0        0        1        1
    current_floor     0        0        1        1        1

The example shows the intended behavior: the elevator moves toward the requested floor, stops after reaching it, and then opens the door. Exact transition edges must be confirmed using the simulated waveform.

## 8. Timing Verification Requirements

The testbench must verify the following timing behaviors:

| Test Case | Timing Scenario | Expected Result |
|---|---|---|
| `TC-01` | Synchronous reset | State and outputs initialize correctly on the active clock edge. |
| `TC-02` | Floor 0 to Floor 1 | Elevator moves upward and reaches Floor 1. |
| `TC-03` | Floor 0 to Floor 2 | Elevator passes through Floor 1 and reaches Floor 2. |
| `TC-04` | Floor 2 to Floor 0 | Elevator passes through Floor 1 and reaches Floor 0. |
| `TC-05` | Floor 2 to Floor 1 | Elevator moves downward and reaches Floor 1. |
| `TC-06` | Request for the current floor | Elevator remains stopped and proceeds to the door-open phase. |
| `TC-07` | Door timer expiry | Door remains open for the configured interval and then closes. |
| `TC-08` | Invalid floor request `2'b11` | Invalid request is ignored and does not cause movement. |
| `TC-09` | Emergency stop during movement | Movement is disabled and the controller enters `EMERGENCY` at the defined synchronous transition. |
| `TC-10` | Reset during emergency | Controller returns to `IDLE` and initializes the current floor to Floor 0. |
| `TC-11` | Simultaneous movement-output check | `move_up` and `move_down` are never asserted together. |

The verification process shall use simulation waveforms to confirm state transitions, floor updates, door timing, reset behavior, and emergency-stop response.

## 9. Related Engineering Documentation

- [Requirements and Specification](./01-requirements-and-specification.md)
- [FSM Specification](./02-fsm-specification.md)
- [Verification Plan](./05-verification-plan.md)
- [Design Decisions](./06-design-decisions.md)
- [Project README](../README.md)
