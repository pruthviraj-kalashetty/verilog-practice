# ⚡ VERILOG HDL & RTL DESIGN PRACTICE

### Verilog HDL • Procedural Blocks • Combinational RTL • Sequential RTL • Testbenches • Finite State Machines

<p>
  <img src="https://img.shields.io/badge/%E2%9A%A1%20DOMAIN-VLSI%20ENGINEERING-0F172A?style=for-the-badge&labelColor=020617&color=2563EB"/>
  <img src="https://img.shields.io/badge/%E2%9C%A6%20FOCUS-RTL%20DESIGN-0F172A?style=for-the-badge&labelColor=020617&color=06B6D4"/>
  <img src="https://img.shields.io/badge/%E2%97%88%20LANGUAGE-VERILOG%20HDL-0F172A?style=for-the-badge&labelColor=020617&color=10B981"/>
  <img src="https://img.shields.io/badge/%E2%97%88%20VERIFICATION-TESTBENCH%20%26%20SIMULATION-0F172A?style=for-the-badge&labelColor=020617&color=8B5CF6"/>
</p>

<p>
  <img src="https://img.shields.io/badge/%E2%97%88%20SYNTHESIS-SYNTHESIZABLE%20CODING-0F172A?style=for-the-badge&labelColor=020617&color=3B82F6"/>
  <img src="https://img.shields.io/badge/%E2%97%88%20SAFETY-LATCH--FREE%20DESIGN-0F172A?style=for-the-badge&labelColor=020617&color=14B8A6"/>
  <img src="https://img.shields.io/badge/%E2%97%88%20FSM-STATE%20MACHINES-0F172A?style=for-the-badge&labelColor=020617&color=F59E0B"/>
  <img src="https://img.shields.io/badge/%E2%97%88%20PURPOSE-RTL%20IMPLEMENTATION-0F172A?style=for-the-badge&labelColor=020617&color=F97316"/>
</p>

--- 

## 🛠️ Tools Used
  <p>
  <img src="https://skillicons.dev/icons?i=github,git,vscode,linux"/>
  <img src="https://img.shields.io/badge/Vivado-FF1010?style=for-the-badge&logo=amd&logoColor=white" />
  <img src="https://img.shields.io/badge/GTKWave-2C2C2C?style=for-the-badge&logo=gtkwave&logoColor=white" />
  <img src="https://img.shields.io/badge/Icarus%20Verilog-1E88E5?style=for-the-badge&logo=verilog&logoColor=white" />
   
  </p>

---

## 📌 About This Repository

This repository serves as a hands-on implementation foundation for **Verilog HDL** and **Synthesizable RTL Design**. It systematically provides clean Verilog modules, self-checking testbenches, structural schematics, and simulation waveform artifacts for front-end ASIC/FPGA hardware design.

### 🎯 Key Knowledge Domains
* **Hardware Description Fundamentals:** Data types, operators, continuous assignments, and procedural blocks.
* **Combinational & Sequential RTL:** Implementations of arithmetic logic, multiplexers, latches, flip-flops, registers, and counters.
* **Synthesizable RTL Coding:** Structural design patterns, avoiding latch inference, and code optimization.
* **Verification & FSM Design:** Testbench architecture, stimulus generation, sequence detection, and state machine design patterns.

---

## 📚 Syllabus & Roadmap

<details open>
<summary><b>1️⃣ Verilog Fundamentals & Language Structure</b></summary>

* **Verilog Basics:** HDLs vs. Software Languages, Module Anatomy, Port Declarations (Input, Output, Inout).
* **Data Types & Data Representation:** `wire` vs. `reg`, Integer/Real/Time Types, Sized & Unsized Number Systems.
* **Operators & Expressions:** Arithmetic, Bitwise, Reduction, Logical, Relational, and Operator Precedence.
* **Parameterization:** Local Constants (`localparam`) vs. Reconfigurable Parameters (`parameter`).
</details>

<details open>
<summary><b>2️⃣ Procedural Blocks & Control Flow</b></summary>

* **Execution Blocks:** `initial` vs. `always` Execution Semantics, Sensitivity Lists, Combinationally Complete `always @*`.
* **Assignment Types:** Blocking (`=`) vs. Non-blocking (`<=`) Assignment Rules and Execution Behavior.
* **Conditional Statements:** `if-else` Construction, `case` / `casex` / `casez` Syntax, Priority vs. Parallel Logic Synthesis.
</details>

<details open>
<summary><b>3️⃣ Synthesizable RTL & Design Best Practices</b></summary>

* **Synthesis Principles:** Synthesizable Subsets, Non-Synthesizable Constructs, Hardware Inference Rules.
* **Latch Avoidance:** Latch Inference Mechanisms, Default Assignments, Latch-Free Design Patterns.
* **Structural Hierarchy:** Module Instantiation Types, Named vs. Positional Connections, Behavioral vs. Structural Design.
</details>

<details open>
<summary><b>4️⃣ Testbenches & Functional Verification</b></summary>

* **Testbench Architecture:** Device Under Test (DUT) Coupling, Stimulus Blocks, Clock Generation Patterns.
* **Simulation & Display Controls:** Delays (`#`), Display Statements (`$display`, `$monitor`), Waveform Dumping (`$dumpfile`, `$dumpvars`).
* **Verification Methods:** Waveform Inspection, Debugging Strategies, Self-Checking Testbench Implementation.
</details>

<details open>
<summary><b>5️⃣ RTL State Machines & Design Patterns</b></summary>

* **FSM Fundamentals:** State Encoding (Binary, One-Hot, Gray), State Diagrams, Next-State & Output Logic.
* **Design Architectures:** Single-Process, Two-Process, and Three-Process FSM Coding Guidelines.
* **Sequence Detection & Reset:** Overlapping vs. Non-Overlapping Detectors, Synchronous vs. Asynchronous Reset Control.
</details>

---

# 🏗️ Directory Structure

```text
**Repository - 02**

├── Verilog-HDL-and-RTL-Design
│   ├── [01]-Verilog-Basics
│   │   ├── What-is-HDL.md
│   │   ├── HDL-vs-Software.md
│   │   ├── Introduction-to-Verilog.md
│   │   ├── Module-Structure.md
│   │   ├── Port-Declaration.md
│   │   ├── Data-Types-wire-vs-reg.md
│   │   ├── Integer-Real-Time.md
│   │   ├── Number-Representation.md
│   │   ├── Operators-in-Verilog.md
│   │   ├── Operator-Precedence.md
│   │   ├── Parameters.md
│   │   └── localparam.md
│   │
│   ├── [02]-Procedural-Blocks
│   │   ├── initial-Block.md
│   │   ├── always-Block.md
│   │   ├── Sensitivity-List.md
│   │   ├── always-Star.md
│   │   ├── Clocked-always.md
│   │   └── Blocking-vs-NonBlocking.md
│   │
│   ├── [03]-Combinational-Logic
│   │   ├── Boolean-Logic.md
│   │   ├── Continuous-Assignment.md
│   │   ├── Gate-Level-Modeling.md
│   │   ├── Dataflow-Modeling.md
│   │   ├── Behavioral-Modeling.md
│   │   ├── if-else.md
│   │   ├── case.md
│   │   ├── Ternary-Operator.md
│   │   └── Priority-vs-Parallel.md
│   │
│   ├── [04]-Sequential-Logic
│   │   ├── 01-Clock-Concept.md
│   │   ├── 02-Edge-Triggering.md
│   │   ├── 03-Reset-Synchronous.md
│   │   ├── 04-Reset-Asynchronous.md
│   │   └── 05-Memory-Basics.md
│   │
│   ├── [05]-Hierarchical-Design
│   │   ├── 01-Module-Instantiation.md
│   │   └── 02-Structural-vs-Behavioral.md
│   │
│   ├── [06]-Synthesizable-Coding
│   │   ├── 01-Synthesizable-vs-NonSynth.md
│   │   ├── 02-Coding-Guidelines.md
│   │   ├── 03-Common-Mistakes.md
│   │   └── 04-Code-Optimization.md
│   │
│   ├── [07]-Avoiding-Latches
│   │   ├── 01-What-is-a-Latch.md
│   │   ├── 02-Latch-Inference.md
│   │   └── 03-Writing-Latch-Free-Code.md
│   │
│   ├── [08]-Testbench
│   │   ├── 01-What-is-Testbench.md
│   │   ├── 02-DUT.md
│   │   ├── 03-Writing-Testbench.md
│   │   ├── 04-Stimulus-Generation.md
│   │   ├── 05-Clock-Generation.md
│   │   ├── 06-Delay-Control(#).md
│   │   ├── 07-$display-$monitor.md
│   │   ├── 08-$dumpfile-$dumpvars.md
│   │   └── 09-Self-Checking-Testbench.md
│   │
│   ├── [09]-Simulation
│   │   ├── 01-Simulation-Basics.md
│   │   ├── 02-Compilation.md
│   │   ├── 03-Running-Simulation.md
│   │   ├── 04-Waveform-Analysis.md
│   │   └── 05-Debugging-Techniques.md
│   │
│   ├── [10]-Combinational-RTL-Design
│   │   ├── 01-Logic-Gates
│   │   │   ├── 01-AND-Gate
│   │   │   │   ├── README.md
│   │   │   │   ├── and_gate.v
│   │   │   │   ├── and_gate_tb.v
│   │   │   │   ├── rtl-schematic.png
│   │   │   │   └── waveform.png
│   │   │   │
│   │   │   ├── 02-OR-Gate
│   │   │   │   ├── README.md
│   │   │   │   ├── or_gate.v
│   │   │   │   ├── or_gate_tb.v
│   │   │   │   ├── rtl-schematic.png
│   │   │   │   └── waveform.png
│   │   │   │
│   │   │   ├── 03-NOT-Gate
│   │   │   │   ├── README.md
│   │   │   │   ├── not_gate.v
│   │   │   │   ├── not_gate_tb.v
│   │   │   │   ├── rtl-schematic.png
│   │   │   │   └── waveform.png
│   │   │   │
│   │   │   ├── 04-NAND-Gate
│   │   │   │   ├── README.md
│   │   │   │   ├── nand_gate.v
│   │   │   │   ├── nand_gate_tb.v
│   │   │   │   ├── rtl-schematic.png
│   │   │   │   └── waveform.png
│   │   │   │
│   │   │   ├── 05-NOR-Gate
│   │   │   │   ├── README.md
│   │   │   │   ├── nor_gate.v
│   │   │   │   ├── nor_gate_tb.v
│   │   │   │   ├── rtl-schematic.png
│   │   │   │   └── waveform.png
│   │   │   │
│   │   │   ├── 06-XOR-Gate
│   │   │   │   ├── README.md
│   │   │   │   ├── xor_gate.v
│   │   │   │   ├── xor_gate_tb.v
│   │   │   │   ├── rtl-schematic.png
│   │   │   │   └── waveform.png
│   │   │   │
│   │   │   └── 07-XNOR-Gate
│   │   │       ├── README.md
│   │   │       ├── xnor_gate.v
│   │   │       ├── xnor_gate_tb.v
│   │   │       ├── rtl-schematic.png
│   │   │       └── waveform.png
│   │   │
│   │   ├── 02-Adders
│   │   │   ├── 01-Half-Adder
│   │   │   │   ├── README.md
│   │   │   │   ├── half_adder.v
│   │   │   │   ├── half_adder_tb.v
│   │   │   │   ├── rtl-schematic.png
│   │   │   │   └── waveform.png
│   │   │   │
│   │   │   ├── 02-Full-Adder
│   │   │   │   ├── README.md
│   │   │   │   ├── full_adder.v
│   │   │   │   ├── full_adder_tb.v
│   │   │   │   ├── rtl-schematic.png
│   │   │   │   └── waveform.png
│   │   │   │
│   │   │   └── 03-Full-Adder-Using-Half-Adder
│   │   │       ├── README.md
│   │   │       ├── full_adder_using_two_half_adder.v
│   │   │       ├── full_adder_using_two_half_adder_tb.v
│   │   │       ├── rtl-schematic.png
│   │   │       └── waveform.png
│   │   │
│   │   ├── 03-Subtractor
│   │   │   ├── 01-Half-Subtractor
│   │   │   │   ├── README.md
│   │   │   │   ├── half_subtractor.v
│   │   │   │   ├── half_subtractor_tb.v
│   │   │   │   ├── rtl-schematic.png
│   │   │   │   └── waveform.png
│   │   │   │
│   │   │   ├── 02-Full-Subtractor
│   │   │   │   ├── README.md
│   │   │   │   ├── full_subtractor.v
│   │   │   │   ├── full_subtractor_tb.v
│   │   │   │   ├── rtl-schematic.png
│   │   │   │   └── waveform.png
│   │   │   │
│   │   │   └── 03-Full-Subtractor-Using-Half-Subtractor
│   │   │       ├── README.md
│   │   │       ├── full_subtractor_using_two_half_subtractor.v
│   │   │       ├── full_subtractor_using_two_half_subtractor_tb.v
│   │   │       ├── rtl-schematic.png
│   │   │       └── waveform.png
│   │   │
│   │   ├── 04-Multiplexers
│   │   │   ├── 01-Mux-2x1
│   │   │   │   ├── README.md
│   │   │   │   ├── mux_2x1.v
│   │   │   │   ├── mux_2x1_tb.v
│   │   │   │   ├── rtl-schematic.png
│   │   │   │   └── waveform.png
│   │   │   │
│   │   │   ├── 02-Mux-4x1
│   │   │   │   ├── README.md
│   │   │   │   ├── mux_4x1.v
│   │   │   │   ├── mux_4x1_tb.v
│   │   │   │   ├── rtl-schematic.png
│   │   │   │   └── waveform.png
│   │   │   │
│   │   │   └── 03-Mux-8x1
│   │   │       ├── README.md
│   │   │       ├── mux_8x1.v
│   │   │       ├── mux_8x1_tb.v
│   │   │       ├── rtl-schematic.png
│   │   │       └── waveform.png
│   │   │
│   │   ├── 05-Demultiplexers
│   │   │   ├── 01-Demux-1x2
│   │   │   │   ├── README.md
│   │   │   │   ├── demux_1x2.v
│   │   │   │   ├── demux_1x2_tb.v
│   │   │   │   ├── rtl-schematic.png
│   │   │   │   └── waveform.png
│   │   │   │
│   │   │   ├── 02-Demux-1x4
│   │   │   │   ├── README.md
│   │   │   │   ├── demux_1x4.v
│   │   │   │   ├── demux_1x4_tb.v
│   │   │   │   ├── rtl-schematic.png
│   │   │   │   └── waveform.png
│   │   │   │
│   │   │   └── 03-Demux-1x8
│   │   │       ├── README.md
│   │   │       ├── demux_1x8.v
│   │   │       ├── demux_1x8_tb.v
│   │   │       ├── rtl-schematic.png
│   │   │       └── waveform.png
│   │   │
│   │   ├── 06-Decoders
│   │   │   ├── 01-Decoder-2x4
│   │   │   │   ├── README.md
│   │   │   │   ├── decoder_2x4.v
│   │   │   │   ├── decoder_2x4_tb.v
│   │   │   │   ├── rtl-schematic.png
│   │   │   │   └── waveform.png
│   │   │   │
│   │   │   ├── 02-Decoder-3x8
│   │   │   │   ├── README.md
│   │   │   │   ├── decoder_3x8.v
│   │   │   │   ├── decoder_3x8_tb.v
│   │   │   │   ├── rtl-schematic.png
│   │   │   │   └── waveform.png
│   │   │   │
│   │   │   └── 03-Decoder-4x16
│   │   │       ├── README.md
│   │   │       ├── decoder_4x16.v
│   │   │       ├── decoder_4x16_tb.v
│   │   │       ├── rtl-schematic.png
│   │   │       └── waveform.png
│   │   │
│   │   ├── 07-Encoders
│   │   │   ├── 01-Encoder-4x2
│   │   │   │   ├── README.md
│   │   │   │   ├── encoder_4x2.v
│   │   │   │   ├── encoder_4x2_tb.v
│   │   │   │   ├── rtl-schematic.png
│   │   │   │   └── waveform.png
│   │   │   │
│   │   │   ├── 02-Encoder-8x3
│   │   │   │   ├── README.md
│   │   │   │   ├── encoder_8x3.v
│   │   │   │   ├── encoder_8x3_tb.v
│   │   │   │   ├── rtl-schematic.png
│   │   │   │   └── waveform.png
│   │   │   │
│   │   │   └── 03-Encoder-16x4
│   │   │       ├── README.md
│   │   │       ├── encoder_16x4.v
│   │   │       ├── encoder_16x4_tb.v
│   │   │       ├── rtl-schematic.png
│   │   │       └── waveform.png
│   │   │
│   │   └── 08-Comparators
│   │       ├── 01-1-Bit-Comparator
│   │       │   ├── README.md
│   │       │   ├── 1_bit_comparator.v
│   │       │   ├── 1_bit_comparator_tb.v
│   │       │   ├── rtl-schematic.png
│   │       │   └── waveform.png
│   │       │
│   │       ├── 02-2-Bit-Comparator
│   │       │   ├── README.md
│   │       │   ├── 2_bit_comparator.v
│   │       │   ├── 2_bit_comparator_tb.v
│   │       │   ├── rtl-schematic.png
│   │       │   └── waveform.png
│   │       │
│   │       └── 03-4-Bit-Comparator
│   │           ├── README.md
│   │           ├── 4_bit_comparator.v
│   │           ├── 4_bit_comparator_tb.v
│   │           ├── rtl-schematic.png
│   │           └── waveform.png
│   │
│   ├── [11]-Sequential-RTL
│   │   ├── 01-Latches
│   │   │   ├── 01-SR-Latch
│   │   │   │   ├── README.md
│   │   │   │   ├── sr_latch.v
│   │   │   │   ├── sr_latch_tb.v
│   │   │   │   ├── rtl-schematic.png
│   │   │   │   └── waveform.png
│   │   │   │
│   │   │   └── 02-D-Latch
│   │   │       ├── README.md
│   │   │       ├── d_latch.v
│   │   │       ├── d_latch_tb.v
│   │   │       ├── rtl-schematic.png
│   │   │       └── waveform.png
│   │   │
│   │   ├── 02-Flip-Flops
│   │   │   ├── 01-D-Flip-Flop
│   │   │   │   ├── README.md
│   │   │   │   ├── d_flip_flop.v
│   │   │   │   ├── d_flip_flop_tb.v
│   │   │   │   ├── rtl-schematic.png
│   │   │   │   └── waveform.png
│   │   │   │
│   │   │   ├── 02-JK-Flip-Flop
│   │   │   │   ├── README.md
│   │   │   │   ├── jk_flip_flop.v
│   │   │   │   ├── jk_flip_flop_tb.v
│   │   │   │   ├── rtl-schematic.png
│   │   │   │   └── waveform.png
│   │   │   │
│   │   │   ├── 03-SR-Flip-Flop
│   │   │   │   ├── README.md
│   │   │   │   ├── sr_flip_flop.v
│   │   │   │   ├── sr_flip_flop_tb.v
│   │   │   │   ├── rtl-schematic.png
│   │   │   │   └── waveform.png
│   │   │   │
│   │   │   └── 04-T-Flip-Flop
│   │   │       ├── README.md
│   │   │       ├── t_flip_flop.v
│   │   │       ├── t_flip_flop_tb.v
│   │   │       ├── rtl-schematic.png
│   │   │       └── waveform.png
│   │   │
│   │   ├── 03-Shift-Registers
│   │   │   ├── 01-Serial-In-Serial-Out
│   │   │   │   ├── README.md
│   │   │   │   ├── siso.v
│   │   │   │   ├── siso_tb.v
│   │   │   │   ├── rtl-schematic.png
│   │   │   │   └── waveform.png
│   │   │   │
│   │   │   ├── 02-Serial-In-Parallel-Out
│   │   │   │   ├── README.md
│   │   │   │   ├── sipo.v
│   │   │   │   ├── sipo_tb.v
│   │   │   │   ├── rtl-schematic.png
│   │   │   │   └── waveform.png
│   │   │   │
│   │   │   ├── 03-Parallel-In-Serial-Out
│   │   │   │   ├── README.md
│   │   │   │   ├── piso.v
│   │   │   │   ├── piso_tb.v
│   │   │   │   ├── rtl-schematic.png
│   │   │   │   └── waveform.png
│   │   │   │
│   │   │   └── 04-Parallel-In-Parallel-Out
│   │   │       ├── README.md
│   │   │       ├── pipo.v
│   │   │       ├── pipo_tb.v
│   │   │       ├── rtl-schematic.png
│   │   │       └── waveform.png
│   │   │
│   │   └── 04-Counters
│   │       ├── 01-Asynchronous-Counters
│   │       │   ├── 01-Three-Bit-Asynchronous-Up-Counter
│   │       │   │   ├── README.md
│   │       │   │   ├── three_bit_asynchronous_up_counter.v
│   │       │   │   ├── three_bit_asynchronous_up_counter_tb.v
│   │       │   │   ├── rtl-schematic.png
│   │       │   │   └── waveform.png
│   │       │   │
│   │       │   ├── 02-Three-Bit-Asynchronous-Down-Counter
│   │       │   │   ├── README.md
│   │       │   │   ├── three_bit_asynchronous_down_counter.v
│   │       │   │   ├── three_bit_asynchronous_down_counter_tb.v
│   │       │   │   ├── rtl-schematic.png
│   │       │   │   └── waveform.png
│   │       │   │
│   │       │   ├── 03-Four-Bit-Asynchronous-Up-Counter
│   │       │   │   ├── README.md
│   │       │   │   ├── four_bit_asynchronous_up_counter.v
│   │       │   │   ├── four_bit_asynchronous_up_counter_tb.v
│   │       │   │   ├── rtl-schematic.png
│   │       │   │   └── waveform.png
│   │       │   │
│   │       │   └── 04-Four-Bit-Asynchronous-Down-Counter
│   │       │       ├── README.md
│   │       │       ├── four_bit_asynchronous_down_counter.v
│   │       │       ├── four_bit_asynchronous_down_counter_tb.v
│   │       │       ├── rtl-schematic.png
│   │       │       └── waveform.png
│   │       │
│   │       ├── 02-Synchronous-Counters
│   │       │   ├── 01-Three-Bit-Synchronous-Up-Counter
│   │       │   │   ├── README.md
│   │       │   │   ├── three_bit_synchronous_up_counter.v
│   │       │   │   ├── three_bit_synchronous_up_counter_tb.v
│   │       │   │   ├── rtl-schematic.png
│   │       │   │   └── waveform.png
│   │       │   │
│   │       │   ├── 02-Three-Bit-Synchronous-Down-Counter
│   │       │   │   ├── README.md
│   │       │   │   ├── three_bit_synchronous_down_counter.v
│   │       │   │   ├── three_bit_synchronous_down_counter_tb.v
│   │       │   │   ├── rtl-schematic.png
│   │       │   │   └── waveform.png
│   │       │   │
│   │       │   ├── 03-Four-Bit-Synchronous-Up-Counter
│   │       │   │   ├── README.md
│   │       │   │   ├── four_bit_synchronous_up_counter.v
│   │       │   │   ├── four_bit_synchronous_up_counter_tb.v
│   │       │   │   ├── rtl-schematic.png
│   │       │   │   └── waveform.png
│   │       │   │
│   │       │   └── 04-Four-Bit-Synchronous-Down-Counter
│   │       │       ├── README.md
│   │       │       ├── four_bit_synchronous_down_counter.v
│   │       │       ├── four_bit_synchronous_down_counter_tb.v
│   │       │       ├── rtl-schematic.png
│   │       │       └── waveform.png
│   │       │
│   │       └── 03-Ring-Counter.md
│   │
│   └── [12]-RTL-FSM
│       ├── 01-FSM-Fundamentals
│       │   ├── 01-State-and-Next-State.md
│       │   ├── 02-State-Diagram-to-RTL.md
│       │   ├── 03-State-Transition-Table.md
│       │   └── 04-FSM-Verilog-Structure.md
│       │
│       ├── 02-Moore-FSM
│       │   ├── README.md
│       │   ├── moore_fsm.v
│       │   ├── moore_fsm_tb.v
│       │   ├── rtl-schematic.png
│       │   └── waveform.png
│       │
│       ├── 03-Mealy-FSM
│       │   ├── README.md
│       │   ├── mealy_fsm.v
│       │   ├── mealy_fsm_tb.v
│       │   ├── rtl-schematic.png
│       │   └── waveform.png
│       │
│       ├── 04-Sequence-Detector
│       │   ├── 01-Sequence-Detector-1011-Overlapping
│       │   │   ├── README.md
│       │   │   ├── sequence_detector_1011_overlap.v
│       │   │   ├── sequence_detector_1011_overlap_tb.v
│       │   │   ├── rtl-schematic.png
│       │   │   └── waveform.png
│       │   │
│       │   └── 02-Sequence-Detector-1101-Non-Overlapping
│       │       ├── README.md
│       │       ├── sequence_detector_1101_non_overlap.v
│       │       ├── sequence_detector_1101_non_overlap_tb.v
│       │       ├── rtl-schematic.png
│       │       └── waveform.png
│       │
│       ├── 05-State-Encoding
│       │   ├── 01-Binary-Encoding
│       │   │   ├── README.md
│       │   │   ├── binary_encoding.v
│       │   │   ├── binary_encoding_tb.v
│       │   │   ├── rtl-schematic.png
│       │   │   └── waveform.png
│       │   │
│       │   ├── 02-One-Hot-Encoding
│       │   │   ├── README.md
│       │   │   ├── one_hot_encoding.v
│       │   │   ├── one_hot_encoding_tb.v
│       │   │   ├── rtl-schematic.png
│       │   │   └── waveform.png
│       │   │
│       │   └── 03-Gray-Encoding
│       │       ├── README.md
│       │       ├── gray_encoding.v
│       │       ├── gray_encoding_tb.v
│       │       ├── rtl-schematic.png
│       │       └── waveform.png
│       │
│       ├── 06-FSM-RTL-Design-Patterns
│       │   ├── 01-Two-Process-FSM
│       │   │   ├── README.md
│       │   │   ├── two_process_fsm.v
│       │   │   ├── two_process_fsm_tb.v
│       │   │   ├── rtl-schematic.png
│       │   │   └── waveform.png
│       │   │
│       │   └── 02-Three-Process-FSM
│       │       ├── README.md
│       │       ├── three_process_fsm.v
│       │       ├── three_process_fsm_tb.v
│       │       ├── rtl-schematic.png
│       │       └── waveform.png
│       │
│       └── 07-FSM-Reset-and-Initialization
│           ├── 01-Synchronous-Reset
│           │   ├── README.md
│           │   ├── fsm_sync_reset.v
│           │   ├── fsm_sync_reset_tb.v
│           │   ├── rtl-schematic.png
│           │   └── waveform.png
│           │
│           └── 02-Asynchronous-Reset
│               ├── README.md
│               ├── fsm_async_reset.v
│               ├── fsm_async_reset_tb.v
│               ├── rtl-schematic.png
│               └── waveform.png

```

# 🎯 Skills Developed✔

- Verilog HDL Syntax & Modeling
- Synthesizable RTL Coding Principles
- Combinational Circuit Design in Verilog
- Sequential RTL Implementation
- Latch Avoidance Strategies
- Testbench Development & Stimulus Generation
- Simulation & Waveform Debugging
- Finite State Machine (FSM) Implementation
- State Encoding Optimization
- Multi-Process FSM Coding Patterns
- Hardware Synthesis Readiness
- RTL Verification Fundamentals

--- 

#🔗 Next Learning Stage

This repository builds the foundation for:

➡ Computer Architecture

➡ Advanced RTL IP Design

➡ Projects

➡ ASIC Synthesis & Physical Design
