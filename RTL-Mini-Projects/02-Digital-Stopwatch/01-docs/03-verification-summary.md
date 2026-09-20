# Verification Summary — Digital Stopwatch

## 1. Overview

The Digital Stopwatch was verified using a Verilog testbench and behavioral simulation. Verification covers synchronous reset behavior, start control, sub-second counting, counter hold behavior, seconds rollover, minutes rollover, and correct hierarchical counter operation.

The design was simulated using Icarus Verilog, and the waveform was inspected in GTKWave.

---

## 2. Verification Environment

| Item              | Details                                   |
| ----------------- | ----------------------------------------- |
| HDL               | Verilog (synthesizable subset)            |
| Simulation Tool   | Icarus Verilog                            |
| Waveform Viewer   | GTKWave                                   |
| Testbench         | `digital_stopwatch_tb.v`                  |
| Waveform File     | `digital_stopwatch.vcd`                   |
| Clock Period      | 10 ns                                     |
| `SUBSEC_CYCLES`   | 100 cycles                                |
| `MAX_MINUTES`     | 100                                       |
| Simulation Length | 100 ns                                    |

**Note:** With a 10 ns clock period and `SUBSEC_CYCLES = 100`, one second requires 100 clock cycles, which corresponds to 1000 ns. The current testbench run time of 100 ns is sufficient to observe the initial sub-second counting sequence, but not sufficient to observe seconds or minutes rollover.

---

## 3. Test Cases

| Test Case | Scenario                 | Expected Behavior                                      | Status             |
| --------- | ------------------------ | ------------------------------------------------------ | ------------------ |
| TC-01     | Apply synchronous reset  | Minutes, seconds, and subseconds clear to 0           | PASS               |
| TC-02     | Start stopwatch          | Counters begin incrementing when `start = 1`           | PASS               |
| TC-03     | Sub-second counting      | Subseconds increment on each rising clock edge         | PASS               |
| TC-04     | Stop stopwatch           | All counters hold their current values when stopped    | *(re-run pending)* |
| TC-05     | Sub-second rollover      | Subseconds roll from `99` to `0`                       | *(re-run pending)* |
| TC-06     | Seconds increment        | Seconds increment when subseconds roll over            | *(re-run pending)* |
| TC-07     | Seconds rollover         | Seconds roll from `59` to `0` and minutes increment    | *(re-run pending)* |
| TC-08     | Minutes increment        | Minutes increment after seconds rollover               | *(re-run pending)* |
| TC-09     | Minutes rollover         | Minutes roll from `MAX_MINUTES` to `0`                 | *(re-run pending)* |
| TC-10     | Counter range            | All counters remain within their defined ranges        | *(re-run pending)* |

---

## 4. Counter Sequence

```text
Subseconds:
0 → 1 → 2 → ... → 98 → 99 → 0

Seconds:
0 → 1 → 2 → ... → 58 → 59 → 0

Minutes:
0 → 1 → 2 → ... → MAX_MINUTES → 0
```

The current simulation confirms the initial sub-second counting sequence:

```text
00 → 01 → 02 → 03 → 04 → 05 → 06 → 07 → 08 → 09
```

The remaining rollover operations will be confirmed once the simulation is extended to cover the required timing intervals.

---

## 5. Counter Verification

| Counter      | Verification Rule                    | Result                                      | Status             |
| ------------ | ------------------------------------ | ------------------------------------------- | ------------------ |
| Subseconds   | Increments while `start = 1`         | Incrementing correctly in observed waveform | PASS               |
| Subseconds   | Rolls over at `SUBSEC_CYCLES - 1`   | Requires extended simulation                | *(re-run pending)* |
| Seconds      | Increments after sub-second rollover | Requires extended simulation                | *(re-run pending)* |
| Seconds      | Rolls over from `59` to `0`          | Requires extended simulation                | *(re-run pending)* |
| Minutes      | Increments after seconds rollover    | Requires extended simulation                | *(re-run pending)* |
| Minutes      | Rolls over after `MAX_MINUTES`       | Requires extended simulation                | *(re-run pending)* |
| All counters | Hold when `start = 0`                | Requires dedicated stop test                | *(re-run pending)* |

---

## 6. Reset Verification

On synchronous reset (`reset = 1` at `posedge clk`):

- `minutes` becomes `0`
- `seconds` becomes `0`
- `subseconds` becomes `0`

After reset is released and `start = 1`, the stopwatch begins counting on subsequent rising clock edges.

Confirmed in the GTKWave waveform. **Status: PASS**

---

## 7. Start/Stop Verification

The stopwatch uses the `start` input to control counting.

When:

```text
start = 1
```

the counters are allowed to update.

When:

```text
start = 0
```

the counters must retain their current values.

The current simulation confirms the start operation after reset. A dedicated stop test is required to confirm that all counters hold their values while `start = 0`.

**Status: Re-run pending**

---

## 8. Verification Artifacts

- `digital_stopwatch.v` — RTL design
- `digital_stopwatch_tb.v` — Testbench
- `digital_stopwatch.vcd` — Simulation waveform database
- `waveform.png` — Final GTKWave waveform screenshot

---

## 9. Conclusion

The Digital Stopwatch shows correct synchronous reset behavior, correct start behavior, and correct initial sub-second counting in the current simulation. The waveform confirms that the counters initialize to zero and that `subseconds` increments correctly after reset is released.

The current 100 ns simulation does not run long enough to verify sub-second rollover, seconds rollover, minutes increment, minutes rollover, or stop/hold behavior.

**Current Status: Verification in progress.** Extending the simulation and adding dedicated start/stop and rollover test cases will allow the remaining requirements to be verified and marked PASS or FAIL with actual simulation results. This document should be updated with those results before being marked final.
