# **State Transition Table**

* **Overview**

A **State Transition Table** is a tabular representation of an FSM that shows how the system moves from its **current state** to its **next state** for every possible input condition.

It is one of the easiest ways to convert a **state diagram into RTL**, because it clearly lists all possible state transitions.

---

* **Definition**

A **State Transition Table** is a table that specifies:

```text
Current State + Input → Next State
```

For every combination of **current state** and **input**, the table tells us which state the FSM will enter next.

---

* **Why is it needed?**

A state transition table is useful because it:

- Clearly defines FSM behavior.
- Lists all possible input conditions.
- Makes missing transitions easier to identify.
- Helps derive next-state logic.
- Makes RTL coding easier.
- Helps verify FSM behavior.
- Acts as a bridge between the **state diagram** and **RTL code**.

The design flow is:

```text
Requirement
     ↓
State Diagram
     ↓
State Transition Table
     ↓
Next-State Logic
     ↓
RTL
```

---

* **Working Principle**

Consider an FSM with two states:

```text
S0 = IDLE
S1 = ACTIVE
```

and one input:

```text
X
```

Suppose the state diagram specifies:

```text
S0 + X=0 → S0
S0 + X=1 → S1

S1 + X=0 → S0
S1 + X=1 → S1
```

The transition table represents the same information:

| **Current State** | **Input X** | **Next State** |
|---|---:|---|
| S0 | 0 | S0 |
| S0 | 1 | S1 |
| S1 | 0 | S0 |
| S1 | 1 | S1 |

The table answers one simple question:

> **"Given the current state and input, what will be the next state?"**

---

* **Circuit Diagram**

The relationship can be represented as:

```text
                 ┌───────────────────┐
Input ──────────►│                   │
                 │ Next-State Logic  │
Current State ──►│                   │
                 └─────────┬─────────┘
                           │
                           ▼
                      Next State
                           │
                           ▼
                    ┌─────────────┐
              Clock │    State    │
             ──────►│   Register  │
                    └──────┬──────┘
                           │
                           ▼
                     Current State
```

The **State Transition Table** describes the behavior of the block marked **Next-State Logic**.

---

* **Truth Table**

For an FSM, the State Transition Table itself acts like a truth table for the state transitions.

| **Current State** | **Input X** | **Next State** |
|---|---:|---|
| S0 | 0 | S0 |
| S0 | 1 | S1 |
| S1 | 0 | S0 |
| S1 | 1 | S1 |

If state encoding is:

```text
S0 = 0
S1 = 1
```

then the table becomes:

| **Current State Q** | **Input X** | **Next State Q(next)** |
|---:|---:|---:|
| 0 | 0 | 0 |
| 0 | 1 | 1 |
| 1 | 0 | 0 |
| 1 | 1 | 1 |

From this table:

```text
Q(next) = X
```

---

* **Boolean Expression**

Using the encoded state:

```text
S0 = 0
S1 = 1
```

the transition table is:

| Q | X | Q(next) |
|---:|---:|---:|
| 0 | 0 | 0 |
| 0 | 1 | 1 |
| 1 | 0 | 0 |
| 1 | 1 | 1 |

Therefore:

```text
Q(next) = X
```

This means the next-state logic simply follows the input `X`.

---

* **Input & Output Description**

| Signal / Term | Description |
|---|---|
| Current State | State in which the FSM is currently operating |
| Input | External condition affecting the transition |
| Next State | State entered after the state transition |
| Clock | Controls when the next state becomes the current state |
| State Register | Stores the current state |

---

* **Working Example**

Consider a simple machine with:

```text
States:
S0 = IDLE
S1 = ACTIVE

Input:
X
```

The transition rules are:

```text
If X = 0 → go to IDLE
If X = 1 → go to ACTIVE
```

### Current State = S0

If:

```text
X = 0
```

then:

```text
S0 → S0
```

If:

```text
X = 1
```

then:

```text
S0 → S1
```

### Current State = S1

If:

```text
X = 0
```

then:

```text
S1 → S0
```

If:

```text
X = 1
```

then:

```text
S1 → S1
```

Therefore:

```text
             X=1
       ┌─────────────┐
       │             ▼
     ┌────┐        ┌────┐
     │ S0 │        │ S1 │
     └────┘        └────┘
       ▲             │
       │             │
       └──── X=0 ────┘
```

---

* **State Diagram to Transition Table**

A state diagram:

```text
              X=1
        ┌──────────────┐
        │              ▼
      ┌────┐          ┌────┐
      │ S0 │          │ S1 │
      └────┘          └────┘
        ▲               │
        └────── X=0 ────┘
```

can be converted directly into:

| **Current State** | **Condition** | **Next State** |
|---|---|---|
| S0 | X = 0 | S0 |
| S0 | X = 1 | S1 |
| S1 | X = 0 | S0 |
| S1 | X = 1 | S1 |

So:

```text
State Diagram
      ↓
Read every transition
      ↓
Write Current State
      ↓
Write Input Condition
      ↓
Write Next State
      ↓
State Transition Table
```

---

* **State Transition Table to RTL**

Once the table is available, it can be directly converted into next-state RTL.

For example:

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

The relationship is:

```text
Transition Table
      ↓
if / else
      ↓
case statement
      ↓
Next-State Logic
```

---

* **Moore FSM Transition Table**

For a **Moore FSM**, the output depends only on the current state.

Therefore, the table normally contains:

```text
Current State
Input
Next State
Output
```

Example:

| **Current State** | **Input X** | **Next State** | **Output Y** |
|---|---:|---|---:|
| S0 | 0 | S0 | 0 |
| S0 | 1 | S1 | 0 |
| S1 | 0 | S0 | 1 |
| S1 | 1 | S1 | 1 |

Notice that the output remains the same for both input conditions when the current state is the same.

```text
S0 → Y = 0
S1 → Y = 1
```

---

* **Mealy FSM Transition Table**

For a **Mealy FSM**, the output depends on:

```text
Current State + Input
```

Therefore, different inputs can produce different outputs even when the current state is the same.

Example:

| **Current State** | **Input X** | **Next State** | **Output Y** |
|---|---:|---|---:|
| S0 | 0 | S0 | 0 |
| S0 | 1 | S1 | 1 |
| S1 | 0 | S0 | 0 |
| S1 | 1 | S1 | 0 |

The important difference is:

```text
Moore:
Output = Current State

Mealy:
Output = Current State + Input
```

---

* **Applications**

State transition tables are commonly used for:

- UART controllers
- SPI controllers
- I²C controllers
- Sequence detectors
- Traffic-light controllers
- CPU control units
- Bus protocol controllers
- Memory controllers
- DMA controllers
- Communication protocols
- Power-management controllers

---

* **Advantages**

- Simple and systematic representation.
- Easy to read and verify.
- Clearly shows every transition.
- Helps identify missing transitions.
- Useful for deriving Boolean equations.
- Directly supports RTL coding.
- Useful for FSM verification and testbench development.

---

* **Limitations**

- Large FSMs can produce very large tables.
- Complex behavior can be harder to visualize than a state diagram.
- State encoding is not always obvious from the table.
- Output behavior may require additional columns.

---

* **Real-World Example**

Consider a **traffic-light controller**.

Possible states:

```text
S0 = RED
S1 = GREEN
S2 = YELLOW
```

Suppose the FSM follows:

```text
RED → GREEN
GREEN → YELLOW
YELLOW → RED
```

A simplified transition table is:

| **Current State** | **Timer Done** | **Next State** |
|---|---:|---|
| RED | 0 | RED |
| RED | 1 | GREEN |
| GREEN | 0 | GREEN |
| GREEN | 1 | YELLOW |
| YELLOW | 0 | YELLOW |
| YELLOW | 1 | RED |

This table completely describes the state transitions.

The RTL designer can then convert these transitions into Verilog/SystemVerilog.

---

* **Key Points**

1. A State Transition Table describes FSM transitions in tabular form.
2. It contains at least **Current State, Input, and Next State**.
3. It is derived from the state diagram.
4. It helps create next-state logic.
5. State encoding converts symbolic states into binary values.
6. Moore FSMs can include output based only on current state.
7. Mealy FSMs include output based on current state and input.
8. Every valid state/input combination should be considered.
9. A transition table is an important bridge between **FSM design and RTL coding**.
10. It is especially useful for debugging and verification.

---

* **Interview Questions**

**1. What is a State Transition Table?**

A table that defines the next state for every combination of current state and input.

**2. What are the basic columns of a transition table?**

Current State, Input, and Next State.

**3. Why is a transition table useful in RTL design?**

It provides a systematic representation that can be directly converted into next-state logic.

**4. What is the difference between a state diagram and transition table?**

A state diagram represents FSM behavior graphically, while a transition table represents the same behavior in tabular form.

**5. What is state encoding?**

Assigning binary values to symbolic FSM states.

**6. What additional column is commonly included for a Moore FSM?**

Output, because the output depends on the current state.

**7. What additional information is needed for a Mealy FSM?**

The output depends on both the current state and input.

**8. What happens if a state/input combination is missing?**

The FSM behavior may be undefined for that condition, so the RTL should handle it appropriately.

**9. How is a transition table converted into RTL?**

The transitions are implemented using combinational logic, commonly with `case`, `if`, or `else` statements.

---

* **Quick Revision**

```text
State Diagram
      ↓
Identify States
      ↓
Identify Inputs
      ↓
List Every Transition
      ↓
State Transition Table
      ↓
State Encoding
      ↓
Next-State Logic
      ↓
RTL
```

Remember the fundamental equation:

```text
Current State + Input
          ↓
     Next State
```

And for a clocked FSM:

```text
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

A **State Transition Table** is a structured representation of an FSM that specifies the **next state for every combination of current state and input**. It provides a clear bridge between a state diagram and RTL implementation. By reading each transition from the diagram and placing it into a table, the designer can systematically derive the next-state logic and implement the FSM in synthesizable Verilog/SystemVerilog.

---

* **References**

- Neso Academy — Finite State Machines
- HDLBits — FSM Design and RTL Practice
- IEEE — Verilog/SystemVerilog Language Concepts
- Digital Design and Computer Architecture — FSM Design
