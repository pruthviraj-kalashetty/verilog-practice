# Continuous Assignment

## Definition
Continuous Assignment is a method of assigning values to a `wire` using the `assign` keyword. Whenever the input changes, the output is updated automatically.

## Syntax
```verilog
assign output = expression;
```

## Example
```verilog
assign y = a & b;
```

## Keywords
- assign
- wire

## Features
- Used for combinational logic.
- Continuously updates the output whenever the input changes.
- Does not require an `always` block.
- Can only drive `wire` data types.

## Rules
- Use the `assign` keyword.
- Output should be of type `wire`.
- Best suited for simple combinational circuits.
- Multiple continuous assignments can be used in one module.

## Applications
- Logic Gates
- Multiplexers
- Decoders
- Encoders
- Comparators
- Arithmetic Circuits

## Advantages
- Simple and easy to understand.
- Automatically updates the output.
- Ideal for combinational circuit design.

## Limitations
- Cannot be used for sequential logic.
- Cannot directly assign to `reg` in classic Verilog.
- Not suitable for complex procedural logic.

## Example Designs
- AND Gate
- OR Gate
- NOT Gate
- NAND Gate
- NOR Gate
- XOR Gate
- XNOR Gate
