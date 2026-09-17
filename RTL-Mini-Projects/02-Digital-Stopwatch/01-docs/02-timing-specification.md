# Timing Specification

| Field            | Value                             |
| ---------------- | --------------------------------- |
| Document version | 1.0                               |
| Status           | Approved for implementation       |
| Target HDL       | Verilog-2001 synthesizable subset |
| Timing model     | Synchronous clock-cycle based     |
| Counter model    | Hierarchical elapsed-time counter |

## 1. Overview

The digital stopwatch derives its elapsed-time measurement from a synchronous system clock. The timing mechanism uses three hierarchical counters: `subseconds`, `seconds`, and `minutes`.

The `subseconds` counter measures clock cycles from the configured `SUBSEC_CYCLES` value. When the terminal count is reached, it rolls over to zero and generates a one-second rollover event for the `seconds` counter.

The `seconds` counter counts from `0` to `59`. When it rolls over from `59` to `0`, the `minutes` counter increments by one.

The `minutes` counter increments until the configured `MAX_MINUTES` value is reached and then rolls over to zero.

## 2. Clock Definition

The stopwatch operates from a single synchronous clock:

| Signal | Description |
| ------ | ----------- |
| `clk`  | System clock used to update all stopwatch counters. |

All counter updates occur on the **rising edge** of `clk`.

The relationship between the system clock and the sub-second timing is defined as:

    One second = SUBSEC_CYCLES clock cycles

Therefore:

    Seconds rollover period = SUBSEC_CYCLES × Clock period

Where:

    Clock period = 1 / Clock frequency

The physical elapsed time represented by the stopwatch depends on the external system clock frequency and the configured `SUBSEC_CYCLES` parameter.

## 3. Timing Parameters

The stopwatch uses compile-time parameters to define its timing behavior.

| Parameter      | Description | Requirement |
| -------------- | ----------- | ----------- |
| `SUBSEC_CYCLES` | Number of clock cycles required to generate one second. | `>= 1` |
| `MAX_MINUTES`   | Maximum minute value before minute rollover. | `>= 1` |

The parameters allow the same counter architecture to operate with different system clock frequencies and timing configurations without changing the basic counter logic.

## 4. Sub-second Timing

The `subseconds` counter is the lowest level of the timing hierarchy.

It starts from zero and increments by one on each rising edge of `clk` while `start = 1`.

For a configured value of `SUBSEC_CYCLES = N`, the counter operates as follows:

    0 → 1 → 2 → ... → N-2 → N-1
                                │
                                ▼
                         rollover condition
                                │
                                ▼
                         subseconds = 0

At the terminal count:

    subseconds == SUBSEC_CYCLES - 1

the following operations occur:

1. `subseconds` returns to `0`.
2. `seconds` increments by `1`.
3. The next sub-second counting interval begins.

Therefore, the sub-second counter generates exactly one seconds-counter increment for every `SUBSEC_CYCLES` active clock cycles.

## 5. Seconds Timing

The `seconds` counter represents the elapsed seconds within the current minute.

Its valid range is:

    0 to 59

The seconds counter increments only when the `subseconds` counter rolls over.

The normal sequence is:

    00 → 01 → 02 → ... → 58 → 59
                                  │
                                  ▼
                                  00

When the seconds counter reaches `59` and another seconds rollover occurs:

1. `seconds` resets to `0`.
2. `minutes` increments by `1`.

This creates the standard sixty-second relationship:

    60 seconds = 1 minute

## 6. Minutes Timing

The `minutes` counter represents the elapsed minutes.

Its configured maximum value is defined by `MAX_MINUTES`.

The normal sequence is:

    0 → 1 → 2 → ... → MAX_MINUTES
                              │
                              ▼
                           0

When the minutes counter reaches `MAX_MINUTES` and another minute rollover occurs, the counter returns to zero.

No higher-order timing counter is used in version 1.

## 7. Hierarchical Timing Flow

The complete timing relationship is:

    System Clock
         │
         ▼
    Sub-second Counter
         │
         │ SUBSEC_CYCLES reached
         ▼
    Subseconds = 0
         │
         ▼
    Seconds Counter
         │
         │ 59 reached
         ▼
    Seconds = 0
         │
         ▼
    Minutes Counter
         │
         │ MAX_MINUTES reached
         ▼
    Minutes = 0

Each counter therefore represents one level of the elapsed-time measurement.

## 8. Start/Stop Timing Behavior

The `start` input controls whether the timing counters are allowed to advance.

### Running condition

When:

    start = 1

the counter hierarchy operates normally.

    clk rising edge
          │
          ▼
    Subseconds increment
          │
          ▼
    Terminal count?
       /       \
     No         Yes
     │           │
     ▼           ▼
  Continue   Subseconds = 0
                 │
                 ▼
          Seconds increment
                 │
                 ▼
          Seconds terminal?
              /       \
            No         Yes
            │           │
            ▼           ▼
         Continue   Seconds = 0
                         │
                         ▼
                  Minutes increment

### Stopped condition

When:

    start = 0

all counters retain their current values.

    start = 0
        │
        ▼
    No counter update
        │
        ├── minutes    = hold
        ├── seconds    = hold
        └── subseconds = hold

Stopping the stopwatch does not reset or clear the elapsed-time value.

## 9. Reset Timing

The `reset` input is an active-high synchronous reset.

Reset is sampled only on the rising edge of `clk`.

When:

    reset = 1

at a rising clock edge:

    minutes    = 0
    seconds    = 0
    subseconds = 0

### Reset sequence

    reset = 1
        │
        ▼
    Rising edge of clk
        │
        ├── minutes    → 0
        ├── seconds    → 0
        └── subseconds → 0

Because the reset is synchronous, changing `reset` between clock edges does not immediately modify the counter outputs.

Reset has priority over normal counting operation.

## 10. Counter Timing Relationships

The timing hierarchy follows these relationships:

| Event | Result |
| ----- | ------ |
| Each active `clk` cycle | `subseconds` advances when `start = 1`. |
| `subseconds == SUBSEC_CYCLES - 1` | `subseconds` resets and `seconds` increments. |
| `seconds == 59` during seconds rollover | `seconds` resets and `minutes` increments. |
| `minutes == MAX_MINUTES` during minute rollover | `minutes` resets to zero. |
| `start = 0` | All counters hold their current values. |
| `reset = 1` at rising `clk` edge | All counters reset to zero. |

## 11. Timing Example

For illustration, assume:

    Clock frequency = 100 Hz
    SUBSEC_CYCLES  = 100

The clock period is:

    Clock period = 1 / 100 Hz
                 = 10 ms

Therefore:

    100 clock cycles × 10 ms
    = 1000 ms
    = 1 second

The resulting timing sequence is:

    100 clock cycles
          │
          ▼
    subseconds rollover
          │
          ▼
       1 second
          │
          ▼
    seconds increment

This example demonstrates the timing relationship only. The actual system clock frequency and parameter values are selected by the integrating system.

## 12. Timing Invariants

The implementation shall maintain the following timing conditions:

    0 <= subseconds < SUBSEC_CYCLES

    0 <= seconds <= 59

    0 <= minutes <= MAX_MINUTES

When `start = 0`:

    minutes    = constant
    seconds    = constant
    subseconds = constant

When `reset = 1` at a rising clock edge:

    minutes    = 0
    seconds    = 0
    subseconds = 0

These conditions ensure that every counter remains within its defined operating range.

## 13. Timing Accuracy Considerations

The stopwatch timing accuracy depends directly on the system clock frequency and the configured `SUBSEC_CYCLES` value.

The design does not generate an independent physical time reference. It counts clock cycles supplied by the external system.

Therefore:

    Stopwatch timing
        =
    System clock timing
        +
    Configured clock-divider value

Any frequency error or instability in the external system clock will directly affect the measured elapsed time.

## 14. Implementation Mapping

The timing specification maps to the RTL using a synchronous hierarchical counter structure:

- **Sub-second counter:** divides the system clock into one-second rollover intervals.
- **Seconds counter:** counts from `0` through `59`.
- **Minutes counter:** counts up to `MAX_MINUTES`.
- **Start control:** enables or holds all counters.
- **Synchronous reset:** clears all counters on the rising edge of `clk`.
- **Rollover logic:** transfers timing events from each lower-order counter to the next higher-order counter.

The implementation shall preserve the timing relationships defined in this document without introducing additional timing modes or external display logic.

## 15. Verification Requirements

The testbench shall verify the following timing behavior:

1. The stopwatch resets all counters to zero.
2. The sub-second counter advances only when `start = 1`.
3. The sub-second counter rolls over at `SUBSEC_CYCLES - 1`.
4. Each sub-second rollover increments the seconds counter exactly once.
5. The seconds counter rolls over from `59` to `0`.
6. Each seconds rollover increments the minutes counter exactly once.
7. The minutes counter rolls over at `MAX_MINUTES`.
8. All counters hold their values while `start = 0`.
9. Reset takes effect only on a rising edge of `clk`.
10. No counter exceeds its defined operating range.

## 16. Related Engineering Documentation

- [Requirements and Design](./requirements-and-design.md)
- [Verification Summary](./verification-summary.md)
- [Design Decisions & Trade-offs](./design-decisions.md)
- [Project README](../README.md)
