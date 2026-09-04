# **State Diagram to RTL**

* **Overview**

A **state diagram** is a graphical representation of an FSM. It shows the states, inputs, transitions, and outputs of a sequential system.

**RTL (Register Transfer Level)** is the Verilog/SystemVerilog description of that hardware.

The basic conversion is:

```text
State Diagram
      ↓
Identify States
      ↓
Assign State Encoding
      ↓
Write State Register
      ↓
Write Next-State Logic
      ↓
Write Output Logic
      ↓
Synthesizable RTL
```

---

* **Definition**

**State-Diagram-to-RTL** is the process of converting an FSM state diagram into synthesizable Verilog/SystemVerilog code.

A state diagram provides the **behavior**, while RTL describes the **hardware implementation** of that behavior.

---

* **Why is it needed?**

In RTL design, engineers often start with a required behavior represented as an FSM/state diagram.

The state diagram must then be converted into RTL so that:

- The design can be simulated.
- The behavior can be verified.
- The RTL can be synthesized into hardware.
- Flip-flops and combinational logic can be created by synthesis tools.
- The design can eventually be implemented in an ASIC or FPGA.

---

* **Working Principle**

A typical FSM RTL implementation contains three main parts:

```text
              ┌─────────────────────┐
      Input ──►   Next-State Logic   │
              └──────────┬──────────┘
                         │
                         ▼
                  ┌─────────────┐
             ┌───►│ State       │
             │    │ Register    │
             │    └──────┬──────┘
             │           │
             │           ▼
             │      Current State
             │           │
             └───────────┘
                         
Current State + Input
          ↓
    Next State
          ↓
   Clock Edge
          ↓
   State Register
          ↓
    Current State
```

The three RTL sections are:

1. **State Register** → stores the current state.
2. **Next-State Logic** → determines the next state.
3. **Output Logic** → determines the output.

---

* **Circuit Diagram**

Consider an FSM with two states:

```text
              X = 1
        ┌────────────────┐
        │                ▼
     ┌──────┐          ┌──────┐
     │ S0   │          │ S1   │
     │ IDLE │          │ACTIVE│
     └──┬───┘          └──┬───┘
        │                 │
        │ X = 0           │ X = 0
        │                 │
        └─────────────────┘
```

A more complete representation is:

```text
                  Input X
                     │
                     ▼
             ┌───────────────┐
             │ Next-State    │
             │    Logic      │
             └───────┬───────┘
                     │
                 Next State
                     │
                     ▼
               ┌───────────┐
        Clock ─►│  State    │
               │ Register  │
               └─────┬─────┘
                     │
                Current State
                     │
              ┌──────┴───────┐
              │              │
              ▼              ▼
       Next-State Logic   Output Logic
```

---

* **Step-by-Step Conversion**

### Step 1 — Identify the states

From the state diagram, first identify every state.

Example:

```text
S0 = IDLE
S1 = ACTIVE
```

So the FSM has **2 states**.

---

### Step 2 — Identify the inputs

Suppose the FSM has one input:

```text
X
```

The input controls transitions between states.

---

### Step 3 — Identify the transitions

Suppose the diagram specifies:

```text
Current State     X       Next State
-------------------------------------
S0                0       S0
S0                1       S1
S1                0       S0
S1                1       S1
```

This means:

```text
S0 + X=0 → S0
S0 + X=1 → S1

S1 + X=0 → S0
S1 + X=1 → S1
```

---

### Step 4 — Assign binary encoding

Because there are only two states, one flip-flop is sufficient.

```text
S0 = 1'b0
S1 = 1'b1
```

Therefore:

```text
STATE_WIDTH = 1
```

---

### Step 5 — Create the state register

The state register stores the current state.

```verilog
always @(posedge clk or posedge reset)
begin
    if (reset)
        state <= S0;
    else
        state <= next_state;
end
```

Important:

```text
state      → current state
next_state → state that will be entered
clk        → controls state transition
reset      → initializes the FSM
```

---

### Step 6 — Create next-state logic

Now convert the transition rules into RTL.

```verilog
always @(*)
begin
    case (state)

        S0:
            if (X)
                next_state = S1;
            else
                next_state = S0;

        S1:
            if (X)
                next_state = S1;
            else
                next_state = S0;

        default:
            next_state = S0;

    endcase
end
```

This block answers:

> **"Given my current state and input, where should I go next?"**

---

### Step 7 — Create output logic

If the output should be:

```text
S0 → Y = 0
S1 → Y = 1
```

then:

```verilog
always @(*)
begin
    case (state)

        S0: Y = 1'b0;
        S1: Y = 1'b1;

        default: Y = 1'b0;

    endcase
end
```

This is a **Moore FSM** because the output depends only on the current state.

---

* **Complete RTL Example**

The complete FSM can be written as:

```verilog
module simple_fsm (
    input  wire clk,
    input  wire reset,
    input  wire X,
    output reg  Y
);

    // State encoding
    parameter S0 = 1'b0;
    parameter S1 = 1'b1;

    reg state;
    reg next_state;

    // 1. State Register
    always @(posedge clk or posedge reset)
    begin
        if (reset)
            state <= S0;
        else
            state <= next_state;
    end

    // 2. Next-State Logic
    always @(*)
    begin
        case (state)

            S0:
                if (X)
                    next_state = S1;
                else
                    next_state = S0;

            S1:
                if (X)
                    next_state = S1;
                else
                    next_state = S0;

            default:
                next_state = S0;

        endcase
    end

    // 3. Output Logic
    always @(*)
    begin
        case (state)

            S0: Y = 1'b0;
            S1: Y = 1'b1;

            default: Y = 1'b0;

        endcase
    end

endmodule
```

---

* **RTL Structure**

It is useful to remember the three-block FSM structure:

```text
              ┌──────────────────┐
              │  State Register  │
              │    Sequential    │
              └────────┬─────────┘
                       │
                       ▼
                 Current State
                       │
              ┌────────┴─────────┐
              │                  │
              ▼                  ▼
      Next-State Logic      Output Logic
       Combinational        Combinational
              │
              ▼
          Next State
              │
              └──────► State Register
```

In code:

```verilog
// 1. State Register
always @(posedge clk)
    state <= next_state;

// 2. Next-State Logic
always @(*)
    next_state = ...;

// 3. Output Logic
always @(*)
    output = ...;
```

---

* **Truth Table**

For our example:

| **Current State** | **Input X** | **Next State** | **Output Y** |
|---|---:|---|---:|
| S0 | 0 | S0 | 0 |
| S0 | 1 | S1 | 0 |
| S1 | 0 | S0 | 1 |
| S1 | 1 | S1 | 1 |

---

* **Boolean Expression**

With the encoding:

```text
S0 = 0
S1 = 1
```

From the transition table:

```text
Next State = X
```

Therefore:

```text
Q(next) = X
```

For the Moore output:

```text
Y = Q
```

where `Q` represents the current state.

---

* **Input & Output Description**

| Signal | Type | Description |
|---|---|---|
| `clk` | Input | Clock signal controlling state changes |
| `reset` | Input | Initializes the FSM to S0 |
| `X` | Input | Controls state transitions |
| `state` | Internal | Stores the current state |
| `next_state` | Internal | Stores the calculated next state |
| `Y` | Output | FSM output |

---

* **Working Example**

Assume:

```text
Initial state = S0
X = 1
```

Before the clock edge:

```text
Current State = S0
X = 1
Next State    = S1
```

At the active clock edge:

```text
S0 ──clock──► S1
```

Now:

```text
Current State = S1
Y = 1
```

If `X` then becomes `0`:

```text
S1 + X=0 → S0
```

At the next clock edge:

```text
S1 ──clock──► S0
```

So the important rule is:

> **The next-state logic can calculate the next state before the clock edge, but the state register changes only on the clock edge.**

---

* **State Diagram → RTL Mapping**

| State Diagram Element | RTL Representation |
|---|---|
| State | State register / encoding |
| Transition | Next-state logic |
| Input condition | `if`, `case`, logical condition |
| Clock | `posedge clk` |
| State memory | Flip-flop(s) |
| Output | Output logic |
| Reset | Reset logic |

---

* **Common RTL Coding Pattern**

For most FSMs, this pattern is very important:

```verilog
// State Register
always @(posedge clk or posedge reset)
begin
    if (reset)
        state <= IDLE;
    else
        state <= next_state;
end


// Next-State Logic
always @(*)
begin
    case (state)

        IDLE:
            ...

        ACTIVE:
            ...

        default:
            next_state = IDLE;

    endcase
end


// Output Logic
always @(*)
begin
    case (state)

        IDLE:
            ...

        ACTIVE:
            ...

        default:
            ...

    endcase
end
```

This structure is commonly called the **three-process FSM coding style**.

---

* **Applications**

State-diagram-to-RTL conversion is used in:

- UART controllers
- SPI controllers
- I²C controllers
- Traffic-light controllers
- CPU control units
- Bus protocols
- Memory controllers
- DMA controllers
- Sequence detectors
- Communication controllers
- Power-management controllers

---

* **Advantages**

- Converts graphical behavior into synthesizable hardware.
- Easy to simulate and verify.
- Clearly separates sequential and combinational logic.
- Makes complex control logic easier to understand.
- Suitable for ASIC and FPGA design.
- Provides a structured RTL coding methodology.

---

* **Limitations**

- Large FSMs can become difficult to visualize.
- Poor state encoding can increase hardware complexity.
- Incomplete combinational assignments can cause unintended latches.
- Incorrect reset handling can lead to unknown or illegal states.
- Poorly designed transitions can cause functional bugs.

---

* **Real-World Example**

Consider a simple **UART transmitter**.

A possible state diagram could contain:

```text
IDLE
  │
  │ start = 1
  ▼
START
  │
  ▼
DATA
  │
  ▼
STOP
  │
  ▼
IDLE
```

This can be converted into RTL where:

```text
State Register
      ↓
IDLE / START / DATA / STOP
      ↓
Next-State Logic
      ↓
Output Control
      ↓
UART TX signal
```

This same basic process is used when designing much larger RTL IPs.

---

* **Key Points**

1. A state diagram describes FSM behavior graphically.
2. RTL describes the same behavior as synthesizable hardware.
3. Every state needs an encoding.
4. The **state register** stores the current state.
5. **Next-state logic** determines the next state.
6. **Output logic** determines FSM outputs.
7. State registers normally change on a clock edge.
8. `case` is commonly used to describe FSM states.
9. A `default` branch helps handle illegal/unknown state values.
10. State diagram → RTL is a fundamental skill for **ASIC RTL design**.

---

* **Interview Questions**

**1. What are the main components of FSM RTL?**

State register, next-state logic, and output logic.

**2. What does the state register do?**

It stores the current state using flip-flops.

**3. What determines the next state?**

The current state and the FSM inputs.

**4. When does the state change?**

Normally at the active edge of the clock.

**5. Why is `always @(posedge clk)` used for the state register?**

Because the state must be stored in flip-flops and updated synchronously with the clock.

**6. Why is `always @(*)` used for next-state logic?**

Because next-state logic is combinational logic.

**7. What is state encoding?**

It is the assignment of binary values to FSM states.

**8. What happens if combinational assignments are incomplete?**

The synthesis tool may infer a latch.

**9. What is the purpose of a `default` state?**

It provides behavior for unexpected or illegal state values.

**10. What is the basic conversion flow?**

```text
State Diagram
     ↓
State Encoding
     ↓
State Register
     ↓
Next-State Logic
     ↓
Output Logic
     ↓
Synthesizable RTL
```

---

* **Quick Revision**

```text
STATE DIAGRAM
      ↓
Identify states
      ↓
Identify inputs
      ↓
Identify transitions
      ↓
Assign state encoding
      ↓
Write state register
      ↓
Write next-state logic
      ↓
Write output logic
      ↓
Verify with simulation
```

Remember:

```text
Current State + Input
          ↓
    Next-State Logic
          ↓
      Next State
          ↓
      Clock Edge
          ↓
    State Register
          ↓
    Current State
```

---

* **Summary**

**State-Diagram-to-RTL** is the process of translating an FSM's graphical representation into synthesizable Verilog/SystemVerilog. The most important implementation structure is the separation of the **state register**, **next-state logic**, and **output logic**. Mastering this conversion is essential for designing practical RTL controllers such as UARTs, SPI controllers, protocol controllers, CPU control units, and other ASIC/FPGA control logic.

---

* **References**

- Neso Academy — Digital Electronics and FSM concepts
- IEEE — Verilog/SystemVerilog language concepts
- HDLBits — FSM and RTL design practice
- Digital Design — RTL and FSM design methodology
