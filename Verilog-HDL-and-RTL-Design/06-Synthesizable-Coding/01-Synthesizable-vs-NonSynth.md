# **Synthesizable vs Non-Synthesizable Verilog**

* **Overview**

**Synthesizable** and **Non-Synthesizable** Verilog code describe different types of hardware descriptions. Synthesizable code can be converted by a synthesis tool into actual hardware such as gates, flip-flops, multiplexers, and registers. Non-synthesizable code is mainly used for simulation, verification, and testbench development and cannot be directly converted into hardware.

---

* **Definition**

**Synthesizable Verilog** is Verilog code that can be converted into physical hardware by a synthesis tool.

**Non-Synthesizable Verilog** is Verilog code that cannot be directly converted into hardware and is primarily used for simulation and verification.

---

* **Why is it needed?**

  - To distinguish hardware-generating code from simulation-only code.
  - To write RTL that can be implemented on FPGA or ASIC hardware.
  - To avoid synthesis errors.
  - To create reliable and portable RTL designs.
  - To understand which Verilog constructs are suitable for hardware.
  - To separate design code from testbench code.
  - To improve the quality of RTL development.

---

* **Syntax**

### Synthesizable Example

```verilog
always @(posedge clk)
begin
    if (reset)
        q <= 1'b0;
    else
        q <= d;
end
```

### Non-Synthesizable Example

```verilog
initial
begin
    #10 reset = 1'b1;
    #10 reset = 1'b0;
end
```

The `#` delay is used for simulation timing and is generally not synthesizable for standard RTL hardware.

---

* **Structure / General Form**

### Synthesizable RTL

```text id="3f2zpj"
       Inputs
          │
          ▼
   ┌───────────────┐
   │ Synthesizable │
   │     RTL       │
   └───────┬───────┘
           │
           ▼
      Synthesis Tool
           │
           ▼
     Hardware Logic
```

### Non-Synthesizable Code

```text id="r2rj5g"
       Testbench
           │
           ▼
   ┌─────────────────┐
   │ Non-Synthesizable│
   │      Code        │
   └────────┬────────┘
            │
            ▼
         Simulator
            │
            ▼
      Simulation Result
```

---

* **How it works**

### Synthesizable Code

  - The RTL describes hardware behavior or structure.
  - The synthesis tool analyzes the RTL.
  - The tool converts the RTL into a hardware representation.
  - Logic gates, flip-flops, multiplexers, registers, and other hardware structures are inferred.
  - The resulting design can be implemented in an FPGA or ASIC.

### Non-Synthesizable Code

  - The code is interpreted by a simulator.
  - It is used to generate stimulus, model delays, monitor signals, or verify the design.
  - It does not directly represent hardware that synthesis can implement.
  - It is commonly used inside testbenches.

---

* **Code Example**

### Synthesizable Code

```verilog
module counter (
    input  wire       clk,
    input  wire       reset,
    output reg [3:0]  count
);

always @(posedge clk)
begin
    if (reset)
        count <= 4'b0000;
    else
        count <= count + 1'b1;
end

endmodule
```

### Non-Synthesizable Code

```verilog
module counter_tb;

reg clk;
reg reset;

initial
begin
    clk = 1'b0;
    reset = 1'b1;

    #10 reset = 1'b0;
    #100 $finish;
end

always
    #5 clk = ~clk;

endmodule
```

---

* **Code Explanation**

### Synthesizable Code

```verilog
always @(posedge clk)
```

describes clocked sequential logic.

```verilog
if (reset)
    count <= 4'b0000;
```

resets the counter.

```verilog
count <= count + 1'b1;
```

increments the counter at every rising clock edge.

This code can be synthesized into sequential hardware such as flip-flops and combinational logic.

### Non-Synthesizable Code

```verilog
initial
```

is commonly used in a testbench to initialize simulation signals.

```verilog
#10 reset = 1'b0;
```

introduces a simulation delay.

```verilog
$finish;
```

terminates the simulation.

These constructs are intended for simulation and verification rather than direct hardware implementation.

---

* **Input & Output Description**

### Synthesizable Counter

  - Inputs:-
    - `clk` [Clock Input]
    - `reset` [Reset Input]

  - Output:-
    - `count` [4-bit Counter Output]

### Non-Synthesizable Testbench

  - Inputs:-
    - Testbench stimulus signals.

  - Outputs:-
    - Simulation signals and verification results.

The testbench provides stimulus to the synthesizable design and observes its behavior during simulation.

---

* **Working Example**

Consider the synthesizable counter:

```verilog
if (reset)
    count <= 4'b0000;
else
    count <= count + 1'b1;
```

If:

```text id="v3q3q6"
reset = 1
```

At the rising clock edge:

```text id="i8z7ly"
count = 0000
```

After reset is released:

```text id="v9p5f7"
reset = 0
```

The counter increments:

```text id="w4s4wt"
0000 → 0001 → 0010 → 0011 → 0100 → ...
```

The testbench can use delays to apply reset and generate a clock:

```verilog id="0y3slg"
#10 reset = 1'b0;
#100 $finish;
```

These delays control the simulation and are not hardware timing elements.

---

* **Simulation / Expected Output**

| Clock Edge | Reset | Counter |
|---|---:|---:|
| 1 | 1 | 0000 |
| 2 | 0 | 0001 |
| 3 | 0 | 0010 |
| 4 | 0 | 0011 |
| 5 | 0 | 0100 |

The synthesizable counter produces the hardware behavior, while the non-synthesizable testbench controls and observes the simulation.

---

* **Synthesizability**

Common synthesizable constructs include:

  - `always @(posedge clk)`
  - `always @(*)`
  - `if-else`
  - `case`
  - `assign`
  - Arithmetic and logical operators.
  - Module instantiation.
  - Registers and combinational logic.

Common non-synthesizable constructs include:

  - Simulation delays using `#`.
  - `$display`
  - `$monitor`
  - `$finish`
  - `$stop`
  - Testbench stimulus using `initial`.
  - Certain file I/O operations.
  - Constructs intended only for simulation timing.

Some Verilog constructs can be tool-dependent, so synthesizability should always be checked against the target synthesis tool and coding guidelines.

---

* **Common Mistakes**

  - Using `#` delays in synthesizable RTL.
  - Using `$display` as if it creates hardware.
  - Using `$finish` inside hardware RTL.
  - Confusing simulation behavior with hardware behavior.
  - Writing incomplete combinational logic.
  - Using unsupported Verilog constructs for synthesis.
  - Assuming every Verilog statement is synthesizable.
  - Mixing testbench code with synthesizable design code.
  - Ignoring synthesis warnings.

---

* **Best Practices**

  - Use only synthesis-supported constructs in RTL intended for implementation.
  - Keep testbench and design code separate.
  - Avoid simulation delays in synthesizable RTL.
  - Use non-blocking assignments for sequential logic.
  - Use complete assignments in combinational logic.
  - Follow the synthesis tool's supported coding guidelines.
  - Check synthesis reports regularly.
  - Verify RTL through simulation before synthesis.
  - Avoid relying on simulator-only behavior in hardware RTL.

---

* **Applications**

  *Synthesizable and non-synthesizable code are used in:*

  - RTL Design.
  - FPGA Design.
  - ASIC Design.
  - Digital System Design.
  - Testbench Development.
  - Functional Verification.
  - Simulation.
  - Processor Design.
  - VLSI Design.
  - IP Development.

---

* **Advantages**

### Synthesizable Code

  - Can be converted into real hardware.
  - Suitable for FPGA and ASIC implementation.
  - Represents actual digital hardware.
  - Supports RTL-based design flows.
  - Can be optimized by synthesis tools.

### Non-Synthesizable Code

  - Useful for verification.
  - Makes simulation easier.
  - Allows simulation delays.
  - Can generate test stimulus.
  - Helps monitor and debug design behavior.

---

* **Limitations**

### Synthesizable Code

  - Must follow synthesis-supported constructs.
  - Hardware behavior must be considered.
  - Incorrect RTL can produce unintended hardware.
  - Some simulator features cannot be used.

### Non-Synthesizable Code

  - Cannot normally be converted directly into hardware.
  - Primarily useful for simulation and verification.
  - Cannot be used as the implementation of an ASIC or FPGA design.
  - Simulation-only constructs may not represent real hardware behavior.

---

* **Real-World Example**

  - **ASIC RTL:** Counter, ALU, FSM, and register logic are written using synthesizable Verilog.
  - **FPGA Design:** Synthesizable RTL is converted into FPGA resources such as LUTs and flip-flops.
  - **Testbench:** `initial`, `#` delays, `$display`, and `$finish` can be used to verify the RTL.
  - **Verification:** Non-synthesizable code can generate different input conditions and monitor outputs.
  - **VLSI Flow:** Synthesizable RTL moves toward synthesis and physical implementation, while testbench code remains part of the verification environment.

---

* **Key Points**

  - **Synthesizable Code → Can be converted into hardware.**
  - **Non-Synthesizable Code → Mainly used for simulation and verification.**
  - Synthesizable RTL is used for **FPGA and ASIC implementation**.
  - Non-synthesizable constructs are commonly used in **testbenches**.
  - `#` delays are generally non-synthesizable.
  - `$display`, `$monitor`, and `$finish` are simulation-oriented constructs.
  - `always`, `if-else`, `case`, `assign`, and module instantiation can be synthesizable when used appropriately.
  - Synthesizability can depend on the specific synthesis tool and coding style.
  - RTL should always be checked through synthesis reports.

---

* **Interview Questions**

**1. What is synthesizable Verilog?**

**Answer:**

Synthesizable Verilog is Verilog code that a synthesis tool can convert into hardware such as gates, flip-flops, registers, and multiplexers.

---

**2. What is non-synthesizable Verilog?**

**Answer:**

Non-synthesizable Verilog is code that cannot be directly converted into hardware and is mainly used for simulation and verification.

---

**3. Give an example of a non-synthesizable construct.**

**Answer:**

A simulation delay such as:

```verilog id="u0d3bk"
#10;
```

is generally non-synthesizable.

---

**4. Is `always` synthesizable?**

**Answer:**

Yes, appropriate `always` blocks can be synthesizable. The exact synthesizable behavior depends on how the block is written.

---

**5. Is `$display` synthesizable?**

**Answer:**

No. `$display` is a simulation-oriented system task used to print information during simulation.

---

**6. Why are `#` delays generally not synthesizable?**

**Answer:**

Because standard synthesis tools do not implement Verilog simulation delays as physical hardware delay elements in ordinary RTL synthesis.

---

**7. What is the purpose of non-synthesizable code?**

**Answer:**

It is mainly used to generate stimulus, model simulation behavior, monitor signals, and verify the functionality of synthesizable RTL.

---

**8. Can an `initial` block be synthesizable?**

**Answer:**

It depends on the target technology and synthesis tool. Some FPGA flows support limited `initial` constructs for memory or register initialization, but `initial` blocks used for testbench stimulus are generally non-synthesizable.

---

**9. What is the difference between simulation and synthesis?**

**Answer:**

Simulation evaluates the behavior of Verilog code using a simulator, while synthesis converts supported RTL descriptions into an implementable hardware structure.

---

**10. Can non-synthesizable code be used in a testbench?**

**Answer:**

Yes. Non-synthesizable constructs are commonly used in testbenches for stimulus generation, monitoring, delays, and simulation control.

---

**11. Why should synthesizable and non-synthesizable code be separated?**

**Answer:**

Separating them ensures that implementation RTL contains only appropriate hardware descriptions while simulation-only code remains in the verification environment.

---

**12. Is every Verilog construct synthesizable?**

**Answer:**

No. Verilog contains constructs intended specifically for simulation and verification, and some constructs have synthesis support that depends on the synthesis tool.

---

* **Quick Revision**

  - Synthesizable → **Convertible to hardware**
  - Non-Synthesizable → **Simulation / Verification**
  - FPGA/ASIC RTL → **Synthesizable**
  - Testbench → **Often contains non-synthesizable code**
  - `#10` Delay → **Generally non-synthesizable**
  - `$display` → **Simulation**
  - `$monitor` → **Simulation**
  - `$finish` → **Simulation**
  - `assign` → **Synthesizable**
  - `if-else` → **Synthesizable when appropriately coded**
  - `case` → **Synthesizable when appropriately coded**
  - Module Instantiation → **Synthesizable**
  - Main Goal of Synthesis → **Generate implementable hardware**

---

* **Summary**

**Synthesizable Verilog** describes hardware that can be converted into an implementable circuit using a synthesis tool. **Non-Synthesizable Verilog** is mainly used for simulation and verification, such as generating testbench stimulus, adding simulation delays, displaying information, and controlling simulations. Understanding the difference is essential for writing correct RTL code for **FPGA, ASIC, and VLSI design**.

---

* **References**

  - Samir Palnitkar – *Verilog HDL: A Guide to Digital Design and Synthesis*.
  - M. Morris Mano – *Digital Design*.
  - David Harris and Sarah Harris – *Digital Design and Computer Architecture*.
  - Neso Academy – Verilog HDL.
  - IEEE – *IEEE Standard for Verilog Hardware Description Language*.
