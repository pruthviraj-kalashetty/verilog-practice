# **Edge Triggering**

* **Overview**

**Edge Triggering** is a technique used in sequential logic circuits where the circuit changes its state only at a specific transition, or **edge**, of the clock signal. The two types of clock edges are the **Rising Edge** (`0 → 1`) and the **Falling Edge** (`1 → 0`). Edge triggering is widely used in flip-flops, registers, counters, and synchronous digital systems.

---

* **Definition**

**Edge Triggering** is a method of controlling sequential circuits in which data is captured or the circuit state is updated only when a specified transition of the clock signal occurs.

---

* **Why is it needed?**

  - To control exactly when sequential circuits update their state.
  - To synchronize data storage and transfer.
  - To prevent unwanted changes between clock edges.
  - To provide predictable timing behavior.
  - To enable reliable operation of flip-flops and registers.
  - To simplify synchronous digital circuit design.

---

* **Syntax**

Positive-edge triggering in Verilog:

```verilog
always @(posedge clk)
begin
    // Sequential logic
end
```

Negative-edge triggering in Verilog:

```verilog
always @(negedge clk)
begin
    // Sequential logic
end
```

---

* **Structure / General Form**

Edge triggering can be represented as:

```text
Rising Edge:

       ┌──────
       │
───────┘
       ↑
   0 → 1


Falling Edge:

───────┐
       │
       └──────
       ↓
   1 → 0
```

The two main types are:

  - **Positive-Edge Triggering** → Circuit responds to `0 → 1`.
  - **Negative-Edge Triggering** → Circuit responds to `1 → 0`.

---

* **How it works**

  - The clock continuously changes between logic `0` and logic `1`.
  - The sequential circuit monitors the clock signal.
  - The circuit responds only when the specified clock transition occurs.
  - For positive-edge triggering, the circuit responds at the rising edge.
  - For negative-edge triggering, the circuit responds at the falling edge.
  - Changes in the input between active clock edges do not immediately change the stored output.

For example, in positive-edge triggering:

```text
CLK:  0 ──── 1 ──── 0 ──── 1
             ↑             ↑
          Active         Active
           Edge           Edge
```

---

* **Code Example**

### Positive-Edge Triggering

```verilog
module positive_edge_trigger (
    input  wire clk,
    input  wire d,
    output reg  q
);

always @(posedge clk)
begin
    q <= d;
end

endmodule
```

### Negative-Edge Triggering

```verilog
module negative_edge_trigger (
    input  wire clk,
    input  wire d,
    output reg  q
);

always @(negedge clk)
begin
    q <= d;
end

endmodule
```

---

* **Code Explanation**

### Positive-Edge Triggering

  - `clk` is the clock input.
  - `d` is the data input.
  - `q` is the stored output.
  - `posedge clk` detects the rising edge of the clock.
  - When `clk` changes from `0 → 1`, the block executes.
  - `q <= d` stores the value of `d` in `q`.

### Negative-Edge Triggering

  - `negedge clk` detects the falling edge of the clock.
  - When `clk` changes from `1 → 0`, the block executes.
  - The value of `d` is transferred to `q` at the falling edge.

---

* **Input & Output Description**

  - Inputs:-
    - `clk` [Clock Input]
    - `d` [Data Input]

  - Output:-
    - `q` [Stored Data Output]

  - **clk** determines when the circuit updates.
  - **d** contains the data to be captured.
  - **q** stores the input data at the active clock edge.

---

* **Working Example**

### Positive-Edge Triggering

Consider:

```text
d = 1
```

Before the rising edge:

```text
clk = 0
q = 0
```

When:

```text
clk: 0 → 1
```

A rising edge occurs.

Therefore:

```text
q = d
q = 1
```

If `d` changes while there is no rising edge, `q` does not immediately change.

### Negative-Edge Triggering

Consider:

```text
d = 0
```

Before the falling edge:

```text
clk = 1
q = 1
```

When:

```text
clk: 1 → 0
```

A falling edge occurs.

Therefore:

```text
q = d
q = 0
```

---

* **Simulation / Expected Output**

### Positive-Edge Triggering

| Clock | Edge | D | Q |
|---|---|---:|---:|
| 0 | No Edge | 0 | Previous Q |
| 1 | Rising Edge | 1 | 1 |
| 0 | No Edge | 0 | 1 |
| 1 | Rising Edge | 0 | 0 |
| 0 | No Edge | 1 | 0 |
| 1 | Rising Edge | 1 | 1 |

The output changes only at the **rising edge**.

### Negative-Edge Triggering

| Clock | Edge | D | Q |
|---|---|---:|---:|
| 1 | No Edge | 0 | Previous Q |
| 0 | Falling Edge | 0 | 0 |
| 1 | No Edge | 1 | 0 |
| 0 | Falling Edge | 1 | 1 |

The output changes only at the **falling edge**.

---

* **Synthesizability**

Edge-triggered Verilog code is synthesizable.

Positive-edge-triggered sequential logic:

```verilog
always @(posedge clk)
begin
    q <= d;
end
```

is synthesized into a **positive-edge-triggered storage element**, typically a D flip-flop.

Negative-edge-triggered sequential logic:

```verilog
always @(negedge clk)
begin
    q <= d;
end
```

is synthesized into a **negative-edge-triggered D flip-flop**.

---

* **Common Mistakes**

  - Confusing rising edge with falling edge.
  - Using `posedge` when `negedge` is required.
  - Using blocking assignment `=` for normal clocked sequential logic.
  - Assuming the output changes immediately when the input changes.
  - Using both `posedge` and `negedge` unnecessarily in the same sequential logic.
  - Forgetting that edge triggering responds only to a transition, not to a constant HIGH or LOW level.

---

* **Best Practices**

  - Clearly identify whether the design requires rising-edge or falling-edge triggering.
  - Use `posedge` for positive-edge-triggered logic.
  - Use `negedge` for negative-edge-triggered logic.
  - Use non-blocking assignment `<=` for sequential logic.
  - Use a clean and stable clock signal.
  - Maintain a consistent clocking strategy throughout the design.
  - Avoid unnecessary mixing of different clock edges.

---

* **Applications**

  *Edge triggering is used in:*

  - D Flip-Flops.
  - JK Flip-Flops.
  - T Flip-Flops.
  - Registers.
  - Counters.
  - Shift Registers.
  - Finite State Machines (FSMs).
  - Processor Registers.
  - FPGA Design.
  - RTL Design.
  - VLSI Systems.

---

* **Advantages**

  - Provides precise control over state changes.
  - Reduces unwanted changes between clock edges.
  - Enables reliable synchronous operation.
  - Simplifies timing control.
  - Suitable for high-speed sequential circuits.

---

* **Limitations**

  - Requires a proper clock signal.
  - Clock timing must satisfy setup and hold requirements.
  - Clock skew can affect timing.
  - Clock jitter can affect reliable operation.
  - Incorrect edge selection can produce incorrect circuit behavior.

---

* **Real-World Example**

  - **CPU Registers:** Data is captured at a specific clock edge.
  - **Counters:** Counter values update on clock edges.
  - **Shift Registers:** Data shifts at the active clock edge.
  - **Memory Interfaces:** Data can be captured at a defined clock transition.
  - **FPGA Systems:** Sequential RTL logic commonly operates on clock edges.

---

* **Key Points**

  - Edge triggering updates a sequential circuit at a specific clock transition.
  - **Rising Edge → `0 → 1`**
  - **Falling Edge → `1 → 0`**
  - **Positive Edge → `posedge`**
  - **Negative Edge → `negedge`**
  - Positive-edge-triggered logic uses:

    ```verilog
    always @(posedge clk)
    ```

  - Negative-edge-triggered logic uses:

    ```verilog
    always @(negedge clk)
    ```

  - Sequential logic normally uses non-blocking assignment `<=`.
  - Edge-triggered storage elements are commonly implemented using flip-flops.

---

* **Interview Questions**

**1. What is edge triggering?**

**Answer:**

Edge triggering is a technique in which a sequential circuit updates its state only at a specific transition of the clock signal.

---

**2. What are the two types of clock edges?**

**Answer:**

The two types are:

- Rising Edge: `0 → 1`
- Falling Edge: `1 → 0`

---

**3. What is positive-edge triggering?**

**Answer:**

Positive-edge triggering means the circuit responds when the clock changes from **0 to 1**.

---

**4. What is negative-edge triggering?**

**Answer:**

Negative-edge triggering means the circuit responds when the clock changes from **1 to 0**.

---

**5. How is positive-edge triggering represented in Verilog?**

**Answer:**

```verilog
always @(posedge clk)
begin
    q <= d;
end
```

---

**6. How is negative-edge triggering represented in Verilog?**

**Answer:**

```verilog
always @(negedge clk)
begin
    q <= d;
end
```

---

**7. What is the difference between level triggering and edge triggering?**

**Answer:**

Level triggering responds while the clock is at a particular logic level, whereas edge triggering responds only during a transition of the clock signal.

---

**8. Why is edge triggering used in sequential circuits?**

**Answer:**

Edge triggering provides a precise instant at which data is captured or the circuit state is updated, allowing synchronized and predictable operation.

---

**9. Which assignment operator is normally used in edge-triggered sequential logic?**

**Answer:**

The non-blocking assignment operator `<=` is normally used.

---

**10. Which Verilog keyword detects a rising edge?**

**Answer:**

The keyword is:

```verilog
posedge
```

---

**11. Which Verilog keyword detects a falling edge?**

**Answer:**

The keyword is:

```verilog
negedge
```

---

**12. What type of hardware can be inferred from `always @(posedge clk)`?**

**Answer:**

It can infer a **positive-edge-triggered flip-flop**, depending on the complete RTL description.

---

* **Quick Revision**

  - Edge Triggering → State changes at a clock transition.
  - Rising Edge → **0 → 1**
  - Falling Edge → **1 → 0**
  - Positive Edge → **`posedge`**
  - Negative Edge → **`negedge`**
  - Positive-Edge Syntax → **`always @(posedge clk)`**
  - Negative-Edge Syntax → **`always @(negedge clk)`**
  - Sequential Assignment → **`<=`**
  - Positive Edge → Commonly used for synchronous sequential logic.
  - Negative Edge → Used when the design requires falling-edge operation.
  - Hardware → Flip-Flops and other edge-triggered sequential elements.

---

* **Summary**

**Edge Triggering** is a technique used in sequential logic circuits to update the circuit state only at a specific transition of the clock signal. The two main types are **positive-edge triggering** and **negative-edge triggering**. In Verilog, they are represented using `posedge` and `negedge`, respectively. Edge triggering is fundamental to the design of flip-flops, registers, counters, FSMs, FPGA systems, and RTL-based digital circuits.

---

* **References**

  - Samir Palnitkar – *Verilog HDL: A Guide to Digital Design and Synthesis*.
  - M. Morris Mano – *Digital Design*.
  - David Harris and Sarah Harris – *Digital Design and Computer Architecture*.
  - Neso Academy – Digital Electronics and Verilog HDL.
  - IEEE – *IEEE Standard for Verilog Hardware Description Language*.
