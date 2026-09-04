# **FSM Verilog Structure**

* **Overview**

An **FSM Verilog Structure** is a standard coding pattern used to describe a Finite State Machine in synthesizable Verilog.

A typical FSM RTL design separates the design into three main parts:

```text
1. State Register
2. Next-State Logic
3. Output Logic
```

This separation makes the FSM easier to understand, simulate, debug, verify, and synthesize.

---

* **Definition**

**FSM Verilog Structure** is the organized Verilog coding style used to implement the states, state transitions, and outputs of a finite state machine.

The basic structure is:

```text
             ┌────────────────────┐
             │   State Register   │
             │    Sequential      │
             └─────────┬──────────┘
                       │
                       ▼
                 Current State
                       │
             ┌─────────┴──────────┐
             │                    │
             ▼                    ▼
      Next-State Logic       Output Logic
       Combinational         Combinational
             │
             ▼
         Next State
             │
             └──────► State Register
```

---

* **Why is it needed?**

A proper FSM structure helps the designer:

- Clearly separate sequential and combinational logic.
- Store the current state using flip-flops.
- Calculate the next state from current state and inputs.
- Generate FSM outputs.
- Avoid confusing FSM code.
- Make simulation and debugging easier.
- Write synthesizable RTL.
- Build reliable ASIC/FPGA control logic.

For professional RTL design, understanding this structure is very important.

---

* **Working Principle**

The FSM operates in the following sequence:

```text
                 Input
                   │
                   ▼
        ┌────────────────────┐
        │  Next-State Logic  │
        └─────────┬──────────┘
                  │
                  ▼
             Next State
                  │
                  ▼
        ┌────────────────────┐
Clock ─►│   State Register   │
        └─────────┬──────────┘
                  │
                  ▼
            Current State
                  │
                  ├──────────────► Output Logic
                  │                    │
                  │                    ▼
                  │                  Output
                  │
                  └──────────────► Next-State Logic
```

The important relationship is:

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

* **Circuit Diagram**

A typical FSM hardware implementation contains:

```text
                 Inputs
                   │
                   ▼
          ┌─────────────────┐
          │ Next-State      │
          │ Combinational   │
          │ Logic           │
          └────────┬────────┘
                   │
              Next State
                   │
                   ▼
             ┌───────────┐
       Clock │   State   │
      ──────►│ Registers │
             │ Flip-Flops│
             └─────┬─────┘
                   │
             Current State
                   │
          ┌────────┴────────┐
          │                 │
          ▼                 ▼
   Next-State Logic    Output Logic
                            │
                            ▼
                          Output
```

The **state register is sequential logic**, while the next-state and output logic are generally **combinational logic**.

---

* **State Register**

The state register stores the current state.

A typical Verilog implementation is:

```verilog
always @(posedge clk or posedge reset)
begin
    if (reset)
        state <= IDLE;
    else
        state <= next_state;
end
```

### What happens here?

At the active clock edge:

```text
next_state
    ↓
state register
    ↓
current state
```

The state does **not continuously change**. It changes according to the clock.

### Important

The non-blocking assignment:

```verilog
<=
```

is normally used for sequential logic.

---

* **Next-State Logic**

The next-state logic determines where the FSM should go next.

A common implementation is:

```verilog
always @(*)
begin
    case (state)

        IDLE:
            if (start)
                next_state = ACTIVE;
            else
                next_state = IDLE;

        ACTIVE:
            if (done)
                next_state = IDLE;
            else
                next_state = ACTIVE;

        default:
            next_state = IDLE;

    endcase
end
```

This is combinational logic.

It answers:

> **"Based on the current state and inputs, what should the next state be?"**

---

* **Output Logic**

The output logic determines the FSM output.

For example:

```verilog
always @(*)
begin
    case (state)

        IDLE:
            busy = 1'b0;

        ACTIVE:
            busy = 1'b1;

        default:
            busy = 1'b0;

    endcase
end
```

Here:

```text
IDLE   → busy = 0
ACTIVE → busy = 1
```

Because the output depends only on the current state, this is a **Moore FSM output**.

---

* **Truth Table**

Consider:

```text
States:
IDLE
ACTIVE

Inputs:
start
done
```

A simplified transition table is:

| **Current State** | **Input Condition** | **Next State** | **Output busy** |
|---|---|---|---:|
| IDLE | start = 0 | IDLE | 0 |
| IDLE | start = 1 | ACTIVE | 0 |
| ACTIVE | done = 0 | ACTIVE | 1 |
| ACTIVE | done = 1 | IDLE | 1 |

The table can be converted into the Verilog `case` structure.

---

* **Boolean Expression**

For the example above, let:

```text
Q = current state
S = start
D = done
```

If:

```text
IDLE   = 0
ACTIVE = 1
```

then:

```text
Next State = Q̅S + QD̅
```

The output is:

```text
busy = Q
```

The exact Boolean equation depends on the FSM's state encoding and transition behavior.

---

* **Input & Output Description**

| Signal | Type | Description |
|---|---|---|
| `clk` | Input | Clock controlling state transitions |
| `reset` | Input | Initializes the FSM |
| `start` | Input | Requests transition from IDLE to ACTIVE |
| `done` | Input | Requests transition from ACTIVE to IDLE |
| `state` | Internal | Stores current state |
| `next_state` | Internal | Stores calculated next state |
| `busy` | Output | Indicates that FSM is ACTIVE |

---

* **Working Example**

Consider a simple controller:

```text
IDLE
  │
  │ start = 1
  ▼
ACTIVE
  │
  │ done = 1
  ▼
IDLE
```

### Step 1 — Reset

When reset is asserted:

```text
state = IDLE
```

Therefore:

```text
busy = 0
```

---

### Step 2 — Start

Suppose:

```text
state = IDLE
start = 1
```

The next-state logic calculates:

```text
next_state = ACTIVE
```

But the state register does not immediately change.

At the clock edge:

```text
IDLE ─────clock────► ACTIVE
```

Now:

```text
busy = 1
```

---

### Step 3 — Operation completes

Suppose:

```text
state = ACTIVE
done = 1
```

Then:

```text
next_state = IDLE
```

At the next clock edge:

```text
ACTIVE ───clock───► IDLE
```

Therefore:

```text
busy = 0
```

---

* **Complete FSM Verilog Structure**

A clean traditional three-block FSM can be written as:

```verilog
module fsm_controller (
    input  wire clk,
    input  wire reset,
    input  wire start,
    input  wire done,
    output reg  busy
);

    // State declarations
    parameter IDLE   = 1'b0;
    parameter ACTIVE = 1'b1;

    reg state;
    reg next_state;

    // --------------------------------
    // 1. State Register
    // --------------------------------
    always @(posedge clk or posedge reset)
    begin
        if (reset)
            state <= IDLE;
        else
            state <= next_state;
    end

    // --------------------------------
    // 2. Next-State Logic
    // --------------------------------
    always @(*)
    begin
        case (state)

            IDLE:
            begin
                if (start)
                    next_state = ACTIVE;
                else
                    next_state = IDLE;
            end

            ACTIVE:
            begin
                if (done)
                    next_state = IDLE;
                else
                    next_state = ACTIVE;
            end

            default:
                next_state = IDLE;

        endcase
    end

    // --------------------------------
    // 3. Output Logic
    // --------------------------------
    always @(*)
    begin
        case (state)

            IDLE:
                busy = 1'b0;

            ACTIVE:
                busy = 1'b1;

            default:
                busy = 1'b0;

        endcase
    end

endmodule
```

---

* **Understanding the Three Blocks**

The entire code can be remembered as:

```text
┌─────────────────────────────────┐
│       FSM VERILOG STRUCTURE     │
├─────────────────────────────────┤
│                                 │
│  1. State Register              │
│     always @(posedge clk)       │
│              ↓                  │
│     Stores current state        │
│                                 │
│  2. Next-State Logic            │
│     always @(*)                 │
│              ↓                  │
│     Calculates next state       │
│                                 │
│  3. Output Logic                │
│     always @(*)                 │
│              ↓                  │
│     Generates output            │
│                                 │
└─────────────────────────────────┘
```

The easiest memory trick is:

```text
REGISTER → STORE
NEXT-STATE → DECIDE
OUTPUT → RESPOND
```

---

* **Two-Block FSM Style**

FSMs can also be written using **two always blocks**.

The state register remains separate:

```verilog
always @(posedge clk or posedge reset)
begin
    if (reset)
        state <= IDLE;
    else
        state <= next_state;
end
```

Next-state and output logic can be combined:

```verilog
always @(*)
begin
    next_state = state;
    busy = 1'b0;

    case (state)

        IDLE:
        begin
            busy = 1'b0;

            if (start)
                next_state = ACTIVE;
        end

        ACTIVE:
        begin
            busy = 1'b1;

            if (done)
                next_state = IDLE;
        end

        default:
        begin
            next_state = IDLE;
            busy = 1'b0;
        end

    endcase
end
```

Both styles can be synthesizable.

For learning, the **three-block structure is often easier to understand** because each responsibility is clearly separated.

---

* **Important Coding Rules**

### Rule 1 — Use non-blocking assignment for sequential logic

```verilog
state <= next_state;
```

Prefer this inside clocked blocks.

---

### Rule 2 — Use blocking assignment for combinational logic

```verilog
next_state = IDLE;
```

and:

```verilog
busy = 1'b0;
```

are commonly used inside combinational blocks.

---

### Rule 3 — Give default values

A good combinational structure starts with defaults:

```verilog
always @(*)
begin
    next_state = state;

    case (state)
        ...
    endcase
end
```

This helps ensure that all outputs are assigned and avoids unintended latch inference.

---

### Rule 4 — Include a default state

```verilog
default:
    next_state = IDLE;
```

This provides a recovery path for unexpected state values.

---

* **Common Mistakes**

### Mistake 1 — Using `=` in the state register

Avoid:

```verilog
state = next_state;
```

Prefer:

```verilog
state <= next_state;
```

for clocked sequential logic.

---

### Mistake 2 — Forgetting a next-state assignment

Bad:

```verilog
always @(*)
begin
    case (state)

        IDLE:
            if (start)
                next_state = ACTIVE;

    endcase
end
```

There is no assignment when `start = 0`.

A safer approach is:

```verilog
always @(*)
begin
    next_state = state;

    case (state)

        IDLE:
            if (start)
                next_state = ACTIVE;

        ...
    endcase
end
```

---

### Mistake 3 — Forgetting the `default` case

A `default` case provides a defined behavior for unexpected state values.

```verilog
default:
    next_state = IDLE;
```

---

### Mistake 4 — Mixing sequential and combinational logic incorrectly

Keep the clocked state storage separate from the combinational next-state calculation.

```text
Sequential:
always @(posedge clk)

Combinational:
always @(*)
```

---

* **Applications**

FSM Verilog structures are widely used in:

- UART controllers
- SPI controllers
- I²C controllers
- CPU control units
- Memory controllers
- DMA controllers
- Bus protocol controllers
- Sequence detectors
- Traffic-light controllers
- Power-management controllers
- Handshake controllers

---

* **Advantages**

- Clear and organized RTL.
- Easy to understand.
- Easy to simulate.
- Easy to debug.
- Synthesizable.
- Separates sequential and combinational behavior.
- Suitable for ASIC and FPGA designs.
- Scales well to larger control systems.

---

* **Limitations**

- Large FSMs can require many states.
- Complex FSMs can make RTL lengthy.
- Incorrect combinational assignments can infer latches.
- Poor state encoding can increase hardware cost.
- Improper reset design can create unwanted behavior.

---

* **Real-World Example**

A **UART transmitter** can use states such as:

```text
IDLE
  ↓
START
  ↓
DATA
  ↓
STOP
  ↓
IDLE
```

The Verilog structure would contain:

```text
State Register
      ↓
IDLE / START / DATA / STOP
      ↓
Next-State Logic
      ↓
TX Control Logic
      ↓
UART TX Output
```

This is the same fundamental FSM structure used in much more complex RTL controllers.

---

* **Key Points**

1. FSM RTL normally contains a **state register**.
2. The state register stores the current state.
3. Next-state logic determines the next state.
4. Output logic generates FSM outputs.
5. State register → sequential logic.
6. Next-state logic → combinational logic.
7. Output logic → combinational logic in a conventional Moore implementation.
8. `always @(posedge clk)` is used for state storage.
9. `always @(*)` is used for combinational logic.
10. `<=` is normally used in sequential logic.
11. `=` is commonly used in combinational logic.
12. Default assignments help avoid unintended latches.
13. `default` cases provide handling for unexpected states.
14. The three-block FSM style is an important RTL coding pattern.

---

* **Interview Questions**

**1. What are the three main blocks of an FSM in Verilog?**

State register, next-state logic, and output logic.

**2. Which block is sequential?**

The state register.

**3. Which blocks are combinational?**

Next-state logic and output logic, in the conventional three-block style.

**4. Why is `<=` used in the state register?**

Because the state register represents flip-flops and non-blocking assignment models clocked state updates correctly.

**5. Why is `always @(*)` used for next-state logic?**

Because next-state logic is combinational.

**6. What is the purpose of `next_state`?**

It stores the state that the FSM should enter at the next active clock edge.

**7. What is the purpose of `default` in an FSM `case` statement?**

To define behavior for unexpected or illegal state values.

**8. What happens if a combinational signal is not assigned for every possible condition?**

The synthesis tool may infer a latch.

**9. What is the difference between current state and next state?**

Current state is stored in the state register; next state is the value calculated by combinational next-state logic.

**10. What is the most important FSM RTL relationship?**

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

* **Quick Revision**

```text
             FSM RTL
                │
       ┌────────┼────────┐
       │        │        │
       ▼        ▼        ▼
    STATE     NEXT     OUTPUT
   REGISTER   STATE     LOGIC
              LOGIC
       │        │        │
       │        │        └──► Output
       │        │
       │        └────────────► Next State
       │
       └─────────────────────► Current State
```

### Remember:

```text
State Register
     ↓
Stores

Next-State Logic
     ↓
Decides

Output Logic
     ↓
Produces
```

---

* **Summary**

**FSM Verilog Structure** provides a systematic method for implementing a finite state machine in synthesizable RTL. The most common structure separates the design into a **state register**, **next-state logic**, and **output logic**. The state register stores the current state, next-state logic determines the upcoming state based on current state and inputs, and output logic generates the required outputs. Understanding this structure is essential before moving to practical FSM designs such as **sequence detectors, UARTs, SPI controllers, and protocol controllers**.

---

* **References**

- Neso Academy — Finite State Machines and Verilog
- HDLBits — FSM and Verilog Practice
- IEEE — Verilog/SystemVerilog Language Concepts
- Digital Design and Computer Architecture — FSM and RTL Design
