# Design Decisions & Trade-offs — Elevator Controller

## 1. FSM Style: Moore vs. Mealy

A Moore FSM was selected for the Elevator Controller because its outputs depend on the current state rather than directly on the input signals.

This approach provides predictable control behavior for elevator movement, door operation, and emergency handling. Outputs such as `move_up`, `move_down`, `door_open`, and `emergency_active` can be controlled through state-based output decoding.

A Mealy FSM was considered as an alternative, but it was not selected because its outputs can change in response to input changes between clock edges. For this controller, state-based outputs provide a clearer and easier-to-verify control structure.

The Moore FSM does not eliminate every possible hardware glitch, but it simplifies output control and makes the intended behavior easier to verify through simulation.

---

## 2. State Encoding: Binary Encoding

Binary state encoding was selected for the seven FSM states:

- `IDLE`
- `MOVE_UP`
- `MOVE_DOWN`
- `DOOR_OPEN`
- `DOOR_TIMER`
- `DOOR_CLOSE`
- `EMERGENCY`

Seven states require at least three state bits because three bits can represent eight distinct values.

Binary encoding therefore uses three state flip-flops, compared with seven flip-flops for a one-hot encoding of the same seven states.

This approach keeps the state register compact and is suitable for this small controller. One-hot encoding could simplify some state-decoding logic, but its additional flip-flops were not considered necessary for the current design.

The final implementation should use fixed internal state encodings declared with `localparam`.

---

## 3. Floor Representation: Binary Encoding

Binary encoding was selected to represent the three supported floors.

| Floor | Binary Encoding |
|---|---|
| Floor 0 | `2'b00` |
| Floor 1 | `2'b01` |
| Floor 2 | `2'b10` |
| Invalid value | `2'b11` |

A two-bit representation is sufficient for the three-floor system and is used for `current_floor`, `floor_request`, and `floor_display`.

The value `2'b11` is reserved as an invalid floor request and must be ignored according to the project requirements.

This representation keeps the interface compact and makes floor comparisons and movement decisions straightforward.

---

## 4. Reset Strategy: Synchronous vs. Asynchronous

A synchronous, active-high reset was selected for the Elevator Controller.

The controller checks the reset signal at the active clock edge. When reset is sampled as active, the design returns to its defined initial condition:

- Current floor is set to Floor 0.
- Movement outputs are disabled.
- The door is closed.
- Emergency status is cleared.
- Internal FSM and timer registers return to their reset values.

A synchronous reset keeps reset handling aligned with the controller's clocked behavior and avoids asynchronous reset assertion or deassertion within the sequential logic.

The reset must establish a safe starting condition before normal operation begins.

---

## 5. Separate Movement and Door-Control States

The FSM uses separate states for movement and door operation:

- `MOVE_UP`
- `MOVE_DOWN`
- `DOOR_OPEN`
- `DOOR_TIMER`
- `DOOR_CLOSE`

These states separate the elevator's movement behavior from its door-control sequence.

The `MOVE_UP` and `MOVE_DOWN` states control travel between floors. Once the requested floor is reached, the controller proceeds to the door sequence. The door remains open for the configured duration before the controller returns to an appropriate idle condition.

Separating these operations makes the control sequence easier to understand, document, and verify. It also helps enforce the safety requirement that the elevator must not move while its door is open.

---

## 6. Timing Mechanism: Parameterized Door Timer

A parameterized counter is used to control the door-open duration.

The parameter `DOOR_OPEN_CYCLES` defines the configured duration in clock cycles, with a default value of 16 cycles.

Using a counter allows the door-open duration to be changed without rewriting the FSM. It also avoids requiring a separate timer module for every possible door-timing operation.

The timer must be reset or initialized at the appropriate point in the door sequence and must expire according to the finalized timing specification.

The exact counter comparison and state-transition cycle must be implemented consistently with `04-timing-specification.md` to prevent off-by-one timing errors.

---

## 7. Parameters vs. Localparam

Parameters and local parameters serve different purposes in the design.

**Configurable parameters:**

- `DOOR_OPEN_CYCLES` — controls the configured door-open duration.

This value is intended to be configurable when the module is instantiated.

**Internal local parameters:**

- FSM state encodings, such as `IDLE`, `MOVE_UP`, `MOVE_DOWN`, `DOOR_OPEN`, `DOOR_TIMER`, `DOOR_CLOSE`, and `EMERGENCY`.

These encodings define the internal state representation and are not intended to be changed by the module user.

Keeping timing configuration separate from internal state encoding improves readability and makes the design easier to maintain.

---

## 8. Alternatives Considered and Rejected

The following alternatives were considered during the design process:

- **One-hot FSM encoding:** Not selected because binary encoding requires fewer state flip-flops for the seven-state controller.
- **Separate timer counters for each door-related state:** Not selected because a reusable counter can simplify the timing logic and reduce duplicated counter hardware, provided its reset and reuse behavior are implemented correctly.
- **Immediate return to IDLE without a dedicated door-timing sequence:** Not selected because the requirements specify that the door must remain open for a configured duration before closing.
- **Multiple queued floor requests:** Not included in Version 1 because the current design scope covers a single two-bit floor-request interface rather than a request queue or scheduling system.

These choices keep the initial implementation focused on the specified three-floor behavior while leaving room for future extensions.

---

## 9. Known Limitations (Version 1 Scope)

The current design is limited to the requirements defined for Version 1.

Known limitations include:

- The controller supports only three floors: Floor 0, Floor 1, and Floor 2.
- Only one floor-request interface is provided.
- Invalid floor requests (`2'b11`) are ignored.
- The door-open duration is controlled by a fixed, configurable cycle count.
- Multiple queued requests and request-scheduling algorithms are not included.
- Door obstruction detection and overload detection are not included.
- Independent door timing for different floors is not included.
- Physical elevator hardware, motor drivers, sensors, and door actuators are outside the current RTL and simulation scope.
- FPGA implementation and hardware demonstration are not required for this version.

These limitations are consistent with the project scope defined in `01-requirements-and-specification.md`.

Future versions may introduce request queues, additional floors, obstruction detection, overload protection, and more advanced scheduling behavior.

---

## 10. Validation from Simulation

**Verification status: Pending implementation and simulation.**

The RTL schematic and simulation waveform will be reviewed after all required RTL modules and testbenches have been implemented.

The waveform will be used to verify:

- Correct reset behavior.
- Correct movement between the three supported floors.
- Correct direction-control outputs.
- Door opening at the requested destination.
- Door timing and automatic closing.
- Rejection of invalid floor requests.
- Emergency-stop priority and recovery through reset.
- The safety requirement that `move_up` and `move_down` are never asserted simultaneously.
- The safety requirement that the elevator does not move while the door is open.

The RTL schematic will be inspected to confirm that the intended controller and supporting modules are represented in the synthesized logic view, if a schematic is generated as part of the chosen tool workflow.

Simulation results must be recorded only after the relevant test cases have actually been executed. No PASS or FAIL result is claimed in this document at this stage.

Planned verification artifacts:

- `../results/elevator_controller_waveform.png`
- `../results/door_timer_waveform.png`
- `../results/verification-results.png`

The final verification report will be maintained in `../reports/verification-report.md` after simulation is complete.
