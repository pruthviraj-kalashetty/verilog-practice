# State and Next State

## 📖 Overview

In a **Finite State Machine (FSM)**, a digital system moves between different **states** based on its current condition and input.

Two important concepts are:

- **Current State** — the state in which the FSM is currently present.
- **Next State** — the state to which the FSM will move after the next clock event.

Understanding **State** and **Next State** is the foundation for designing FSMs.

---

# Definition

### State

> **A State represents the current condition or status of an FSM at a particular time.**

### Next State

> **The Next State is the state that the FSM will enter after the next state transition, based on the current state and input.**

---

# Why is it Needed?

State and Next State are needed because an FSM must remember its current condition and determine what should happen next.

They help to:

- Store the current condition of a system.
- Determine the next operation.
- Control sequential behavior.
- Design counters, controllers, protocols, and control units.
- Implement complex sequential logic.

Without states, an FSM cannot remember its previous condition or control its sequence of operations.

---

# Working Principle

An FSM generally works in three steps:

```text
             Input
               │
               ▼
       ┌─────────────────┐
       │ Next-State Logic│
       └────────┬────────┘
                │
             Next State
                │
                ▼
          ┌───────────┐
 Clock ──►│ State     │
          │ Register  │
          └─────┬─────┘
                │
          Current State
                │
                ▼
       ┌─────────────────┐
       │ Output / Control│
       └─────────────────┘
```

### Step 1 — Current State

The **state register** stores the current state of the FSM.

### Step 2 — Determine Next State

The **next-state logic** examines:

- Current State
- Input

and determines the next state.

```text
Next State = f(Current State, Input)
```

### Step 3 — State Transition

At the active clock edge, the FSM changes from the current state to the calculated next state.

```text
Current State ──► Next State
                  ↑
              Clock Edge
```

---

# State Transition Example

Consider a simple FSM with two states:

```text
S0 = IDLE
S1 = ACTIVE
```

Suppose input `X` controls the transition.

```text
              X = 1
        ┌────────────────┐
        │                ▼
      ┌─────┐          ┌──────┐
      │ IDLE│          │ACTIVE│
      │ S0  │          │ S1   │
      └─────┘          └──────┘
        ▲                │
        │                │
        └────────────────┘
              X = 0
```

For example:

| Current State | Input X | Next State |
|:-------------:|:-------:|:----------:|
| S0 (IDLE) | 0 | S0 |
| S0 (IDLE) | 1 | S1 |
| S1 (ACTIVE) | 0 | S0 |
| S1 (ACTIVE) | 1 | S1 |

---

# Circuit Diagram

A typical FSM contains three main parts:

```text
                    ┌───────────────────┐
          Input ───►│                   │
                    │  Next-State Logic │
                    │                   │
 Current State ────►│                   │
                    └─────────┬─────────┘
                              │
                              ▼
                         Next State
                              │
                              ▼
                       ┌────────────┐
                Clock ─►│ State      │
                       │ Register   │
                       └─────┬──────┘
                             │
                             ▼
                       Current State
                             │
                             ▼
                       Output Logic
                             │
                             ▼
                           Output
```

The **state register** stores the state, while the **next-state logic** decides which state comes next.

---

# Truth Table

For the example FSM:

| **Current State** | **Input X** | **Next State** |
|:------------------:|:-----------:|:--------------:|
| S0 | 0 | S0 |
| S0 | 1 | S1 |
| S1 | 0 | S0 |
| S1 | 1 | S1 |

---

# Boolean Expression

For the two-state example, let:

```text
S0 = 0
S1 = 1
```

Let the state variable be `Q`.

The next-state equation is:

```text
Q(next) = X
```

This is only for the simple example used in this note. In a practical FSM, the next-state equation depends on the specific state-transition requirements.

---

# Input & Output Description

| Signal | Description |
|--------|-------------|
| Current State | Represents the state currently stored in the FSM. |
| Input | Determines how the FSM should transition. |
| Clock | Determines when the state changes. |
| Next State | The state selected for the next clock cycle. |
| Output | Represents the result or control signal generated by the FSM. |

---

# Working Example

Consider a simple FSM that detects whether a system is **IDLE** or **ACTIVE**.

### Initial Condition

```text
Current State = IDLE (S0)
```

If:

```text
Input X = 0
```

then:

```text
Next State = IDLE (S0)
```

The FSM remains in the IDLE state.

---

Now suppose:

```text
Input X = 1
```

Then:

```text
Current State = IDLE
       ↓
Next State = ACTIVE
```

At the next active clock edge:

```text
IDLE → ACTIVE
```

Now the FSM is in the ACTIVE state.

If `X` becomes `0`:

```text
ACTIVE → IDLE
```

Therefore, the FSM continuously follows the sequence determined by its **current state and input**.

---

# Applications

The concept of State and Next State is used in:

- Traffic Light Controllers
- UART Controllers
- SPI Controllers
- I²C Controllers
- Sequence Detectors
- Vending Machines
- CPU Control Units
- Bus Controllers
- Protocol Controllers
- Memory Controllers
- Digital Control Systems

---

# Advantages

- Makes sequential logic easier to design.
- Clearly defines system behavior.
- Helps organize complex control operations.
- Makes RTL implementation easier.
- Simplifies debugging and verification.
- Provides predictable state transitions.

---

# Limitations

- A large number of states can make the FSM complex.
- Incorrect state-transition design can cause unexpected behavior.
- More states require more state-register bits.
- Poor FSM coding can lead to difficult-to-debug RTL.

---

# Real-World Example

Consider a **traffic light controller**.

The FSM may have states such as:

```text
S0 → RED
S1 → GREEN
S2 → YELLOW
```

The current state tells us which traffic light is currently active.

For example:

```text
Current State = RED
        │
        ▼
Next State = GREEN
```

At the appropriate clock event, the FSM changes:

```text
RED → GREEN
```

The same concept is used in digital controllers inside processors and communication systems.

---

# Key Points

- **State** represents the current condition of an FSM.
- **Next State** represents where the FSM will go next.
- The next state depends on the **current state and input**.
- A **state register** stores the current state.
- **Next-state logic** calculates the next state.
- The **clock** controls when the state changes.
- State transition is fundamental to every FSM.

---

# Interview Questions

### 1. What is a state in an FSM?

A state represents the current condition or status of the system.

### 2. What is a next state?

The next state is the state that the FSM will enter after the next active clock edge.

### 3. What determines the next state?

The next state is generally determined by the **current state and input**.

```text
Next State = f(Current State, Input)
```

### 4. What stores the current state?

A **state register**, implemented using flip-flops, stores the current state.

### 5. When does the FSM change its state?

In a synchronous FSM, the state normally changes at the active edge of the clock.

### 6. What is the difference between current state and next state?

| Current State | Next State |
|---|---|
| State currently stored | State selected for the next clock cycle |
| Represents present condition | Represents future condition |
| Stored in state register | Calculated by next-state logic |

---

# Quick Revision

```text
Current State + Input
          │
          ▼
   Next-State Logic
          │
          ▼
      Next State
          │
       Clock Edge
          │
          ▼
    Current State
```

Remember:

> **Current State = Where the FSM is now**

> **Next State = Where the FSM will go next**

---

# Summary

In an FSM, the **current state** represents the present condition of the system, while the **next state** represents the state that the system will enter after the next clock event. The next-state logic uses the current state and input to determine the next state, and the state register stores that state. This simple concept forms the foundation of all FSM-based digital controllers.

---

# References

1. Stephen Brown & Zvonko Vranesic – *Fundamentals of Digital Logic with Verilog Design*
2. M. Morris Mano – *Digital Design*
3. Samir Palnitkar – *Verilog HDL: A Guide to Digital Design and Synthesis*
4. David Harris & Sarah Harris – *Digital Design and Computer Architecture*
