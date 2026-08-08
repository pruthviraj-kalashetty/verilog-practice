# **Asynchronous Reset**

* **Overview**

An **Asynchronous Reset** is a reset technique used in sequential logic circuits where the reset operation takes effect immediately when the reset signal is asserted, without waiting for an active clock edge. It is commonly used to initialize flip-flops, registers, counters, and other sequential elements to a known state.

---

* **Definition**

An **Asynchronous Reset** is a reset signal that can reset a sequential circuit immediately when it is asserted, independently of the clock signal.

---

* **Why is it needed?**

  - To reset sequential circuits immediately.
  - To initialize flip-flops and registers to a known state.
  - To bring a digital system into a defined starting condition.
  - To reset circuits even when the clock is not active.
  - To provide fast recovery from abnormal conditions.
  - To control the initial state of sequential systems.

---

* **Syntax**

An asynchronous reset is included in the sensitivity list along with the clock.

For an active-high asynchronous reset:

```verilog
always @(posedge clk or posedge reset)
begin
    if (reset)
        q <= 1'b0;
    else
        q <= d;
end
```

For an active-low asynchronous reset:

```verilog
always @(posedge clk or negedge reset_n)
begin
    if (!reset_n)
        q <= 1'b0;
    else
        q <= d;
end
```

---

* **Structure / General Form**

The general structure of an asynchronous reset circuit is:

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
Reset = 1 → Reset immediately
Reset = 0 + Active Clock Edge → Normal operation
```

For an active-high asynchronous reset:

- **Reset = 1 → Reset**
- **Reset = 0 + Rising Edge → Normal Operation**

---

* **How it works**

  - The clock controls the normal operation of the sequential circuit.
  - The asynchronous reset operates independently of the clock.
  - When the reset signal is asserted, the circuit resets immediately.
  - The circuit does not need to wait for a clock edge.
  - When reset is deasserted, normal operation resumes at the next active clock edge.
  - For a positive-edge-triggered circuit, the clock controls normal data capture while the reset can act at any time.

For an active-high asynchronous reset:

```text
Reset = 1 → Immediate Reset
Reset = 0 → Wait for Clock Edge for Normal Operation
```

---

* **Code Example**

```verilog
module asynchronous_reset (
    input  wire clk,
    input  wire reset,
    input  wire d,
    output reg  q
);

always @(posedge clk or posedge reset)
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
  - `reset` is the asynchronous reset input.
  - `d` is the data input.
  - `q` is the output.
  - `posedge clk` detects the rising edge of the clock.
  - `posedge reset` detects the rising edge of the reset signal.
  - `if (reset)` checks whether the reset is active.
  - If `reset = 1`, `q` is immediately set to `0`.
  - If `reset = 0`, `q` is updated with `d` at the rising edge of the clock.
  - The reset is included in the sensitivity list because it operates independently of the clock.

---

* **Input & Output Description**

  - Inputs:-
    - `clk` [Clock Input]
    - `reset` [Asynchronous Reset Input]
    - `d` [Data Input]

  - Output:-
    - `q` [Output]

  - **clk** controls normal sequential operation.
  - **reset** immediately resets the output when asserted.
  - **d** provides the normal operating data.
  - **q** represents the stored output.

---

* **Working Example**

  - Consider:
    - `reset = 0`
    - `d = 1`
    - `q = 1`

Now assert the reset:

```text
reset: 0 → 1
```

The reset is asserted immediately.

The output becomes:

```text
q = 0
```

The clock does not need to change.

Another Example:

- `reset = 0`
- `d = 1`

When:

```text
clk: 0 → 1
```

A rising clock edge occurs.

Since reset is inactive:

```text
q = d
q = 1
```

Therefore, normal operation resumes on the active clock edge.

---

* **Simulation / Expected Output**

| Clock | Reset | D | Q |
|---|---:|---:|---:|
| 0 | 0 | 1 | Previous Q |
| 1 | 0 | 1 | 1 |
| 0 | 1 | 1 | 0 |
| 1 | 1 | 0 | 0 |
| 0 | 0 | 1 | 0 |
| Rising Edge | 0 | 1 | 1 |

The important point is that **Q becomes `0` immediately when the asynchronous reset is asserted**, even if there is no clock edge.

---

* **Synthesizability**

An asynchronous reset is synthesizable.

```verilog
always @(posedge clk or posedge reset)
begin
    if (reset)
        q <= 1'b0;
    else
        q <= d;
end
```

Synthesis tools can implement this behavior using sequential elements such as flip-flops with asynchronous reset capability.

---

* **Common Mistakes**

  - Forgetting to include the reset in the sensitivity list.
  - Treating an asynchronous reset like a synchronous reset.
  - Using the wrong reset polarity.
  - Using blocking assignment `=` instead of non-blocking assignment `<=`.
  - Forgetting the reset condition inside the `always` block.
  - Assuming the reset requires a clock edge.
  - Incorrectly deasserting the reset without considering timing requirements.

---

* **Best Practices**

  - Clearly define the reset polarity.
  - Include the asynchronous reset in the sensitivity list.
  - Use non-blocking assignment `<=`.
  - Use a consistent reset strategy throughout the design.
  - Ensure the reset signal is clean and reliable.
  - Carefully handle reset deassertion in synchronous systems.
  - Verify reset behavior through simulation.
  - Consider recovery and removal timing when implementing asynchronous resets.

---

* **Applications**

  *Asynchronous reset is used in:*

  - Flip-Flops.
  - Registers.
  - Counters.
  - Shift Registers.
  - Finite State Machines (FSMs).
  - Processor Systems.
  - FPGA Design.
  - RTL Design.
  - VLSI Systems.
  - Digital Control Systems.

---

* **Advantages**

  - Resets the circuit immediately.
  - Does not require a clock edge.
  - Can reset the circuit even when the clock is stopped.
  - Provides fast initialization.
  - Useful for emergency or system-wide reset conditions.

---

* **Limitations**

  - Reset deassertion can create timing problems.
  - Requires careful handling of recovery and removal timing.
  - Can introduce reset synchronization issues.
  - Improper reset distribution can affect large digital systems.
  - May require additional reset synchronization techniques.

---

* **Real-World Example**

  - **CPU Reset:** A processor can be immediately placed into a known reset state.
  - **FPGA Systems:** Asynchronous reset can initialize registers during system startup.
  - **Communication Systems:** Reset can quickly initialize communication logic.
  - **Digital Controllers:** A system can be forced into a known state immediately.
  - **Safety Systems:** An immediate reset can stop or reinitialize digital control logic.

---

* **Key Points**

  - An **Asynchronous Reset** operates independently of the clock.
  - The circuit resets immediately when the reset is asserted.
  - An active-high asynchronous reset uses:

    ```verilog
    always @(posedge clk or posedge reset)
    ```

  - An active-low asynchronous reset uses:

    ```verilog
    always @(posedge clk or negedge reset_n)
    ```

  - Reset is included in the sensitivity list.
  - The reset does not require a clock edge.
  - Non-blocking assignment `<=` is normally used.
  - Reset deassertion requires careful timing consideration.
  - Recovery and removal timing are important for asynchronous reset designs.

---

* **Interview Questions**

**1. What is an asynchronous reset?**

**Answer:**

An asynchronous reset is a reset signal that resets a sequential circuit immediately when asserted, without waiting for a clock edge.

---

**2. Does an asynchronous reset require a clock edge?**

**Answer:**

No. An asynchronous reset can reset the circuit independently of the clock.

---

**3. How is an active-high asynchronous reset written in Verilog?**

**Answer:**

```verilog
always @(posedge clk or posedge reset)
begin
    if (reset)
        q <= 1'b0;
    else
        q <= d;
end
```

---

**4. How is an active-low asynchronous reset written in Verilog?**

**Answer:**

```verilog
always @(posedge clk or negedge reset_n)
begin
    if (!reset_n)
        q <= 1'b0;
    else
        q <= d;
end
```

---

**5. What is the difference between synchronous and asynchronous reset?**

**Answer:**

A synchronous reset takes effect only at the active clock edge, while an asynchronous reset can take effect immediately when it is asserted.

---

**6. Why is reset included in the sensitivity list for asynchronous reset?**

**Answer:**

Because the reset must be able to trigger the sequential block independently of the clock.

---

**7. What happens when an asynchronous reset is asserted?**

**Answer:**

The sequential circuit immediately enters its predefined reset state without waiting for a clock edge.

---

**8. What happens when an asynchronous reset is deasserted?**

**Answer:**

Normal operation resumes according to the clock and the sequential logic. In practical designs, reset deassertion is often synchronized to the clock domain.

---

**9. Which assignment operator is normally used with asynchronous reset logic?**

**Answer:**

The non-blocking assignment operator `<=` is normally used.

---

**10. What timing parameters are important for asynchronous reset deassertion?**

**Answer:**

**Recovery time** and **removal time** are important timing parameters for asynchronous reset deassertion.

---

**11. Can an asynchronous reset work when the clock is stopped?**

**Answer:**

Yes. Since the reset operates independently of the clock, it can reset the circuit even when the clock is not running.

---

**12. Why must asynchronous reset deassertion be handled carefully?**

**Answer:**

Improper deassertion can cause different sequential elements to leave reset at different times, potentially leading to metastability or unpredictable circuit behavior.

---

* **Quick Revision**

  - Reset Type → **Asynchronous**
  - Reset Timing → **Immediate**
  - Clock Required for Reset → **No**
  - Positive-Edge Clock → **`posedge clk`**
  - Active-High Reset → **`posedge reset`**
  - Active-Low Reset → **`negedge reset_n`**
  - Reset Sensitivity → **Included in sensitivity list**
  - Reset State → **`q <= 1'b0`**
  - Sequential Assignment → **`<=`**
  - Main Advantage → **Immediate reset**
  - Main Limitation → **Reset deassertion timing**
  - Important Timing Parameters → **Recovery and Removal**

---

* **Summary**

An **Asynchronous Reset** is a reset technique in which the sequential circuit can be reset immediately when the reset signal is asserted, without waiting for a clock edge. In Verilog, the reset is included in the sensitivity list along with the clock. Asynchronous resets are useful for immediate initialization and system-wide reset conditions, but their deassertion must be carefully controlled to avoid timing and synchronization problems.

---

* **References**

  - Samir Palnitkar – *Verilog HDL: A Guide to Digital Design and Synthesis*.
  - M. Morris Mano – *Digital Design*.
  - David Harris and Sarah Harris – *Digital Design and Computer Architecture*.
  - Neso Academy – Digital Electronics and Verilog HDL.
  - IEEE – *IEEE Standard for Verilog Hardware Description Language*.
