# Design Decisions & Trade-offs — Traffic Light Controller

## 1. FSM Style: Moore vs. Mealy
Explain why Moore was chosen (output depends only on state → glitch-free, 
predictable outputs). Note Mealy was considered but rejected because output 
would depend on inputs directly, risking glitches — not needed here since 
there are no external inputs beyond clk/reset.

## 2. State Encoding: Binary vs. One-Hot
You used binary encoding for the 6 FSM states (3'd0-3'd5), not one-hot. 
Explain why: 3 bits is enough for 6 states, so binary is more compact than 
one-hot would be (which would need 6 flip-flops instead of 3).

## 3. Output Encoding: One-Hot
Separately, your light outputs (RED/YELLOW/GREEN) use one-hot encoding. 
Explain why this is a *different* decision from state encoding: one-hot 
here means each output bit maps directly to one physical lamp, which is 
simple to decode and simple to wire to real hardware.

## 4. Reset Strategy: Synchronous vs. Asynchronous
Explain why synchronous reset was chosen — reset sampled with the clock 
avoids reset-removal/recovery timing concerns and keeps the whole design 
in one clean clock domain.

## 5. Two All-Red States vs. One Shared State
You used ALL_RED_TO_EW and ALL_RED_TO_NS instead of a single shared 
all-red state. Explain why (this is already reasoned in your FSM spec — 
pull it in here): preserves direction of travel through the sequence, 
and makes future extensions (like different clearance durations per 
direction) easier without restructuring the FSM.

## 6. Timing Mechanism: Shared Counter
Explain why one reusable counter (reset at each state entry) was used 
instead of separate timers per state — simpler datapath, less area, 
easier to verify.

## 7. Parameters vs. Localparam
Briefly restate the reasoning: GREEN_CYCLES/YELLOW_CYCLES/ALL_RED_CYCLES 
are `parameter` (user-configurable), state encodings are `localparam` 
(fixed internally).

## 8. Alternatives Considered and Rejected
A short list: e.g., "Considered a single combined all-red state — rejected 
because it loses directional context for future extensions." List 2-3 
real alternatives you thought about, even briefly, while designing.

## 9. Known Limitations (v1 Scope)
Cross-reference your "Out of Scope" section from requirements-and-design.md 
— fixed timing only, no pedestrian phase, no independent NS/EW durations.

## 10. Validation from Simulation
Now that you have real results: briefly state what the waveform and RTL 
schematic actually confirm — e.g., "The waveform confirms glitch-free 
output transitions at each state change, validating the Moore FSM choice 
in Section 1." Link to your existing images rather than duplicating them:

![Waveform](../03-rtl-tb/waveform.png)

![RTL Schematic](../03-rtl-tb/rtl-schematic.png)
