# Requirements and Design

| Field            | Value                             |
| ---------------- | --------------------------------- |
| Document version | 1.1                               |
| Status           | Approved for implementation       |
| Target HDL       | Verilog-2001 synthesizable subset |
| Design style     | Parameterized synchronous counter |

## 1. Project purpose

Design and verify a synthesizable Verilog digital stopwatch for measuring elapsed time using a synchronous clock. The stopwatch provides separate time fields for:

- **Minutes**
- **Seconds**
- **Sub-seconds**

The design counts upward while running and provides control inputs for starting, stopping, and resetting the elapsed-time measurement.

## 2. Scope

### Included in version 1

- A synchronous digital stopwatch implemented using hierarchical counters.
- A single clock input and synchronous active-high reset.
- Start/stop control for controlling the counting operation.
- Separate counters for sub-seconds, seconds, and minutes.
- Configurable clock-divider and timing parameters.
- A Verilog testbench that checks normal counting, start/stop behavior, rollover, and reset behavior.

### Not included in version 1

- Seven-segment display driver circuitry.
- Physical clock-divider hardware outside the stopwatch module.
- Lap-time or split-time storage.
- Countdown operation or programmable alarm functions.
- Multiple stopwatch channels or external memory storage.

These features can be added as later versions without changing the basic counting model.

## 3. Functional requirements

| ID    | Requirement                                                                                                                    |
| ----- | ------------------------------------------------------------------------------------------------------------------------------ |
| FR-01 | After reset, the stopwatch must initialize all time counters to zero.                                                         |
| FR-02 | The stopwatch must increment the elapsed time while the `start` control is active.                                            |
| FR-03 | The stopwatch must stop counting when the `start` control is inactive.                                                        |
| FR-04 | The sub-second counter must increment according to the configured clock-divider value.                                        |
| FR-05 | When the sub-second counter reaches its configured terminal value, it must reset to zero and increment the seconds counter.    |
| FR-06 | When the seconds counter reaches its terminal value, it must reset to zero and increment the minutes counter.                 |
| FR-07 | When the minutes counter reaches its configured maximum value, it must roll over to zero.                                     |
| FR-08 | The timing parameters must be compile-time Verilog parameters, allowing different clock frequencies and timing plans without changing the counter logic. |

## 4. Safety requirements

| ID    | Requirement                                                                                                                                  |
| ----- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| SR-01 | Reset must place all stopwatch counters in a known zero state.                                                                                |
| SR-02 | The stopwatch counters must not increment while the stopwatch is stopped.                                                                     |
| SR-03 | Each counter must roll over correctly without producing an invalid time value.                                                                |
| SR-04 | A rollover of a lower-order counter must increment only the next higher-order counter while resetting the lower-order counter to zero.       |

## 5. Interface definition

| Signal        | Direction | Width | Description                                                         |
| ------------- | --------: | ----: | ------------------------------------------------------------------- |
| `clk`         |     Input |     1 | System clock; counters update on its rising edge.                  |
| `reset`       |     Input |     1 | Active-high synchronous reset, sampled on the rising edge of `clk`. |
| `start`       |     Input |     1 | Stopwatch control; counting occurs when this signal is active.     |
| `minutes`     |    Output |     8 | Elapsed minutes value.                                              |
| `seconds`     |    Output |     6 | Elapsed seconds value.                                              |
| `subseconds`  |    Output |     7 | Elapsed sub-second value.                                           |

### Counter representation

The output counters represent the elapsed time using separate binary fields.

| Name         | Range / Value | Meaning                    |
| ------------ | ------------: | -------------------------- |
| `minutes`    | `0` to `MAX`  | Elapsed minutes             |
| `seconds`    | `0` to `59`   | Elapsed seconds             |
| `subseconds` | `0` to `N-1`  | Configured sub-second count |

## 6. Counter Hierarchy Definition

The design is implemented as a hierarchical synchronous counter structure. Each lower-order counter generates a rollover condition that enables the next higher-order counter.

| Counter      | Terminal Condition | Action at Terminal Count                         | Next Counter |
| ------------ | :----------------: | ------------------------------------------------ | ------------ |
| `subseconds` | `SUBSEC_CYCLES-1`  | Reset to zero                                    | `seconds`    |
| `seconds`    | `59`               | Reset to zero                                    | `minutes`    |
| `minutes`    | `MAX_MINUTES`      | Reset to zero                                    | `minutes`    |

- **Sub-second Counter:** Counts clock cycles and generates a rollover event when the configured terminal count is reached.
- **Seconds Counter:** Increments when the sub-second counter rolls over and resets after reaching `59`.
- **Minutes Counter:** Increments when the seconds counter rolls over and resets after reaching the configured maximum value.

## 7. Timing assumptions

- All time values are derived from the **system clock frequency** and configured clock-divider parameters.
- The external system is responsible for selecting the clock frequency and configuring the sub-second terminal count.
- For example, with a 100 Hz clock, a `SUBSEC_CYCLES = 100` setting can be used to generate one-second rollover timing.
- `SUBSEC_CYCLES` and `MAX_MINUTES` must be positive integers.
- Version 1 provides a single elapsed-time counting mode. Additional timing resolutions may be introduced later if required.

## 8. Verification acceptance criteria

The testbench must demonstrate all of the following:

1. Reset initializes minutes, seconds, and sub-seconds to zero.
2. The stopwatch counts upward when `start` is active.
3. The stopwatch stops counting when `start` is inactive.
4. The sub-second counter rolls over at its configured terminal value.
5. A sub-second rollover increments the seconds counter correctly.
6. A seconds rollover increments the minutes counter correctly.
7. The minutes counter rolls over correctly at its configured maximum value.
8. No counter changes unexpectedly while the stopwatch is stopped.

## 9. Future enhancement path

Future revisions can add display-driver logic and additional user controls while preserving the basic hierarchical counting model. Suitable next additions are lap-time capture, split-time measurement, programmable maximum time, countdown operation, seven-segment display control, and buzzer or alarm outputs.

## 10. Related Engineering Documentation

- [Timing Specification](./timing-specification.md)
- [Verification Summary](./verification-summary.md)
- [Design Decisions & Trade-offs](./design-decisions.md)
