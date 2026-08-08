# **Synchronous Reset**

* **Overview**

A **Synchronous Reset** is a reset technique used in sequential logic circuits where the reset operation takes effect only at the active edge of the clock. The circuit does not reset immediately when the reset signal changes; instead, the reset is checked and applied at the specified clock edge.

---

* **Definition**

A **Synchronous Reset** is a reset signal that resets the state of a sequential circuit only when the active clock edge occurs.

---

* **Why is it needed?**

  - To initialize sequential circuits to a known state.
  - To bring registers and flip-flops to a defined state.
  - To synchronize the reset operation with the clock.
  - To provide predictable circuit behavior.
  - To avoid asynchronous reset timing issues.
  - To control the startup and recovery of sequential systems.

---

* **Syntax**

A synchronous reset is checked inside the clocked procedural block:

```verilog
always @(posedge clk)
begin
    if (reset)
        q <= 1'b0;
    else
        q <= d;
end
```

---

* **Structure / General Form**

The general structure of a synchronous reset circuit is:

```text
              ┌───────────────┐
D ───────────►│               │
              │   Sequential  │──────► Q
Reset ───────►│     Logic     │
              │               │
CLK ─────────►│               │
              └───────────────┘
```

The operation is:

```text
Reset = 1 + Active Clock Edge → Reset the circuit
Reset = 0 + Active Clock Edge → Normal operation
```

---

* **How it works**

  - The clock controls when the sequential circuit evaluates the reset signal.
  - When the reset signal is asserted, the circuit does not reset immediately.
  - The reset is applied only at the active clock edge.
  - For a positive-edge-triggered circuit, the reset is checked at the rising edge.
  - If reset is active at that edge, the output is set to the reset value.
  - If reset is inactive, the circuit performs its normal operation.

For an active-high synchronous reset:

- **Reset = 1 + Rising Edge → Reset**
- **Reset = 0 + Rising Edge → Normal Operation**

---

* **Code Example**

```verilog
module synchronous_reset (
    input  wire clk,
    input  wire reset,
    input  wire d,
    output reg  q
);

always @(posedge clk)
begin
    if (reset)
        q <= 1'b0;
    else
        q <= d;
end

endmodule
```

---

* **Code Explanation**

  - `clk` is the clock input.
  - `reset` is the synchronous reset input.
  - `d` is the data input.
  - `q` is the output.
  - `always @(posedge clk)` makes the circuit respond to the rising edge of the clock.
  - `if (reset)` checks whether the reset is active.
  - If `reset = 1`, `q` is set to `0`.
  - If `reset = 0`, `q` receives the value of `d`.
  - The reset is not included in the sensitivity list because it is synchronous.

---

* **Input & Output Description**

  - Inputs:-
    - `clk` [Clock Input]
    - `reset` [Synchronous Reset Input]
    - `d` [Data Input]

  - Output:-
    - `q` [Output]

  - **clk** controls when the circuit updates.
  - **reset** initializes the output to the reset state at the active clock edge.
  - **d** provides the normal operating data.
  - **q** represents the stored output.

---

* **Working Example**

  - Consider:
    - `reset = 1`
    - `d = 1`
    - `clk = 0`

At this time:

```text
reset = 1
clk = 0
```

The circuit does not reset immediately because there is no active clock edge.

When:

```text
clk: 0 → 1
```

A rising edge occurs.

Since:

```text
reset = 1
```

The output becomes:

```text
q = 0
```

Another Example:

- `reset = 0`
- `d = 1`

At the next rising edge:

```text
clk: 0 → 1
```

Since reset is inactive:

```text
q = d
q = 1
```

---

* **Simulation / Expected Output**

| Clock | Reset | D | Q |
|---|---:|---:|---:|
| 0 | 0 | 1 | Previous Q |
| Rising Edge | 1 | 1 | 0 |
| 0 | 0 | 1 | 0 |
| Rising Edge | 0 | 1 | 1 |
| 0 | 1 | 0 | 1 |
| Rising Edge | 1 | 0 | 0 |

The important point is that **Q changes because of reset only at the active clock edge**.

---

* **Synthesizability**

A synchronous reset is synthesizable.

```verilog
always @(posedge clk)
begin
    if (reset)
        q <= 1'b0;
    else
        q <= d;
end
```

Synthesis tools can implement this behavior using sequential logic such as a flip-flop with synchronous reset functionality or equivalent logic.

---

* **Common Mistakes**

  - Putting the synchronous reset in the sensitivity list.
  - Assuming the output resets immediately when reset changes.
  - Confusing synchronous reset with asynchronous reset.
  - Using blocking assignment `=` instead of non-blocking assignment `<=`.
  - Forgetting the reset condition inside the clocked block.
  - Using an incorrect reset polarity.
  - Not defining the required reset state.

---

* **Best Practices**

  - Keep synchronous reset inside the clocked `always` block.
  - Use non-blocking assignment `<=`.
  - Clearly define whether reset is active-high or active-low.
  - Use a consistent reset strategy throughout the design.
  - Define a known reset state for sequential elements.
  - Verify reset behavior at the active clock edge during simulation.
  - Avoid mixing synchronous and asynchronous reset styles unnecessarily.

---

* **Applications**

  *Synchronous reset is used in:*

  - Flip-Flops.
  - Registers.
  - Counters.
  - Shift Registers.
  - Finite State Machines (FSMs).
  - Processor Datapaths.
  - FPGA Design.
  - RTL Design.
  - VLSI Systems.
  - Digital Control Systems.

---

* **Advantages**

  - Reset operation is synchronized with the clock.
  - Provides predictable timing behavior.
  - Avoids asynchronous reset transitions.
  - Easy to integrate into synchronous RTL designs.
  - Provides controlled state initialization.

---

* **Limitations**

  - Reset does not take effect immediately.
  - Requires an active clock edge for reset operation.
  - Cannot reset the circuit when the clock is stopped.
  - Reset timing must be considered during design.
  - May require additional logic depending on the target hardware.

---

* **Real-World Example**

  - **CPU Registers:** Registers can be initialized to known values at a clock edge.
  - **Counters:** A counter can be synchronously returned to zero.
  - **FSMs:** A state machine can return to its initial state at the next clock edge.
  - **FPGA Designs:** Synchronous resets are commonly used in clocked RTL logic.
  - **Digital Controllers:** Control registers can be initialized synchronously.

---

* **Key Points**

  - A synchronous reset operates only with the clock.
  - Reset takes effect at the active clock edge.
  - Reset is normally placed inside the clocked `always` block.
  - For positive-edge-triggered logic:

    ```verilog
    always @(posedge clk)
    ```

  - Active-high synchronous reset:

    ```verilog
    if (reset)
        q <= 1'b0;
    ```

  - Reset does not immediately change the output when the reset signal changes.
  - Non-blocking assignment `<=` is normally used.
  - Synchronous reset provides controlled and clock-aligned initialization.

---

* **Interview Questions**

**1. What is a synchronous reset?**

**Answer:**

A synchronous reset is a reset signal that takes effect only at the active edge of the clock.

---

**2. When does a synchronous reset take effect?**

**Answer:**

A synchronous reset takes effect at the active clock edge when the reset signal is asserted.

---

**3. Where is synchronous reset checked in Verilog?**

**Answer:**

It is checked inside the clocked procedural block.

```verilog
always @(posedge clk)
begin
    if (reset)
        q <= 1'b0;
end
```

---

**4. Does a synchronous reset immediately reset the circuit?**

**Answer:**

No. A synchronous reset does not reset the circuit immediately. It takes effect only at the active clock edge.

---

**5. What is the difference between synchronous and asynchronous reset?**

**Answer:**

A synchronous reset takes effect only at the active clock edge, while an asynchronous reset can take effect immediately when the reset signal is asserted.

---

**6. Why is reset not included in the sensitivity list for a synchronous reset?**

**Answer:**

Because the reset is required to be sampled only at the active clock edge.

---

**7. Which assignment operator is normally used with synchronous reset logic?**

**Answer:**

The non-blocking assignment operator `<=` is normally used.

---

**8. What happens when reset is active at the rising edge?**

**Answer:**

The sequential circuit is reset to its predefined reset state.

For example:

```verilog
if (reset)
    q <= 1'b0;
```

The output becomes `0`.

---

**9. What happens when reset is inactive?**

**Answer:**

The circuit performs its normal operation and updates according to the input data at the active clock edge.

---

**10. Can a synchronous reset work without a clock edge?**

**Answer:**

No. A synchronous reset requires the active clock edge to take effect.

---

* **Quick Revision**

  - Reset Type → **Synchronous**
  - Reset Timing → **At Active Clock Edge**
  - Positive-Edge Clock → **`posedge clk`**
  - Reset Sensitivity → **Not separately included**
  - Active-High Reset → **`reset = 1`**
  - Reset State → **`q <= 1'b0`**
  - Normal Operation → **`reset = 0`**
  - Sequential Assignment → **`<=`**
  - Reset Immediate? → **No**
  - Requires Clock Edge? → **Yes**
  - Main Advantage → **Clock-synchronized reset**
  - Main Limitation → **Cannot reset until an active clock edge occurs**

---

* **Summary**

A **Synchronous Reset** is a reset technique in which the sequential circuit is reset only at the active edge of the clock. Unlike an asynchronous reset, the reset signal does not immediately change the circuit state. In Verilog, synchronous reset is implemented inside the clocked `always` block and is commonly used in registers, counters, FSMs, FPGA designs, and RTL systems.

---

* **References**

  - Samir Palnitkar – *Verilog HDL: A Guide to Digital Design and Synthesis*.
  - M. Morris Mano – *Digital Design*.
  - David Harris and Sarah Harris – *Digital Design and Computer Architecture*.
  - Neso Academy – Digital Electronics and Verilog HDL.
  - IEEE – *IEEE Standard for Verilog Hardware Description Language*.
