# **Structural vs Behavioral Modeling**

* **Overview**

**Structural Modeling** and **Behavioral Modeling** are two important approaches used to describe digital circuits in Verilog. Structural modeling describes a circuit using interconnected modules and logic gates, while behavioral modeling describes the operation or behavior of the circuit using procedural statements.

---

* **Definition**

**Structural Modeling** describes a digital circuit by explicitly defining its components and their interconnections.

**Behavioral Modeling** describes the behavior of a digital circuit using procedural constructs such as `always`, `if-else`, and `case` statements without explicitly describing every hardware connection.

---

* **Why is it needed?**

  - To represent digital circuits using different levels of abstraction.
  - To simplify complex RTL design.
  - To describe hardware structure and functionality.
  - To improve code readability and maintainability.
  - To select an appropriate modeling style for different designs.
  - To support hierarchical and modular design.
  - To make complex digital systems easier to design and verify.

---

* **Syntax**

### Structural Modeling

The general syntax is:

```verilog
module_name instance_name (
    .port(signal),
    .port(signal)
);
```

Example:

```verilog
and_gate U1 (
    .a(a),
    .b(b),
    .y(y)
);
```

### Behavioral Modeling

The general syntax is:

```verilog
always @(*)
begin
    if (condition)
        output_signal = value1;
    else
        output_signal = value2;
end
```

Example:

```verilog
always @(*)
begin
    y = a & b;
end
```

---

* **Structure / General Form**

### Structural Modeling

```text id="u7t6ls"
             ┌─────────┐
A ──────────►│         │
             │ AND     │────► Y
B ──────────►│  Gate   │
             └─────────┘
```

The circuit is described using individual components and their connections.

### Behavioral Modeling

```text id="9m5z6r"
        ┌──────────────────┐
A ─────►│                  │
B ─────►│ Behavioral Logic │────► Y
        │                  │
        └──────────────────┘
```

The circuit operation is described using behavioral statements.

---

* **How it works**

### Structural Modeling

  - Individual components are described as modules or gates.
  - Instances of these components are created.
  - Signals are used to connect the components.
  - The complete circuit is formed through these connections.
  - It represents the structure of the hardware.

### Behavioral Modeling

  - The required functionality is described using procedural statements.
  - The `always` block is commonly used.
  - Conditions and operations are described using statements such as `if-else` and `case`.
  - Synthesis tools convert the behavioral description into equivalent hardware.
  - It focuses on what the circuit should do rather than explicitly describing every connection.

---

* **Code Example**

### Structural Modeling

```verilog
module and_gate (
    input  wire a,
    input  wire b,
    output wire y
);

assign y = a & b;

endmodule
```

Top-level module:

```verilog
module structural_and (
    input  wire a,
    input  wire b,
    output wire y
);

and_gate U1 (
    .a(a),
    .b(b),
    .y(y)
);

endmodule
```

### Behavioral Modeling

```verilog
module behavioral_and (
    input  wire a,
    input  wire b,
    output reg  y
);

always @(*)
begin
    y = a & b;
end

endmodule
```

---

* **Code Explanation**

### Structural Modeling

```verilog
and_gate U1 (
    .a(a),
    .b(b),
    .y(y)
);
```

instantiates the previously defined `and_gate` module.

- `and_gate` → Module name.
- `U1` → Instance name.
- `.a(a)` → Connects input `a`.
- `.b(b)` → Connects input `b`.
- `.y(y)` → Connects output `y`.

The circuit is constructed by connecting a reusable hardware module.

### Behavioral Modeling

```verilog
always @(*)
begin
    y = a & b;
end
```

describes the behavior of the AND operation.

- `always @(*)` executes whenever an input used inside the block changes.
- `y = a & b` describes the required output behavior.
- The synthesis tool determines the corresponding hardware implementation.

---

* **Input & Output Description**

### Structural Modeling

  - Inputs:-
    - `a` [1-bit Input]
    - `b` [1-bit Input]

  - Output:-
    - `y` [1-bit Output]

### Behavioral Modeling

  - Inputs:-
    - `a` [1-bit Input]
    - `b` [1-bit Input]

  - Output:-
    - `y` [1-bit Output]

Both implementations produce the same logical AND function.

---

* **Working Example**

Consider:

```text id="5q6c3r"
a = 1
b = 1
```

### Structural Modeling

The inputs are connected to the instantiated AND gate:

```text id="qg4hqc"
a ──┐
    ├──► AND Gate ──► y
b ──┘
```

Therefore:

```text id="8wcx0a"
y = 1 & 1
y = 1
```

### Behavioral Modeling

The behavioral block evaluates:

```verilog id="n5n1q8"
y = a & b;
```

Therefore:

```text id="rvz9jf"
y = 1
```

Another Example:

```text id="yp0xvw"
a = 1
b = 0
```

Both structural and behavioral models produce:

```text id="9is0b6"
y = 0
```

---

* **Simulation / Expected Output**

| A | B | Structural Output | Behavioral Output |
|---|---|---|---|
| 0 | 0 | 0 | 0 |
| 0 | 1 | 0 | 0 |
| 1 | 0 | 0 | 0 |
| 1 | 1 | 1 | 1 |

Both modeling approaches produce the same logical output.

---

* **Synthesizability**

Both structural and behavioral modeling can be synthesizable when appropriate synthesizable Verilog constructs are used.

Structural example:

```verilog id="t7k7pv"
and_gate U1 (
    .a(a),
    .b(b),
    .y(y)
);
```

Behavioral example:

```verilog id="a1u1ct"
always @(*)
begin
    y = a & b;
end
```

The synthesis tool converts both descriptions into equivalent hardware.

---

* **Common Mistakes**

  - Confusing structural modeling with behavioral modeling.
  - Using incorrect module or instance names in structural modeling.
  - Connecting the wrong signals to module ports.
  - Using incomplete sensitivity lists in behavioral combinational logic.
  - Forgetting to assign outputs in all required behavioral conditions.
  - Using non-synthesizable constructs in RTL intended for synthesis.
  - Assuming behavioral code does not represent hardware.
  - Creating unnecessary hierarchy for simple logic.

---

* **Best Practices**

  - Use structural modeling when explicit module or gate connections are important.
  - Use behavioral modeling when functionality is easier to describe procedurally.
  - Use `always @(*)` for combinational behavioral logic in Verilog.
  - Use meaningful module and instance names.
  - Keep modules small and reusable.
  - Use named port connections in structural designs.
  - Ensure complete assignments in combinational behavioral blocks.
  - Verify both functional behavior and synthesized hardware.

---

* **Applications**

  *Structural and behavioral modeling are used in:*

  - RTL Design.
  - Digital Logic Design.
  - Hierarchical Design.
  - Processor Design.
  - ALU Design.
  - FSM Design.
  - FPGA Design.
  - VLSI Design.
  - IP Core Design.
  - Digital System Design.

---

* **Advantages**

### Structural Modeling

  - Clearly represents hardware structure.
  - Provides explicit module interconnections.
  - Supports hierarchical design.
  - Promotes module reuse.
  - Useful for gate-level and component-level designs.

### Behavioral Modeling

  - Requires less code for many designs.
  - Easier to read and modify.
  - Suitable for describing complex functionality.
  - Provides a higher level of abstraction.
  - Simplifies RTL development.

---

* **Limitations**

### Structural Modeling

  - Can require more code.
  - Large designs may become difficult to manage.
  - Explicit connections can increase design complexity.
  - Changes in module interfaces may require multiple connection updates.

### Behavioral Modeling

  - Does not explicitly show every hardware connection.
  - Some behavioral constructs may not be synthesizable.
  - Incorrect coding can result in unintended hardware.
  - The synthesized hardware may not be immediately obvious from the code.

---

* **Real-World Example**

  - **Structural Modeling:** A processor can be constructed by connecting ALU, registers, multiplexers, and control modules.
  - **Behavioral Modeling:** An ALU operation can be described using `case` statements representing addition, subtraction, AND, OR, and XOR operations.
  - **FPGA Design:** Structural modules can connect reusable IP blocks, while behavioral RTL can describe their internal functionality.
  - **VLSI Design:** Both approaches can be used at different abstraction levels during RTL development.

---

* **Key Points**

  - **Structural Modeling** describes **how components are connected**.
  - **Behavioral Modeling** describes **what the circuit does**.
  - Structural modeling commonly uses **module instantiation**.
  - Behavioral modeling commonly uses **`always` blocks**.
  - Structural modeling provides a lower-level structural view.
  - Behavioral modeling provides a higher-level functional view.
  - Both can be synthesizable.
  - Both can represent the same hardware functionality.

Comparison:

| Feature | Structural Modeling | Behavioral Modeling |
|---|---|---|
| Main Focus | Hardware Structure | Circuit Behavior |
| Description | Components and Connections | Functionality |
| Common Construct | Module Instantiation | `always` Block |
| Abstraction | Lower | Higher |
| Reusability | High | High |
| Readability | Moderate | High |
| Hardware Connections | Explicit | Mostly Implicit |
| Synthesizable | Yes | Yes, with synthesizable constructs |

---

* **Interview Questions**

**1. What is structural modeling?**

**Answer:**

Structural modeling describes a digital circuit using components such as gates and modules and explicitly defines their interconnections.

---

**2. What is behavioral modeling?**

**Answer:**

Behavioral modeling describes the functionality or behavior of a digital circuit using procedural constructs such as `always`, `if-else`, and `case`.

---

**3. What is the main difference between structural and behavioral modeling?**

**Answer:**

Structural modeling focuses on **how the hardware components are connected**, while behavioral modeling focuses on **what the circuit does**.

---

**4. Which modeling style commonly uses module instantiation?**

**Answer:**

Structural modeling commonly uses module instantiation.

---

**5. Which modeling style commonly uses `always` blocks?**

**Answer:**

Behavioral modeling commonly uses `always` blocks.

---

**6. Can behavioral modeling be synthesized?**

**Answer:**

Yes. Synthesizable behavioral Verilog can be converted into hardware by synthesis tools.

---

**7. Can structural modeling be synthesized?**

**Answer:**

Yes. Structural Verilog using synthesizable modules and gates can be synthesized into hardware.

---

**8. Which modeling style provides a higher level of abstraction?**

**Answer:**

Behavioral modeling generally provides a higher level of abstraction because it describes circuit functionality instead of explicitly specifying every hardware connection.

---

**9. Which modeling style is useful for hierarchical design?**

**Answer:**

Structural modeling is particularly useful for hierarchical design because modules can be instantiated and connected to build larger systems.

---

**10. Can structural and behavioral modeling produce the same hardware?**

**Answer:**

Yes. Different Verilog descriptions can synthesize to equivalent hardware if they describe the same functionality.

---

**11. What is an example of structural modeling?**

**Answer:**

Instantiating an AND gate module inside another module is an example of structural modeling.

```verilog id="ax8pvi"
and_gate U1 (
    .a(a),
    .b(b),
    .y(y)
);
```

---

**12. What is an example of behavioral modeling?**

**Answer:**

Describing an AND operation using an `always` block is an example of behavioral modeling.

```verilog id="1n4h8r"
always @(*)
begin
    y = a & b;
end
```

---

* **Quick Revision**

  - Structural Modeling → **Describes hardware structure.**
  - Behavioral Modeling → **Describes circuit behavior.**
  - Structural Focus → **How**
  - Behavioral Focus → **What**
  - Structural Construct → **Module Instantiation**
  - Behavioral Construct → **`always` Block**
  - Structural Connections → **Explicit**
  - Behavioral Connections → **Mostly Implicit**
  - Structural Abstraction → **Lower**
  - Behavioral Abstraction → **Higher**
  - Both → **Can be synthesizable**
  - Structural Example → **Module/Gate Instantiation**
  - Behavioral Example → **`always @(*)`**

---

* **Summary**

**Structural Modeling** and **Behavioral Modeling** are two important Verilog modeling approaches. Structural modeling describes a circuit through components and their interconnections, while behavioral modeling describes the functionality of the circuit using procedural statements. Structural modeling is useful for hierarchical and component-based designs, whereas behavioral modeling is commonly used for concise and readable RTL descriptions. Both approaches can be used to create synthesizable digital hardware.

---

* **References**

  - Samir Palnitkar – *Verilog HDL: A Guide to Digital Design and Synthesis*.
  - M. Morris Mano – *Digital Design*.
  - David Harris and Sarah Harris – *Digital Design and Computer Architecture*.
  - Neso Academy – Verilog HDL.
  - IEEE – *IEEE Standard for Verilog Hardware Description Language*.
