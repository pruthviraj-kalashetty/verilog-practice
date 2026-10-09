# FSM Specification

## 1. Overview

The elevator controller is a seven-state Moore finite-state machine (FSM). Its control outputs are determined only by the active state. A counter measures the number of clock cycles spent in the door-timing state.

The FSM advances only on the rising edge of `clk`. The `reset` signal is active-high and synchronously initializes the controller to the safe starting state when sampled on that edge.

The controller manages a three-floor elevator: Floor 0, Floor 1, and Floor 2. It supports floor requests, upward and downward movement, automatic door operation, and an emergency-stop condition.

## 2. States

| State | Code | Movement | Door | Purpose |
|---|---:|---|---|---|
| `IDLE` | `3'd0` | Stopped | Closed | Wait for a valid floor request or remain stopped when no movement is required. |
| `MOVE_UP` | `3'd1` | Up | Closed | Move the elevator upward toward the requested floor. |
| `MOVE_DOWN` | `3'd2` | Down | Closed | Move the elevator downward toward the requested floor. |
| `DOOR_OPEN` | `3'd3` | Stopped | Open | Open the door after the requested floor is reached. |
| `DOOR_TIMER` | `3'd4` | Stopped | Open | Keep the door open while the door timer counts the configured cycles. |
| `DOOR_CLOSE` | `3'd5` | Stopped | Closed | Close the door after the configured open duration expires. |
| `EMERGENCY` | `3'd6` | Stopped | Closed | Stop elevator movement, close the door, indicate the emergency condition, and remain in emergency mode until reset. |

The `DOOR_OPEN` and `DOOR_TIMER` states have the same movement and door outputs. They are separate states to distinguish the door-opening phase from the timed door-open interval.

The `DOOR_CLOSE` state provides a distinct phase between door operation and returning to `IDLE`.

The `EMERGENCY` state has priority over normal operation. Once entered, the controller remains in this state until reset is asserted.

## 3. State-transition sequence

                         Valid request
                              |
                              v
                         +---------+
                         |  IDLE   |
                         +---------+
                          /       \
                Request > floor   Request < floor
                       /             \
                      v               v
                +----------+    +-----------+
                | MOVE_UP  |    | MOVE_DOWN |
                +----------+    +-----------+
                       \             /
                        \           /
                         v         v
                       Requested floor reached
                              |
                              v
                        +-----------+
                        | DOOR_OPEN |
                        +-----------+
                              |
                              v
                        +------------+
                        | DOOR_TIMER |
                        +------------+
                              |
                    Door timer expired
                              |
                              v
                        +------------+
                        | DOOR_CLOSE |
                        +------------+
                              |
                              v
                          +---------+
                          |  IDLE   |
                          +---------+

    Emergency stop asserted from any normal state
                              |
                              v
                        +-----------+
                        | EMERGENCY |
                        +-----------+
                              |
                    Remains until reset

### State Transition Table

| Current state | Transition condition | Next state |
|---|---|---|
| `IDLE` | Valid request is above the current floor | `MOVE_UP` |
| `IDLE` | Valid request is below the current floor | `MOVE_DOWN` |
| `IDLE` | Valid request equals the current floor | `DOOR_OPEN` |
| `IDLE` | No valid request is available | `IDLE` |
| `MOVE_UP` | Requested floor has not been reached | `MOVE_UP` |
| `MOVE_UP` | Requested floor is reached | `DOOR_OPEN` |
| `MOVE_DOWN` | Requested floor has not been reached | `MOVE_DOWN` |
| `MOVE_DOWN` | Requested floor is reached | `DOOR_OPEN` |
| `DOOR_OPEN` | Door-opening phase completes | `DOOR_TIMER` |
| `DOOR_TIMER` | Door timer has not expired | `DOOR_TIMER` |
| `DOOR_TIMER` | Door timer expires | `DOOR_CLOSE` |
| `DOOR_CLOSE` | Door-close phase completes | `IDLE` |
| Any normal state | `emergency_stop = 1` | `EMERGENCY` |
| `EMERGENCY` | Reset is not asserted | `EMERGENCY` |
| `EMERGENCY` | `reset = 1` at a rising clock edge | `IDLE` |

The invalid request `2'b11` shall be ignored and shall not cause elevator movement.

## 4. Counter Operation

The internal door timer counter tracks the elapsed clock cycles while the elevator door is open.

The default door-open duration is configured by the parameter `DOOR_OPEN_CYCLES`, with a default value of 16 clock cycles.

For a configured door-open duration of `D` cycles:

1. The controller enters the `DOOR_OPEN` state after reaching the requested floor.
2. The controller proceeds to `DOOR_TIMER`, where the door remains open and the counter begins tracking elapsed cycles.
3. The door remains open while the counter has not reached the terminal count.
4. When the terminal count is reached at a rising clock edge, the FSM transitions to `DOOR_CLOSE`.
5. The counter is cleared when a new timing interval begins or when reset is asserted.

The door timer duration is expressed in clock cycles rather than physical seconds.

The timing parameter shall satisfy:

    DOOR_OPEN_CYCLES >= 1

The exact cycle on which the counter begins incrementing and the transition to `DOOR_CLOSE` occurs shall be implemented consistently in the RTL and verified in the testbench.

## 5. Reset and recovery behavior

| Condition | FSM state after condition | Current floor | Outputs |
|---|---|---:|---|
| `reset = 1` at a rising clock edge | `IDLE` | Floor 0 | Stopped, door closed, emergency inactive |
| `emergency_stop = 1` during normal operation | `EMERGENCY` | Holds the current floor | Stopped, door closed, emergency active |
| Reset asserted while in `EMERGENCY` | `IDLE` | Floor 0 | Stopped, door closed, emergency inactive |
| Unknown/invalid state at a clock edge | `IDLE` | Floor 0 | Safe stopped outputs |

The reset state is intentionally deterministic. It initializes the elevator at Floor 0 with movement disabled, the door closed, and the emergency indication inactive.

The emergency state prevents normal requests from causing movement. The controller remains in this state until reset is sampled on a rising clock edge.

### Reset Sequence

    reset = 1
        |
        v
    Next rising edge of clk
        |
        +-- state = IDLE
        +-- current_floor = 0
        +-- move_up = 0
        +-- move_down = 0
        +-- door_open = 0
        +-- emergency_active = 0

Because the reset is synchronous, asserting `reset` between clock edges does not immediately change the registered FSM state.

## 6. Output-decoding rules

| FSM state class | `move_up` | `move_down` | `door_open` | `emergency_active` |
|---|---:|---:|---:|---:|
| `IDLE` | `0` | `0` | `0` | `0` |
| `MOVE_UP` | `1` | `0` | `0` | `0` |
| `MOVE_DOWN` | `0` | `1` | `0` | `0` |
| `DOOR_OPEN` | `0` | `0` | `1` | `0` |
| `DOOR_TIMER` | `0` | `0` | `1` | `0` |
| `DOOR_CLOSE` | `0` | `0` | `0` | `0` |
| `EMERGENCY` | `0` | `0` | `0` | `1` |
| Invalid state | `0` | `0` | `0` | `0` |

The `current_floor` output represents the elevator's current floor. It changes in accordance with the movement logic and must remain within the supported range of Floor 0 through Floor 2.

The `floor_display` output represents the floor value supplied to the display logic. It shall correspond to the current floor.

The following movement rules apply:

    move_up = 1   → Elevator moves toward a higher floor
    move_down = 1 → Elevator moves toward a lower floor
    move_up = 0 and move_down = 0 → Elevator is stopped

The door must remain closed during movement and in the emergency state. The elevator must remain stopped whenever `door_open = 1`.

## 7. Safety invariants

The implementation and testbench must preserve these properties at every sampled clock edge:

    NOT (move_up == 1 AND move_down == 1)

    door_open == 1
        → move_up == 0 AND move_down == 0

    current_floor >= 0 AND current_floor <= 2

    emergency_active == 1
        → move_up == 0 AND move_down == 0 AND door_open == 0

In simpler terms:

- The elevator shall never move upward and downward simultaneously.
- The elevator shall not move while its door is open.
- The current floor shall remain within Floor 0, Floor 1, and Floor 2.
- The door shall remain closed during movement.
- The emergency condition shall disable movement and close the door.
- Invalid floor requests shall not cause movement.
- Reset shall return the controller to the defined initial condition.
- A requested floor shall be reached before the door opens.
- The controller shall not accept normal movement requests while in the emergency state.

## 8. Implementation mapping

The RTL separates its responsibilities into logical sections:

- **Sequential state logic:** updates the FSM state and registered values on `clk` or `reset`.
- **Next-state logic:** determines the next FSM state from the current state, floor request, current floor, timer status, and emergency condition.
- **Output logic:** decodes the active state into movement, door, and emergency outputs.
- **Floor request handling:** interprets valid floor requests and supplies the requested destination to the controller.
- **Door timer:** counts the configured door-open interval.
- **Seven-segment display logic:** converts the floor value into a segment pattern for displaying the current floor.

The implementation shall use the Verilog-2001 synthesizable subset and the agreed parameterized Moore FSM structure.

The emergency-stop condition must take priority over normal movement and door-timing transitions. The testbench shall verify this behavior, including an emergency request during elevator movement.

## 9. Related Engineering Documentation

- [Requirements and Specification](./01-requirements-and-specification.md)
- [Timing Specification](./03-timing-specification.md)
- [Verification Plan](./04-verification-plan.md)
- [Design Decisions](./05-design-decisions.md)
- [Project README](../README.md)
