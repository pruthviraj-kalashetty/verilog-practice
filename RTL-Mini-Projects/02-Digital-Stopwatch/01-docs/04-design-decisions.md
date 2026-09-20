# Design Decisions & Trade-offs — Digital Stopwatch

## 1. Counter-Based Design vs. FSM

A counter-based design was chosen instead of an FSM because the Digital Stopwatch only needs to measure elapsed time and perform sequential counter updates. There are no multiple control states requiring separate output behavior. The hierarchical counters provide a simpler and more direct implementation for sub-seconds, seconds, and minutes.

## 2. Hierarchical Counters vs. Independent Timing Logic

A hierarchical counter structure was chosen where the sub-second counter controls the seconds counter, and the seconds counter controls the minutes counter. This avoids separate timing mechanisms for each time field and provides a clear rollover relationship between the counters.

## 3. Output Counters vs. Internal Counter Registers

The `minutes`, `seconds`, and `subseconds` output registers are used directly as the timing counters. Separate internal counter registers were not added because the counter values themselves are the required outputs. This keeps the RTL simple and avoids unnecessary duplicate storage.

## 4. Reset Strategy: Synchronous vs. Asynchronous

A synchronous active-high reset was chosen. Reset is sampled on the rising edge of `clk`, which keeps reset behavior synchronized with the main clock and avoids introducing a separate asynchronous control path into the design.

## 5. Start Control: Enable vs. Separate Stop State

The `start` signal is used as a counter enable instead of creating a separate FSM state for running and stopped conditions. When `start = 1`, the counters update normally. When `start = 0`, the counters retain their current values. This provides the required start/stop behavior with minimal control logic.

## 6. Counter Width Selection

The counter widths were selected according to the required output ranges defined in the project requirements:

- `minutes` uses 8 bits (`[7:0]`)
- `seconds` uses 6 bits (`[5:0]`)
- `subseconds` uses 7 bits (`[6:0]`)

The 6-bit seconds counter can represent values from 0 to 63, which is sufficient for the required 0 to 59 range. The 7-bit sub-second counter can represent values from 0 to 127, which is sufficient for the configured `SUBSEC_CYCLES = 100`. The 8-bit minutes output is retained as specified by the project interface.

## 7. Parameters vs. Fixed Counter Limits

`SUBSEC_CYCLES` and `MAX_MINUTES` are defined as Verilog `parameter` values so the timing configuration can be changed at compile time without modifying the main RTL structure.

The seconds terminal value of `59` is fixed because the stopwatch uses the standard 60-second minute definition.

## 8. Alternatives Considered and Rejected

- Considered using an FSM for stopwatch control — rejected because the required behavior can be implemented directly with hierarchical counters.
- Considered using separate internal counters — rejected because the output registers can directly store the required elapsed-time values.
- Considered asynchronous reset — rejected because the project requirement specifies a synchronous active-high reset.
- Considered separate timers for minutes and seconds — rejected because hierarchical rollover provides a simpler and more direct timing structure.

## 9. Known Limitations (v1 Scope)

The current Digital Stopwatch is limited to the defined v1 requirements:

- No seven-segment display driver
- No external physical clock divider
- No lap or split-time function
- No countdown mode
- No alarm or buzzer
- No multiple stopwatch channels
- Timing depends on the configured `clk` frequency and `SUBSEC_CYCLES` parameter

These features are outside the current project scope and may be considered as future enhancements.

## 10. Validation from Simulation

The current GTKWave simulation confirms that the synchronous reset initializes `minutes`, `seconds`, and `subseconds` to zero and that the sub-second counter begins incrementing after reset is released and `start` is asserted.

The observed waveform also confirms the expected 10 ns clock period and initial sub-second counting sequence. Full seconds and minutes rollover behavior requires an extended simulation because `SUBSEC_CYCLES = 100` with a 10 ns clock requires 1000 ns for one second.

The RTL schematic and waveform provide structural and behavioral evidence for the counter-based design used in this project.


![Waveform](../03-rtl-tb/waveform.png)

![RTL Schematic](../03-rtl-tb/rtl-schematic.png)
