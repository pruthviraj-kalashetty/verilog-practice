# **What is a Latch?**

* **Overview**

A **Latch** is a sequential logic circuit that can store one bit of information. Unlike a flip-flop, which changes its output on a specific clock edge, a latch is **level-sensitive** and can change its output while its enable or control signal is active. Latches are important building blocks in digital systems and are also relevant in understanding unintended latch inference during RTL design.

---

* **Definition**

A **Latch** is a sequential storage element that stores and holds a binary value. Its output can change when the control or enable signal is at its active level and remains unchanged when the latch is disabled.

---

* **Why is it needed?**

  - To store one bit of information.
  - To retain data when the latch is disabled.
  - To understand level-sensitive sequential logic.
  - To implement controlled data storage.
  - To understand latch inference in Verilog.
  - To distinguish latches from edge-triggered flip-flops.

---

* **Syntax**

A basic Verilog latch can be described using an `always @(*)` block:

```verilog id="0z7d8m"
always @(*)
begin
    if (enable)
        q = d;
end
```

When `enable = 1`, the output follows the input.

When `enable = 0`, there is no new assignment to `q`, so the previous value is retained.

---

* **Structure / General Form**

A basic latch can be represented as:

```text id="2j4k6p"
        D
        │
        ▼
   ┌─────────┐
   │  Latch  │
   │         │
E ─►│ Enable  │
   └────┬────┘
        │
        ▼
        Q
```

Where:

  - **D** → Data input.
  - **E** → Enable input.
  - **Q** → Stored output.

For an active-high latch:

```text id="c4h8w2"
Enable = 1 → Latch is transparent
Enable = 0 → Latch holds previous value
```

---

* **How it works**

An active-high D latch operates according to the enable signal.

  - When **Enable = 1**, the latch is transparent.
  - During this condition, the output follows the input.
  - When **Enable = 0**, the latch is closed.
  - The output retains its previous value.
  - Therefore, the latch is **level-sensitive** rather than edge-triggered.

The basic operation is:

```text id="m6v3q9"
Enable = 1 → Q = D
Enable = 0 → Q = Previous Q
```

---

* **Code Example**

```verilog id="7n2k4p"
module d_latch (
    input  wire d,
    input  wire enable,
    output reg  q
);

always @(*)
begin
    if (enable)
        q = d;
end

endmodule
```

---

* **Code Explanation**

```verilog id="u9k5x1"
always @(*)
```

describes combinational sensitivity to the signals used inside the block.

```verilog id="r4m8t2"
if (enable)
    q = d;
```

allows the output to follow the input when `enable` is active.

When `enable = 0`, there is no assignment to `q`.

Therefore, `q` must retain its previous value, which represents the storage behavior of a latch.

---

* **Input & Output Description**

  - Inputs:-
    - `d` [1-bit Data Input]
    - `enable` [1-bit Enable Input]

  - Output:-
    - `q` [1-bit Stored Output]

  - **D** contains the data to be stored.
  - **Enable** controls whether the latch is transparent.
  - **Q** provides the stored data.

---

* **Working Example**

Consider:

```text id="s7k2p4"
D = 1
Enable = 1
```

Since the latch is enabled:

```text id="q5m8v3"
Q = 1
```

Now:

```text id="f4x9c2"
D = 0
Enable = 1
```

The latch is still transparent:

```text id="h6n1r8"
Q = 0
```

Now disable the latch:

```text id="k3w7t5"
Enable = 0
D = 1
```

Since the latch is disabled, the previous value is retained:

```text id="p8j4m6"
Q = 0
```

Therefore, changing `D` while `Enable = 0` does not change `Q`.

---

* **Simulation / Expected Output**

| Enable | D | Q |
|---:|---:|---:|
| 1 | 0 | 0 |
| 1 | 1 | 1 |
| 1 | 0 | 0 |
| 0 | 1 | Previous Q |
| 0 | 0 | Previous Q |

When **Enable = 1**, the output follows the input.

When **Enable = 0**, the output retains its previous value.

---

* **Synthesizability**

A properly coded latch can be synthesized into physical hardware.

The following style can infer a latch:

```verilog id="5q7m2x"
always @(*)
begin
    if (enable)
        q = d;
end
```

The missing assignment when `enable = 0` tells the synthesis tool that `q` must retain its previous value.

Therefore, a latch is inferred.

However, if a latch is not intentionally required, incomplete assignments should be avoided because they can create unintended hardware.

---

* **Common Mistakes**

  - Confusing a latch with a flip-flop.
  - Assuming a latch is edge-triggered.
  - Forgetting that a latch is level-sensitive.
  - Unintentionally inferring a latch through incomplete assignments.
  - Using latch behavior when combinational logic is intended.
  - Not understanding the effect of the enable signal.
  - Ignoring synthesis warnings about inferred latches.

---

* **Best Practices**

  - Understand whether the design requires a latch or flip-flop.
  - Use latches intentionally when level-sensitive storage is required.
  - Clearly define the enable condition.
  - Avoid incomplete assignments when latch behavior is not intended.
  - Check synthesis reports for inferred latches.
  - Use flip-flops when edge-triggered storage is required.
  - Verify latch behavior through simulation.

---

* **Applications**

  *Latches are used in:*

  - Temporary Data Storage.
  - Level-Sensitive Storage.
  - Control Circuits.
  - Timing Circuits.
  - Digital Systems.
  - Low-Level Storage Elements.
  - Certain High-Performance Digital Designs.
  - ASIC Design.

---

* **Advantages**

  - Simple storage element.
  - Can store one bit of information.
  - Level-sensitive operation.
  - Can allow data to pass during the active enable level.
  - Useful in specific timing and storage applications.

---

* **Limitations**

  - Level-sensitive behavior can complicate timing analysis.
  - Can introduce timing challenges if not carefully designed.
  - Unintended latches can cause design problems.
  - More difficult to manage than edge-triggered storage in some synchronous designs.
  - Can create unintended feedback behavior when incorrectly coded.

---

* **Real-World Example**

  - **Data Storage:** A latch can temporarily hold a data bit while an enable signal is inactive.
  - **Control Logic:** Latches can be used to store control information.
  - **ASIC Design:** Intentionally designed latches can be used in specific timing architectures.
  - **RTL Design:** Understanding latches is essential for identifying unintended latch inference caused by incomplete combinational assignments.

---

* **Key Points**

  - A latch is a **sequential storage element**.
  - A latch stores **one bit of information**.
  - A latch is **level-sensitive**.
  - A D latch commonly uses **Data (D)** and **Enable** inputs.
  - **Enable = 1 → Q follows D**.
  - **Enable = 0 → Q retains its previous value**.
  - Incomplete assignments in Verilog can infer a latch.
  - Latches are different from edge-triggered flip-flops.
  - Latches should be intentionally used when required.
  - Unintended latches should be avoided in designs where combinational logic is intended.

---

* **Interview Questions**

**1. What is a latch?**

**Answer:**

A latch is a level-sensitive sequential storage element that stores one bit of information.

---

**2. Is a latch level-sensitive or edge-sensitive?**

**Answer:**

A latch is **level-sensitive**.

---

**3. What is the difference between a latch and a flip-flop?**

**Answer:**

A latch is level-sensitive and can respond while its enable signal is active, whereas a flip-flop is edge-triggered and changes state at a specific clock edge.

---

**4. What happens when Enable = 1 in a D latch?**

**Answer:**

The latch is transparent, so the output follows the input:

**Q = D**

---

**5. What happens when Enable = 0?**

**Answer:**

The latch is closed and retains its previous output value.

---

**6. How can a latch be inferred in Verilog?**

**Answer:**

A latch can be inferred when a signal in a combinational procedural block is not assigned for every possible condition.

---

**7. Why does incomplete assignment infer a latch?**

**Answer:**

Because the hardware must retain the previous value when no new assignment is specified.

---

**8. Is a latch synthesizable?**

**Answer:**

Yes. An intentionally coded latch can be synthesized into physical hardware.

---

**9. Why are unintended latches undesirable?**

**Answer:**

Unintended latches can cause timing problems, complicate design behavior, and produce hardware that was not intended by the designer.

---

**10. What is a transparent latch?**

**Answer:**

A transparent latch is a latch whose output follows the input while its enable signal is active.

---

* **Quick Revision**

  - Latch → **Sequential Storage Element**
  - Storage → **1 Bit**
  - Operation → **Level-Sensitive**
  - Input → **D**
  - Control → **Enable**
  - Enable = 1 → **Q = D**
  - Enable = 0 → **Q = Previous Q**
  - Incomplete Assignment → **Latch Inference**
  - Latch → **Synthesizable**
  - Flip-Flop → **Edge-Triggered**
  - Important → **Avoid Unintended Latches**

---

* **Summary**

A **Latch** is a level-sensitive sequential storage element capable of storing one bit of information. In a D latch, the output follows the input while the enable signal is active and retains its previous value when the enable signal is inactive. In Verilog, incomplete assignments in combinational procedural blocks can infer latches. Understanding latch operation and inference is essential for writing correct and predictable RTL code.

---

* **References**

  - M. Morris Mano – *Digital Design*.
  - David Harris and Sarah Harris – *Digital Design and Computer Architecture*.
  - Samir Palnitkar – *Verilog HDL: A Guide to Digital Design and Synthesis*.
  - Neso Academy – Digital Electronics.
  - Neso Academy – Verilog HDL.
  - IEEE – *IEEE Standard for Verilog Hardware Description Language*.
