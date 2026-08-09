# **Module Instantiation**

* **Overview**

**Module Instantiation** is the process of creating an instance of one Verilog module inside another module. It is used in hierarchical design to connect smaller, reusable modules together and build larger digital systems.

---

* **Definition**

**Module Instantiation** is the process of declaring and connecting an instance of an existing Verilog module inside another module.

---

* **Why is it needed?**

  - To reuse existing Verilog modules.
  - To divide a large design into smaller modules.
  - To simplify complex digital circuit design.
  - To improve code organization and readability.
  - To support hierarchical design.
  - To make modules reusable in different designs.
  - To simplify verification and debugging.

---

* **Syntax**

The basic syntax for module instantiation is:

```verilog
module_name instance_name (
    .port_name(signal_name),
    .port_name(signal_name)
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

---

* **Structure / General Form**

A hierarchical Verilog design can be represented as:

```text
                 Top Module
                     │
          ┌──────────┴──────────┐
          │                     │
          ▼                     ▼
      Module A               Module B
          │                     │
          └──────────┬──────────┘
                     │
                     ▼
                  Output
```

The basic structure consists of:

  - **Parent Module** → Module that contains the instantiated module.
  - **Child Module** → Module being instantiated.
  - **Instance Name** → Unique name given to the instantiated module.
  - **Port Connections** → Connections between child-module ports and parent-module signals.

---

* **How it works**

  - First, a reusable module is created.
  - Another module acts as the parent or top-level module.
  - The reusable module is instantiated inside the parent module.
  - Signals in the parent module are connected to the ports of the instantiated module.
  - The instantiated module performs its defined operation.
  - Its outputs are connected to the rest of the parent design.

For example:

```text
       a ─────┐
              │
              ▼
         ┌─────────┐
         │ AND Gate│
       b ─► Module │
         └────┬────┘
              │
              ▼
              y
```

The AND gate can be written as a separate module and then instantiated inside another module.

---

* **Code Example**

### Child Module

```verilog
module and_gate (
    input  wire a,
    input  wire b,
    output wire y
);

assign y = a & b;

endmodule
```

### Parent Module

```verilog
module top_module (
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

---

* **Code Explanation**

### Child Module

```verilog
module and_gate
```

defines a reusable AND gate module.

```verilog
assign y = a & b;
```

performs the AND operation.

### Parent Module

```verilog
and_gate U1
```

instantiates the `and_gate` module.

Here:

- `and_gate` → Module name.
- `U1` → Instance name.
- `.a(a)` → Connects child input `a` to parent signal `a`.
- `.b(b)` → Connects child input `b` to parent signal `b`.
- `.y(y)` → Connects child output `y` to parent signal `y`.

The parent module therefore reuses the functionality of the child module.

---

* **Input & Output Description**

### Child Module

  - Inputs:-
    - `a` [1-bit Input]
    - `b` [1-bit Input]

  - Output:-
    - `y` [1-bit Output]

### Parent Module

  - Inputs:-
    - `a` [1-bit Input]
    - `b` [1-bit Input]

  - Output:-
    - `y` [1-bit Output]

The parent module passes its input signals to the instantiated child module and receives the generated output.

---

* **Working Example**

Consider:

```text
a = 1
b = 1
```

The parent module connects these signals to the instantiated AND gate:

```verilog
and_gate U1 (
    .a(a),
    .b(b),
    .y(y)
);
```

The child module performs:

```text
y = a & b
```

Therefore:

```text
y = 1 & 1
y = 1
```

Another Example:

```text
a = 1
b = 0
```

Then:

```text
y = 1 & 0
y = 0
```

---

* **Simulation / Expected Output**

| A | B | Output Y |
|---|---|---|
| 0 | 0 | 0 |
| 0 | 1 | 0 |
| 1 | 0 | 0 |
| 1 | 1 | 1 |

The parent module produces the same output as the instantiated AND gate.

---

* **Synthesizability**

Module instantiation is synthesizable when the instantiated modules contain synthesizable Verilog code.

For example:

```verilog
and_gate U1 (
    .a(a),
    .b(b),
    .y(y)
);
```

is synthesized as the hardware represented by the `and_gate` module.

Module instantiation itself does not create additional hardware beyond the logic described by the instantiated module.

---

* **Common Mistakes**

  - Using an incorrect module name.
  - Using duplicate instance names in the same scope.
  - Connecting signals to the wrong ports.
  - Missing required port connections.
  - Using incorrect signal widths.
  - Confusing the module name with the instance name.
  - Instantiating a module that is not available to the project.
  - Incorrectly connecting input and output signals.

---

* **Best Practices**

  - Use meaningful module and instance names.
  - Prefer named port connections for readability.
  - Keep module interfaces simple and well-defined.
  - Reuse modules whenever possible.
  - Maintain consistent signal naming.
  - Verify port widths before connecting modules.
  - Organize large designs hierarchically.
  - Keep reusable modules independent and modular.

---

* **Applications**

  *Module instantiation is used in:*

  - Hierarchical RTL Design.
  - Digital Logic Design.
  - Processor Design.
  - ALU Design.
  - Register Design.
  - FSM Design.
  - FPGA Design.
  - VLSI Design.
  - IP Core Integration.
  - System-Level Digital Design.

---

* **Advantages**

  - Promotes module reusability.
  - Simplifies large designs.
  - Improves code organization.
  - Makes debugging easier.
  - Supports hierarchical design.
  - Reduces code duplication.
  - Allows complex systems to be built from smaller modules.

---

* **Limitations**

  - Incorrect port connections can cause design errors.
  - Large hierarchies can become difficult to manage.
  - Module dependencies must be maintained correctly.
  - Signal width mismatches can cause warnings or incorrect behavior.
  - Poor module organization can make debugging difficult.

---

* **Real-World Example**

  - **ALU:** Individual adders, subtractors, multiplexers, and logic units can be instantiated to build an ALU.
  - **Processor:** Registers, ALUs, control units, and multiplexers can be connected through module instantiation.
  - **FPGA Design:** Reusable IP blocks can be instantiated to construct a larger FPGA system.
  - **Communication Systems:** Encoder, decoder, transmitter, and receiver modules can be instantiated together.
  - **VLSI Design:** Complex systems can be constructed from smaller reusable RTL blocks.

---

* **Key Points**

  - Module instantiation allows one Verilog module to be used inside another module.
  - The module being reused is called the **Child Module**.
  - The module containing the instance is called the **Parent Module**.
  - Every instantiated module has an **Instance Name**.
  - Named port mapping uses:

    ```verilog
    .port_name(signal_name)
    ```

  - Example:

    ```verilog
    and_gate U1 (
        .a(a),
        .b(b),
        .y(y)
    );
    ```

  - Module instantiation is fundamental to **hierarchical RTL design**.
  - It improves module reuse and design organization.

---

* **Interview Questions**

**1. What is module instantiation?**

**Answer:**

Module instantiation is the process of creating an instance of an existing Verilog module inside another module.

---

**2. Why is module instantiation used?**

**Answer:**

It is used to reuse existing modules and construct larger digital systems using smaller, modular building blocks.

---

**3. What is an instance name?**

**Answer:**

An instance name is the unique name assigned to an instantiated module.

For example:

```verilog
and_gate U1 (...);
```

Here, `U1` is the instance name.

---

**4. What is the difference between a module name and an instance name?**

**Answer:**

The **module name** identifies the module definition, while the **instance name** identifies a particular occurrence of that module inside another module.

---

**5. What is named port mapping?**

**Answer:**

Named port mapping connects module ports to signals using the port names.

Example:

```verilog
and_gate U1 (
    .a(a),
    .b(b),
    .y(y)
);
```

---

**6. What is positional port mapping?**

**Answer:**

Positional port mapping connects signals according to the order of ports in the module declaration.

Example:

```verilog
and_gate U1 (a, b, y);
```

---

**7. Which port connection method is generally easier to read?**

**Answer:**

Named port mapping is generally easier to read and maintain because each signal is explicitly connected to its corresponding port.

---

**8. Can multiple instances of the same module be created?**

**Answer:**

Yes. Multiple instances of the same module can be created using different instance names.

Example:

```verilog
and_gate U1 (...);
and_gate U2 (...);
and_gate U3 (...);
```

---

**9. What is hierarchical design?**

**Answer:**

Hierarchical design is a design approach in which a complex digital system is divided into smaller modules that are connected together to form the complete system.

---

**10. Is module instantiation synthesizable?**

**Answer:**

Yes. Module instantiation is synthesizable when the instantiated module contains synthesizable RTL.

---

**11. What happens if the port widths do not match?**

**Answer:**

A width mismatch can produce warnings and may cause truncation, extension, or unexpected circuit behavior depending on the connection.

---

**12. How does module instantiation help RTL design?**

**Answer:**

It promotes reuse, modularity, hierarchy, easier verification, and better organization of complex RTL designs.

---

* **Quick Revision**

  - Module Instantiation → Reusing a module inside another module.
  - Reused Module → **Child Module**
  - Containing Module → **Parent Module**
  - Instance Identifier → **Instance Name**
  - Named Mapping → **`.port(signal)`**
  - Positional Mapping → **Signals connected according to port order**
  - Example → **`and_gate U1 (...)`**
  - Main Purpose → **Module Reuse**
  - Design Method → **Hierarchical Design**
  - Main Benefit → **Modularity and Reusability**
  - Multiple Instances → **Allowed**
  - Synthesizable → **Yes, when the instantiated RTL is synthesizable**

---

* **Summary**

**Module Instantiation** is a fundamental feature of Verilog hierarchical design that allows an existing module to be reused inside another module. By connecting child modules through their ports, complex digital systems can be constructed from smaller and reusable RTL blocks. Module instantiation improves modularity, readability, reusability, verification, and organization of Verilog designs.

---

* **References**

  - Samir Palnitkar – *Verilog HDL: A Guide to Digital Design and Synthesis*.
  - M. Morris Mano – *Digital Design*.
  - David Harris and Sarah Harris – *Digital Design and Computer Architecture*.
  - Neso Academy – Verilog HDL.
  - IEEE – *IEEE Standard for Verilog Hardware Description Language*.
