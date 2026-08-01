# Verilog Data Types: integer, real, and time

## 1. integer

### What is an integer?

An **integer** is a data type used to store **whole numbers** (positive or negative).

It cannot store decimal values.

**Simple Definition:**

> **An integer stores whole numbers such as 0, 10, -5, and 100.**

---

## Why do we use integer?

- Counting
- Loop variables
- Calculations
- Temporary values in simulation

---

## Syntax

```verilog
integer count;
```

---

## Example

```verilog
module example;

integer count;

initial begin
    count = 10;
    count = count + 5;
end

endmodule
```

After execution:

```text
count = 15
```

---

## Real-Life Example

Think of a classroom.

Number of students:

```text
45 Students
```

You cannot have **45.5 students**.

So an integer is the correct data type.

---

## Uses

- for loops
- Counters (simulation)
- Mathematical calculations
- Testbench variables

---

## Important Note

`integer` is **generally not used for hardware connections** like inputs and outputs.

---

# 2. real

## What is a real?

A **real** stores **decimal (floating-point) numbers**.

**Simple Definition:**

> **A real stores numbers with decimal points.**

---

## Syntax

```verilog
real voltage;
```

---

## Example

```verilog
module example;

real voltage;

initial begin
    voltage = 3.3;
end

endmodule
```

---

## Real-Life Example

Battery voltage:

```text
3.3 Volts
5.0 Volts
1.8 Volts
```

These contain decimal values.

---

## Uses

- Voltage calculations
- Delay calculations
- Mathematical simulation
- Testbench modeling

---

## Important Note

`real` is **not synthesizable**. It is used only for simulation and testbenches, not for creating hardware.

---

# 3. time

## What is time?

The **time** data type stores **simulation time**.

It helps you measure when events happen during simulation.

**Simple Definition:**

> **A time variable stores simulation time values.**

---

## Syntax

```verilog
time t;
```

---

## Example

```verilog
module example;

time t;

initial begin
    #20;
    t = $time;
end

endmodule
```

After the 20-unit delay:

```text
t = 20
```

---

## Real-Life Example

Think of a stopwatch.

```text
Start
↓

10 seconds

↓

20 seconds

↓

30 seconds
```

A `time` variable records the simulation time, just like a stopwatch records elapsed time.

---

## Uses

- Measuring simulation time
- Recording event times
- Checking delays
- Testbench verification

---

# Comparison Table

| Data Type | Stores | Example | Mostly Used In |
|------------|---------|---------|----------------|
| `wire` | Signal only | Logic connections | RTL Design |
| `reg` | Value assigned in procedural blocks | Flip-flops, combinational logic in `always` | RTL Design |
| `integer` | Whole numbers | 10, -5 | Loops, calculations, testbenches |
| `real` | Decimal numbers | 3.14, 1.8 | Simulation, testbenches |
| `time` | Simulation time | 100, 250 | Delay and timing checks |

---

# Easy Trick to Remember

```text
wire
↓
Carries signals

reg
↓
Holds values in procedural code

integer
↓
Whole numbers

real
↓
Decimal numbers

time
↓
Simulation time
```

---

# Interview Questions

### What is an integer?

An integer stores whole numbers and is commonly used for loops and calculations.

---

### What is a real?

A real stores decimal numbers and is mainly used in simulation.

---

### What is a time variable?

A time variable stores the current simulation time.

---

### Can `real` be synthesized
