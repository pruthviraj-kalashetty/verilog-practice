# Verification Summary — Elevator Controller

## 1. Overview

The Elevator Controller will be verified using a Verilog testbench and behavioral simulation. Verification covers reset behavior, floor movement, the full FSM state sequence, door timing, correct output decoding, invalid floor requests, and emergency-stop behavior.

The design will be simulated using Icarus Verilog, and the waveform will be inspected in GTKWave.

---

## 2. Verification Environment

| Item | Details |
|---|---|
| HDL | Verilog-2001 (synthesizable subset) |
| Simulation Tool | Icarus Verilog |
| Waveform Viewer | GTKWave |
| Main Testbench | `elevator_controller_tb.v` |
| Door Timer Testbench | `door_timer_tb.v` |
| Seven-Segment Display Testbench | `seven_segment_display_tb.v` |
| Main Waveform File | `elevator_controller.vcd` |
| Door Timer Waveform File | `door_timer.vcd` |
| Seven-Segment Display Waveform File | `seven_segment_display.vcd` |
| Clock Period | To be finalized in the testbench |
| `DOOR_OPEN_CYCLES` | 16 cycles by default |
| Simulation Length | To be finalized after timing verification |

**Note:** The simulation must run long enough to cover the requested floor movement, door-opening interval, door-timer expiration, door closure, and return to `IDLE`. The required simulation length depends on the implemented state-transition and counter behavior.

---

## 3. Test Cases

| Test Case | Scenario | Expected Behavior | Status |
|---|---|---|---|
| TC-01 | Apply synchronous reset | Controller enters `IDLE`, current floor becomes Floor 0, movement stops, door closes, and emergency indication clears | PENDING |
| TC-02 | Request Floor 1 from Floor 0 | Elevator moves upward and reaches Floor 1 | PENDING |
| TC-03 | Request Floor 2 from Floor 0 | Elevator moves through Floor 1 and reaches Floor 2 | PENDING |
| TC-04 | Request Floor 0 from Floor 2 | Elevator moves downward through Floor 1 and reaches Floor 0 | PENDING |
| TC-05 | Request Floor 1 from Floor 2 | Elevator moves downward and reaches Floor 1 | PENDING |
| TC-06 | Request the current floor | Elevator remains stopped and proceeds to the door-open phase | PENDING |
| TC-07 | Door timer expiration | Door remains open for the configured interval and then closes | PENDING |
| TC-08 | Apply invalid floor request `2'b11` | Invalid request is ignored and does not cause movement | PENDING |
| TC-09 | Assert emergency stop during movement | Elevator stops, door closes, and `emergency_active` becomes `1` | PENDING |
| TC-10 | Apply reset during emergency | Controller returns to `IDLE`, initializes Floor 0, and clears the emergency indication | PENDING |
| TC-11 | Check simultaneous movement outputs | `move_up` and `move_down` are never asserted together | PENDING |

---

## 4. FSM Sequence

    IDLE → MOVE_UP → DOOR_OPEN → DOOR_TIMER → DOOR_CLOSE → IDLE

    IDLE → MOVE_DOWN → DOOR_OPEN → DOOR_TIMER → DOOR_CLOSE → IDLE

    IDLE → DOOR_OPEN → DOOR_TIMER → DOOR_CLOSE → IDLE
           (request for the current floor)

    Any normal state → EMERGENCY
    EMERGENCY → remains in EMERGENCY until reset

The final state sequence depends on the requested floor and the elevator's current floor. The upward and downward movement states shall continue until the requested destination is reached.

The `DOOR_OPEN` and `DOOR_TIMER` states maintain the door-open condition. After the configured timing interval expires, the controller enters `DOOR_CLOSE` and then returns to `IDLE`.

The complete FSM sequence and the emergency transition must be confirmed using the simulated waveform.

---

## 5. Safety Verification

| Safety Rule | Expected Result | Status |
|---|---|---|
| `move_up` and `move_down` are never both asserted | No simultaneous movement directions | PENDING |
| Elevator does not move while the door is open | Both movement outputs remain `0` when `door_open = 1` | PENDING |
| Current floor remains between Floor 0 and Floor 2 | No invalid floor values during normal operation | PENDING |
| Door remains closed during movement | `door_open = 0` in `MOVE_UP` and `MOVE_DOWN` | PENDING |
| Emergency disables movement and closes the door | Movement outputs are `0`, `door_open = 0`, and `emergency_active = 1` | PENDING |
| Invalid floor requests are ignored | Request `2'b11` does not cause movement | PENDING |
| Door opens only after the requested floor is reached | The elevator reaches the destination before opening the door | PENDING |
| Reset restores the initial condition | Controller returns to `IDLE` at Floor 0 with safe outputs | PENDING |

---

## 6. Reset Verification

On synchronous reset (`reset = 1` at `posedge clk`):

- State becomes `IDLE`.
- `current_floor` becomes Floor 0.
- `move_up = 0`.
- `move_down = 0`.
- `door_open = 0`.
- `emergency_active = 0`.
- The door timer counter clears to `0`.

These conditions must be confirmed in the GTKWave waveform and checked by the testbench.

**Status: PENDING**

---

## 7. Verification Artifacts

- `elevator_controller.v` — Main RTL design
- `floor_request_handler.v` — Floor request handling logic
- `door_timer.v` — Door timing logic
- `seven_segment_display.v` — Seven-segment display decoder
- `elevator_controller_tb.v` — Main controller testbench
- `door_timer_tb.v` — Door timer testbench
- `seven_segment_display_tb.v` — Seven-segment display testbench
- `elevator_controller.vcd` — Main controller simulation waveform database
- `door_timer.vcd` — Door timer simulation waveform database
- `seven_segment_display.vcd` — Display simulation waveform database
- `elevator_controller_waveform.png` — Main GTKWave waveform screenshot
- `door_timer_waveform.png` — Door timer waveform screenshot
- `verification-results.png` — Verification results screenshot

---

## 8. Conclusion

The Elevator Controller verification plan covers reset behavior, upward and downward floor movement, destination handling, door timing, invalid requests, emergency-stop operation, and movement safety.

The design will be considered verified only after the testbench results and simulation waveforms confirm the expected behavior for all required test cases.

**Current Status: Verification pending.** The RTL modules and testbenches must be implemented and simulated before any test case can be marked PASS or FAIL. This document should be updated with the actual simulation results before the project is declared verified.
