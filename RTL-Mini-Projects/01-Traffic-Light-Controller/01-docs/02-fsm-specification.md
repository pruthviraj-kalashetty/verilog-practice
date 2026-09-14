# FSM Specification

## 1. Overview

The traffic-light controller is a six-state Moore finite-state machine (FSM). Its output lights are determined only by the active state. A counter measures the number of clock cycles spent in that state.

The FSM advances only on the rising edge of `clk`. The `reset` signal is active-high and synchronously initializes the controller to the safe starting phase when sampled on that edge.

## 2. States

| State | Code | North/South | East/West | Purpose |
|---|---:|---|---|---|
| `NS_GREEN` | `3'd0` | Green | Red | Give right-of-way to North/South traffic. |
| `NS_YELLOW` | `3'd1` | Yellow | Red | Warn North/South traffic that its green phase is ending. |
| `ALL_RED_1` | `3'd2` | Red | Red | Clear the intersection before East/West receives green. |
| `EW_GREEN` | `3'd3` | Red | Green | Give right-of-way to East/West traffic. |
| `EW_YELLOW` | `3'd4` | Red | Yellow | Warn East/West traffic that its green phase is ending. |
| `ALL_RED_2` | `3'd5` | Red | Red | Clear the intersection before North/South receives green. |

Two all-red states are used even though they have the same outputs. This preserves the direction of travel through the sequence and makes future extensions, such as separate clearance durations, straightforward.

## 3. State-transition sequence

```text
                 GREEN_TIME elapsed
  +--------------------------------------------+
  |                                            v
NS_GREEN → NS_YELLOW → ALL_RED_1 → EW_GREEN → EW_YELLOW → ALL_RED_2
    ^                                                                  |
    +------------------------------------------------------------------+
                         ALL_RED_TIME elapsed
```

More precisely:

| Current state | Duration parameter | Next state after duration expires |
|---|---|---|
| `NS_GREEN` | `GREEN_TIME` | `NS_YELLOW` |
| `NS_YELLOW` | `YELLOW_TIME` | `ALL_RED_1` |
| `ALL_RED_1` | `ALL_RED_TIME` | `EW_GREEN` |
| `EW_GREEN` | `GREEN_TIME` | `EW_YELLOW` |
| `EW_YELLOW` | `YELLOW_TIME` | `ALL_RED_2` |
| `ALL_RED_2` | `ALL_RED_TIME` | `NS_GREEN` |

## 4. Counter operation

`count` is cleared whenever the FSM enters a new state. While the FSM remains in a state, it increments once per rising clock edge.

For a phase whose duration is `D` cycles:

1. The state is entered with `count = 0`.
2. It remains active while `count < D - 1`.
3. When `count == D - 1` at a rising edge, the FSM moves to the next state and clears `count` to `0`.

This makes the state active for exactly `D` sampled clock cycles. All duration parameters must therefore be at least `1`.

## 5. Reset and recovery behavior

| Condition | FSM state after condition | Counter | Outputs |
|---|---|---:|---|
| `reset = 1` at a rising clock edge | `NS_GREEN` | `0` | NS green, EW red |
| Unknown/invalid state at a clock edge | `NS_GREEN` | `0` | Both outputs decode to red until the next valid state is established |

The reset state is intentionally deterministic: it provides a known starting point for simulation and hardware bring-up. In a deployed intersection controller, a conservative all-red reset state could instead be selected if required by system-level safety policy.

## 6. Output-decoding rules

| FSM state class | NS output | EW output |
|---|---|---|
| NS right-of-way (`NS_GREEN`, `NS_YELLOW`) | Green or yellow, respectively | Red |
| Clearance (`ALL_RED_1`, `ALL_RED_2`) | Red | Red |
| EW right-of-way (`EW_GREEN`, `EW_YELLOW`) | Red | Green or yellow, respectively |
| Invalid state | Red | Red |

Light encoding is one-hot:

```verilog
RED    = 3'b100;
YELLOW = 3'b010;
GREEN  = 3'b001;
```

## 7. Safety invariants

The implementation and testbench must preserve these properties at every sampled clock edge:

```text
NOT (north_south == GREEN  AND east_west == GREEN)
NOT (north_south == YELLOW AND east_west == YELLOW)
NOT (north_south != RED    AND east_west != RED)
```

Additionally, the only valid change from one traffic flow having right-of-way to the other is through an all-red state.

## 8. Implementation mapping

The RTL separates its responsibilities into two logical sections:

- **Sequential state logic:** updates `state` and `count` on `clk` or `reset`.
- **Combinational output logic:** decodes `state` into the `north_south` and `east_west` lamp outputs.

This mapping produces a synthesizable design and lets the testbench observe each phase independently.

