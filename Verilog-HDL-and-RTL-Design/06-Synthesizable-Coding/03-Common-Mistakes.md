# **Common Mistakes in Verilog Coding**

* **Overview**

**Common Verilog Coding Mistakes** are errors or poor coding practices that can cause simulation mismatches, synthesis problems, unintended hardware, or incorrect circuit behavior. Understanding these mistakes helps designers write reliable, synthesizable, and maintainable RTL code.

---

* **Definition**

**Common Verilog Coding Mistakes** are incorrect or inappropriate coding practices in Verilog that may result in functional errors, unintended hardware, simulation issues, or synthesis problems.

---

* **Why is it needed?**

  - To prevent common RTL design errors.
  - To avoid unintended hardware.
  - To reduce simulation and synthesis mismatches.
  - To improve code reliability.
  - To simplify debugging.
  - To produce predictable hardware.
  - To improve RTL design quality.

---

* **Syntax**

There is no single syntax for common mistakes because they can occur in different Verilog constructs.

Incorrect sequential coding:

```verilog
always @(posedge clk)
begin
    q = d;
end
```

Recommended:

```verilog
always @(posedge clk)
begin
    q <= d;
end
```

Incorrect incomplete combinational logic:

```verilog
always @(*)
begin
    if (sel)
        y = a;
end
```

Recommended:

```verilog
always @(*)
begin
    if (sel)
        y = a;
    else
        y = b;
end
```

---

* **Structure / General Form**

Common mistakes can occur in different parts of RTL:

```text id="6n8u1f"
                 Verilog RTL
                     │
        ┌────────────┼────────────┐
        │            │            │
        ▼            ▼            ▼
   Combinational  Sequential   Structural
      Logic         Logic        Logic
        │            │            │
        ▼            ▼            ▼
   Latch Errors   Timing Errors  Connection
                                Errors
```

Common categories include:

  - Assignment mistakes.
  - Sensitivity list mistakes.
  - Incomplete combinational logic.
  - Reset mistakes.
  - Clocking mistakes.
  - Width mismatches.
  - Port connection mistakes.
  - Multiple-driver problems.
  - Non-synthesizable constructs.
  - Incorrect use of blocking and non-blocking assignments.

---

* **How it works**

Common coding mistakes can affect the design in different ways:

  - Incorrect combinational coding can infer unintended latches.
  - Incorrect sequential assignments can cause simulation-order problems.
  - Missing sensitivity signals can create simulation mismatches.
  - Incorrect reset coding can cause unexpected initial behavior.
  - Multiple drivers can cause conflicting signal values.
  - Width mismatches can cause truncation or unexpected extension.
  - Incorrect port connections can produce incorrect hardware.
  - Non-synthesizable constructs can prevent successful synthesis.
  - Incorrect clock usage can create timing and hardware reliability problems.

---

* **Code Example**

### Mistake 1: Blocking Assignment in Sequential Logic

```verilog
always @(posedge clk)
begin
    q = d;
end
```

Recommended:

```verilog
always @(posedge clk)
begin
    q <= d;
end
```

### Mistake 2: Incomplete Combinational Assignment

Incorrect:

```verilog
always @(*)
begin
    if (sel)
        y = a;
end
```

Recommended:

```verilog
always @(*)
begin
    if (sel)
        y = a;
    else
        y = b;
end
```

### Mistake 3: Width Mismatch

```verilog
reg [7:0] data;
reg [3:0] value;

assign data = value;
```

The 4-bit value is assigned to an 8-bit signal, so the remaining bits are extended according to Verilog sizing rules.

### Mistake 4: Simulation Delay in RTL

```verilog
always @(posedge clk)
begin
    #5 q <= d;
end
```

The `#5` delay is generally not appropriate for synthesizable RTL.

---

* **Code Explanation**

### Blocking vs Non-Blocking

```verilog
q = d;
```

uses blocking assignment and is generally not recommended for clocked sequential logic.

```verilog
q <= d;
```

uses non-blocking assignment and is the recommended style for flip-flops and registers.

### Incomplete Combinational Logic

If `y` is assigned only when `sel = 1`, the circuit needs to remember its previous value when `sel = 0`. This can cause an unintended latch.

Providing an `else` assignment ensures that `y` has a value for every condition.

### Width Mismatch

When signal widths differ, Verilog performs sizing and may extend or truncate values. This can produce unexpected results if the designer does not consider the signal widths carefully.

### Simulation Delay

The `#5` delay controls simulation timing and generally does not represent synthesizable RTL hardware delay.

---

* **Input & Output Description**

  - Inputs:-
    - `clk` [Clock Input]
    - `reset` [Reset Input]
    - `d` [Data Input]
    - `sel` [Select Input]
    - `a`, `b` [Data Inputs]

  - Outputs:-
    - `q` [Registered Output]
    - `y` [Combinational Output]

The exact inputs and outputs depend on the specific RTL module being designed.

---

* **Working Example**

Consider a 2 × 1 multiplexer.

Incorrect code:

```verilog
always @(*)
begin
    if (sel)
        y = a;
end
```

When:

```text id="7ps2ub"
sel = 1
```

the output becomes:

```text id="3t5f9r"
y = a
```

But when:

```text id="gk4u6r"
sel = 0
```

there is no assignment to `y`.

Therefore, the previous value of `y` may be retained, causing an unintended latch.

Correct code:

```verilog
always @(*)
begin
    if (sel)
        y = a;
    else
        y = b;
end
```

Now:

```text id="2x1t9a"
sel = 1 → y = a
sel = 0 → y = b
```

The intended combinational behavior is correctly described.

---

* **Simulation / Expected Output**

For the corrected 2 × 1 multiplexer:

| Select | A | B | Output Y |
|---|---:|---:|---:|
| 0 | 0 | 0 | 0 |
| 0 | 0 | 1 | 1 |
| 0 | 1 | 0 | 0 |
| 0 | 1 | 1 | 1 |
| 1 | 0 | 0 | 0 |
| 1 | 0 | 1 | 0 |
| 1 | 1 | 0 | 1 |
| 1 | 1 | 1 | 1 |

The output always follows the selected input without unintended storage behavior.

---

* **Synthesizability**

Many common mistakes directly affect synthesis.

Common synthesis-related problems include:

  - Incomplete combinational assignments causing unintended latches.
  - Multiple drivers causing synthesis errors or unexpected hardware.
  - Unsupported simulation constructs preventing synthesis.
  - Incorrect clocking creating unintended sequential logic.
  - Width mismatches causing unexpected hardware.
  - Incorrect reset coding producing unintended reset behavior.
  - Improper use of procedural assignments.

A successful compilation does not necessarily mean the RTL describes the intended hardware. Simulation and synthesis reports must both be checked.

---

* **Common Mistakes**

  - Using blocking assignment `=` in sequential logic.
  - Using non-blocking assignment `<=` unnecessarily in combinational logic.
  - Creating incomplete `if-else` statements.
  - Forgetting default assignments in combinational logic.
  - Missing signals in sensitivity lists.
  - Using incorrect reset polarity.
  - Confusing synchronous and asynchronous resets.
  - Using incorrect clock edges.
  - Creating multiple drivers for the same signal.
  - Connecting ports incorrectly.
  - Ignoring signal width mismatches.
  - Using undeclared or incorrectly declared signals.
  - Using simulation delays in synthesizable RTL.
  - Using non-synthesizable system tasks in implementation RTL.
  - Creating unnecessarily complex logic.
  - Ignoring synthesis warnings.
  - Using unclear signal and module names.

---

* **Best Practices**

  - Use `<=` for sequential logic.
  - Use `=` for combinational procedural logic.
  - Use `always @(posedge clk)` for positive-edge sequential logic.
  - Use `always @(*)` for combinational logic.
  - Provide complete assignments in combinational blocks.
  - Define reset behavior clearly.
  - Use consistent clocking.
  - Check signal widths before connecting or assigning signals.
  - Avoid multiple drivers.
  - Use meaningful names.
  - Keep modules small and modular.
  - Avoid simulation-only constructs in synthesizable RTL.
  - Run simulation before synthesis.
  - Review synthesis warnings and inferred hardware.

---

* **Applications**

  *Understanding common Verilog mistakes is important in:*

  - RTL Design.
  - FPGA Design.
  - ASIC Design.
  - VLSI Design.
  - Digital Logic Design.
  - Processor Design.
  - FSM Design.
  - Memory Design.
  - IP Core Development.
  - Verification.

---

* **Advantages**

  - Reduces RTL design errors.
  - Prevents unintended hardware.
  - Improves simulation accuracy.
  - Improves synthesis results.
  - Makes debugging easier.
  - Improves code maintainability.
  - Helps create predictable hardware.

---

* **Limitations**

  - Knowing common mistakes does not guarantee a bug-free design.
  - Some problems depend on the synthesis tool.
  - Complex designs can still contain subtle timing issues.
  - Simulation may not detect every hardware implementation problem.
  - Proper verification is still required.

---

* **Real-World Example**

  - **FIFO Design:** Incorrect pointer widths can cause incorrect memory addressing.
  - **FSM Design:** Missing state assignments can create unintended behavior.
  - **Counter Design:** Incorrect reset or clock coding can cause unexpected counting.
  - **Memory Design:** Incorrect address width can access unintended locations.
  - **Processor RTL:** Width mismatches and incorrect control logic can produce incorrect data paths.
  - **ASIC Design:** Multiple drivers and unintended latches can cause synthesis and timing problems.

---

* **Key Points**

  - Use **non-blocking `<=`** for sequential logic.
  - Use **blocking `=`** for combinational procedural logic.
  - Always provide complete combinational assignments.
  - Avoid unintended latches.
  - Use the correct clock edge.
  - Define reset behavior clearly.
  - Avoid multiple drivers.
  - Check signal widths.
  - Avoid simulation-only constructs in synthesizable RTL.
  - Use meaningful names.
  - Check both simulation and synthesis results.
  - Never ignore synthesis warnings.

---

* **Interview Questions**

**1. What is the most common mistake in sequential Verilog coding?**

**Answer:**

Using blocking assignment `=` instead of non-blocking assignment `<=` for clocked sequential logic.

---

**2. What causes an unintended latch?**

**Answer:**

An unintended latch can occur when a combinational block does not assign an output for every possible input condition.

---

**3. How can unintended latches be avoided?**

**Answer:**

By providing complete assignments using `if-else`, `case` with appropriate defaults, or default assignments at the beginning of the combinational block.

---

**4. Why is non-blocking assignment used for sequential logic?**

**Answer:**

Non-blocking assignment models simultaneous register updates at clock events and helps avoid simulation-order problems.

---

**5. What is a multiple-driver problem?**

**Answer:**

A multiple-driver problem occurs when more than one source attempts to drive the same signal, potentially causing conflicting or unexpected values.

---

**6. What is a width mismatch?**

**Answer:**

A width mismatch occurs when signals with different numbers of bits are assigned or connected together.

---

**7. Why should signal widths be checked?**

**Answer:**

Incorrect widths can cause truncation, extension, or unexpected hardware behavior.

---

**8. Why should simulation delays be avoided in synthesizable RTL?**

**Answer:**

Simulation delays such as `#10` generally do not represent standard synthesizable hardware timing.

---

**9. What is the difference between a simulation error and a synthesis error?**

**Answer:**

A simulation error affects the modeled behavior during simulation, while a synthesis error prevents or changes the conversion of RTL into hardware.

---

**10. Why should synthesis warnings not be ignored?**

**Answer:**

Warnings can indicate unintended latches, width mismatches, unconnected signals, inferred hardware, or other potential design problems.

---

**11. What can happen if a sensitivity list is incomplete?**

**Answer:**

The simulator may not update the output when all relevant inputs change, causing simulation behavior that does not match the intended combinational logic.

---

**12. Why is consistent reset coding important?**

**Answer:**

Consistent reset coding ensures that registers enter the intended state and helps prevent unexpected hardware behavior.

---

* **Quick Revision**

  - Sequential Logic → **Use `<=`**
  - Combinational Logic → **Use `=`**
  - Incomplete Assignment → **May infer latch**
  - Multiple Drivers → **Conflicting signal sources**
  - Width Mismatch → **Possible truncation/extension**
  - Wrong Clock Edge → **Incorrect sequential behavior**
  - Wrong Reset → **Unexpected initialization**
  - `#` Delay → **Generally non-synthesizable**
  - Missing Sensitivity → **Simulation mismatch**
  - Best Practice → **Complete combinational assignments**
  - Best Practice → **Check synthesis warnings**
  - Goal → **Predictable and synthesizable RTL**

---

* **Summary**

Avoiding common Verilog coding mistakes is essential for developing reliable RTL. Problems such as incorrect assignment operators, incomplete combinational logic, unintended latches, multiple drivers, width mismatches, incorrect reset behavior, and simulation-only constructs can lead to incorrect or unintended hardware. Following proper coding practices and checking both simulation and synthesis results helps produce robust **FPGA, ASIC, and VLSI designs**.

---

* **References**

  - Samir Palnitkar – *Verilog HDL: A Guide to Digital Design and Synthesis*.
  - M. Morris Mano – *Digital Design*.
  - David Harris and Sarah Harris – *Digital Design and Computer Architecture*.
  - Neso Academy – Verilog HDL.
  - IEEE – *IEEE Standard for Verilog Hardware Description Language*.
