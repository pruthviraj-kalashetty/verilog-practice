# **Latch Inference**

* **Overview**

**Latch Inference** is the process by which a synthesis tool identifies incomplete assignments in combinational RTL and creates a latch to preserve the previous value of a signal. Latch inference can be intentional when level-sensitive storage is required, but unintended latch inference is a common RTL coding problem.

---

* **Definition**

**Latch Inference** occurs when Verilog RTL does not assign a value to a signal under all possible conditions in a combinational logic block, causing the synthesis tool to infer storage hardware that retains the signal's previous value.

---

* **Why is it needed?**

  - To understand how RTL code maps to hardware.
  - To identify unintended storage elements.
  - To prevent accidental latch generation.
  - To write proper combinational logic.
  - To avoid simulation and synthesis problems.
  - To improve timing predictability.
  - To maintain clean synchronous RTL designs.

---

* **Syntax**

An unintended latch can be inferred from incomplete assignment:

```verilog id="8k5f2m"
always @(*)
begin
    if (enable)
        q = d;
end
```

When `enable = 1`, `q` receives `d`.

When `enable = 0`, `q` is not assigned and therefore must retain its previous value.

A latch-free version is:

```verilog id="3p7n9x"
always @(*)
begin
    if (enable)
        q = d;
    else
        q = 1'b0;
end
```

---

* **Structure / General Form**

Latch inference can be represented as:

```text id="6v2m8q"
             RTL Code
                 │
                 ▼
       Incomplete Assignment
                 │
                 ▼
          Previous Value
                 │
                 ▼
          Latch Inference
                 │
                 ▼
       Storage Hardware
```

For combinational logic:

```text id="4j8w1p"
All Conditions Assigned
        │
        ▼
Combinational Logic
```

For incomplete assignment:

```text id="9q3k6r"
Some Conditions Not Assigned
        │
        ▼
      Latch
```

---

* **How it works**

Consider:

```verilog id="u5c8r2"
always @(*)
begin
    if (enable)
        q = d;
end
```

  - When `enable = 1`, `q` is assigned `d`.
  - When `enable = 0`, there is no assignment to `q`.
  - The hardware must therefore preserve the previous value of `q`.
  - Storage behavior is required.
  - The synthesis tool infers a latch.

The inferred behavior is:

```text id="m7f4k1"
enable = 1 → q = d
enable = 0 → q = previous q
```

This is different from pure combinational logic, where the output should always be determined by the current inputs.

---

* **Code Example**

### Latch Inference

```verilog id="a3s7d9"
module latch_inference (
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

### Latch-Free Code

```verilog id="k8n2v5"
module latch_free (
    input  wire d,
    input  wire enable,
    output reg  q
);

always @(*)
begin
    if (enable)
        q = d;
    else
        q = 1'b0;
end

endmodule
```

---

* **Code Explanation**

In the first example:

```verilog id="5g1x4m"
if (enable)
    q = d;
```

assigns `q` only when `enable` is true.

When:

```text id="p6w2r8"
enable = 0
```

there is no assignment to `q`.

Therefore, `q` retains its previous value, which requires storage hardware.

The synthesis tool consequently infers a latch.

In the second example:

```verilog id="c4h9t7"
if (enable)
    q = d;
else
    q = 1'b0;
```

`q` receives a value for both possible values of `enable`.

Therefore, no storage is required and the logic can be implemented as combinational logic.

---

* **Input & Output Description**

  - Inputs:-
    - `d` [1-bit Data Input]
    - `enable` [1-bit Enable Input]

  - Output:-
    - `q` [1-bit Output]

  - **d** provides the data.
  - **enable** controls whether the data is transferred.
  - **q** provides the output.

For the latch-inference example:

```text id="r5k7n1"
enable = 1 → q = d
enable = 0 → q = previous q
```

---

* **Working Example**

Consider:

```text id="x2m8v4"
d = 1
enable = 1
```

The code executes:

```text id="j7q3p9"
q = 1
```

Now change:

```text id="n4w6k2"
d = 0
enable = 0
```

The `if` condition is false, so there is no assignment to `q`.

Therefore:

```text id="z8c1m5"
q = previous q = 1
```

The output remains `1` even though `d` has changed.

This retention of the previous value demonstrates latch behavior.

---

* **Simulation / Expected Output**

### Latch-Inferred Code

| Enable | D | Q |
|---:|---:|---:|
| 1 | 0 | 0 |
| 1 | 1 | 1 |
| 0 | 0 | Previous Q |
| 0 | 1 | Previous Q |
| 1 | 0 | 0 |

When **Enable = 0**, the output retains its previous value.

### Latch-Free Code

| Enable | D | Q |
|---:|---:|---:|
| 1 | 0 | 0 |
| 1 | 1 | 1 |
| 0 | 0 | 0 |
| 0 | 1 | 0 |
| 1 | 0 | 0 |

In the latch-free version, the output is assigned for every possible input condition.

---

* **Synthesizability**

Latch inference is synthesizable.

When the synthesis tool detects incomplete assignments, it can infer a physical latch.

For example:

```verilog id="n3f6v8"
always @(*)
begin
    if (enable)
        q = d;
end
```

can synthesize to a level-sensitive latch.

However, if the intended circuit is combinational logic, this is usually an unwanted result.

Synthesis reports should therefore be checked for messages indicating inferred latches.

---

* **Common Mistakes**

  - Forgetting the `else` branch.
  - Forgetting default assignments.
  - Assuming an `always @(*)` block is automatically combinational.
  - Not assigning every output under every condition.
  - Ignoring synthesis warnings.
  - Confusing latch inference with flip-flop inference.
  - Using incomplete `case` statements.
  - Accidentally retaining previous values in combinational logic.
  - Failing to initialize outputs before conditional statements.

---

* **Best Practices**

  - Assign every combinational output for every possible condition.
  - Use default assignments at the beginning of combinational blocks.
  - Use complete `if-else` statements when required.
  - Use appropriate `case` defaults.
  - Review synthesis reports for inferred latches.
  - Clearly distinguish intentional latches from accidental latches.
  - Simulate all input combinations.
  - Keep combinational and sequential logic clearly separated.

Example using a default assignment:

```verilog id="f9m3k7"
always @(*)
begin
    q = 1'b0;

    if (enable)
        q = d;
end
```

The default assignment ensures that `q` always has a value.

---

* **Applications**

  *Understanding latch inference is important in:*

  - RTL Design.
  - FPGA Design.
  - ASIC Design.
  - VLSI Design.
  - Combinational Logic Design.
  - FSM Design.
  - Control Logic.
  - Processor Design.
  - Synthesis.
  - RTL Verification.

---

* **Advantages**

  - Helps designers understand RTL-to-hardware mapping.
  - Allows intentional latch-based designs.
  - Provides level-sensitive storage when required.
  - Helps identify incomplete combinational logic.
  - Makes synthesis behavior easier to understand.

---

* **Limitations**

  - Unintended latches can cause timing problems.
  - Latches can complicate static timing analysis.
  - Accidental latch inference can increase design complexity.
  - Latch-based designs require careful timing analysis.
  - Unintended storage can cause simulation and hardware behavior different from the intended combinational design.

---

* **Real-World Example**

  - **FSM Design:** Incomplete next-state or output assignments can unintentionally infer latches.
  - **Control Logic:** Missing assignments can cause control signals to retain previous values.
  - **Data Path:** Incomplete assignments can create unwanted storage elements.
  - **ASIC Design:** Inferred latches may affect timing closure and physical implementation.
  - **FPGA Design:** Unintended latches can consume resources and complicate timing.

---

* **Key Points**

  - Latch inference occurs when a signal does not receive an assignment under all conditions.
  - Incomplete combinational assignments can infer latches.
  - `always @(*)` does not automatically prevent latch inference.
  - A latch retains its previous value when it is not enabled.
  - Complete assignments prevent unintended latch inference.
  - Default assignments are an effective way to avoid latches.
  - Inferred latches are synthesizable.
  - Synthesis reports should be checked for unintended latches.
  - Intentional latches should be clearly designed and verified.

---

* **Interview Questions**

**1. What is latch inference?**

**Answer:**

Latch inference is the process where a synthesis tool creates a latch because an RTL signal is not assigned under all possible conditions.

---

**2. What causes latch inference in Verilog?**

**Answer:**

Incomplete assignments in combinational procedural blocks commonly cause latch inference.

---

**3. Does `always @(*)` guarantee combinational logic?**

**Answer:**

No. `always @(*)` automatically handles the sensitivity list, but incomplete assignments can still cause a latch to be inferred.

---

**4. How can unintended latch inference be avoided?**

**Answer:**

By ensuring that every output is assigned for every possible input condition using complete `if-else`, appropriate `case` statements, or default assignments.

---

**5. What happens when the enable condition of a latch is false?**

**Answer:**

The latch retains its previous output value.

---

**6. Is latch inference synthesizable?**

**Answer:**

Yes. A synthesis tool can convert inferred latch behavior into physical latch hardware.

---

**7. Why is unintended latch inference a problem?**

**Answer:**

It can introduce unexpected storage, complicate timing analysis, increase design complexity, and cause the hardware to behave differently from the intended combinational design.

---

**8. How can a default assignment prevent latch inference?**

**Answer:**

A default assignment gives the output a value before conditional logic executes, ensuring that the output is assigned for every possible condition.

---

**9. Can an incomplete `case` statement infer a latch?**

**Answer:**

Yes. If an output is not assigned for some possible case conditions, the synthesis tool may infer a latch.

---

**10. How can latch inference be identified?**

**Answer:**

It can be identified through synthesis reports, RTL analysis tools, warnings, and simulation behavior where an output unexpectedly retains its previous value.

---

* **Quick Revision**

  - Latch Inference → **Storage inferred from incomplete assignment**
  - Main Cause → **Incomplete combinational logic**
  - `always @(*)` → **Does not prevent latch inference**
  - Missing Assignment → **Previous value retained**
  - Result → **Latch Hardware**
  - Avoid → **Unintended Latches**
  - Use → **Complete `if-else`**
  - Use → **Default Assignments**
  - Check → **Synthesis Reports**
  - Important → **Every combinational output must be assigned**
  - Intentional Latch → **Can be synthesizable**

---

* **Summary**

**Latch inference** occurs when Verilog RTL describes storage behavior by failing to assign a signal under every possible condition. Incomplete `if` or `case` statements in combinational logic can cause the synthesis tool to infer a latch. While latches can be intentionally used in digital designs, unintended latch inference should generally be avoided by using complete assignments, default values, and proper RTL coding practices.

---

* **References**

  - Samir Palnitkar – *Verilog HDL: A Guide to Digital Design and Synthesis*.
  - M. Morris Mano – *Digital Design*.
  - David Harris and Sarah Harris – *Digital Design and Computer Architecture*.
  - Neso Academy – Digital Electronics.
  - Neso Academy – Verilog HDL.
  - IEEE – *IEEE Standard for Verilog Hardware Description Language*.
