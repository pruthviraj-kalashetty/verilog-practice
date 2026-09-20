# ◈ **Verilog RTL code** 

```verilog

module digital_stopwatch #(
    parameter integer SUBSEC_CYCLES = 100,
    parameter integer MAX_MINUTES = 100
)(
    input clk,
    input reset,
    input start,

    output reg [7:0] minutes,
    output reg [5:0] seconds,
    output reg [6:0] subseconds
);

always @(posedge clk) begin
   if (reset) begin 
       minutes <= 8'd0;
       seconds <= 6'd0;
       subseconds <= 7'd0;
    end

   else if (start) begin
       if (subseconds == SUBSEC_CYCLES -1) begin
           subseconds <= 7'd0;

           if (seconds == 59) begin
               seconds <= 6'd0;

               if (minutes == MAX_MINUTES)
                  minutes <= 8'd0;
               else 
                  minutes <= minutes + 1;   
            end

            else begin
                seconds <= seconds + 1;
            end
        end 
        else begin
            subseconds <= subseconds + 1;
        end
    end 
end
endmodule 

```

# 🧪 **Testbench**

```verilog

`timescale 1ns/1ps

module digital_stopwatch_tb;

    // Testbench input signals
    reg clk;
    reg reset;
    reg start;
    
    //DUT output signals
    wire [7:0] minutes;
    wire [5:0] seconds;
    wire [6:0] subseconds;
 
    // Connect testbench to DUT
    digital_stopwatch dut(
        .clk(clk),
        .reset(reset),
        .start(start),
        .minutes(minutes),
        .seconds(seconds),
        .subseconds(subseconds)
    );
  // Generate clock
  initial begin 
    clk = 1'b0;
    forever #5 clk = ~ clk;
  end

  // Create waveform file
  initial begin
      $dumpfile("digital_stopwatch.vcd");
      $dumpvars(0, digital_stopwatch_tb);
  end

  // Stop simulation
  initial begin 
    reset = 1'b1;
    start = 1'b0;

    #10;

    reset = 1'b0;
    start = 1'b1;
    
      #100;
      $finish;
  end
endmodule

```

# Simulation and Verification Process

Behavioral simulation for the Digital Stopwatch is executed using Icarus Verilog (iverilog), followed by waveform inspection and debugging in GTKWave. This verification pipeline ensures that the synchronous reset, start control, sub-second counter, seconds counter, minutes counter, and rollover logic meet the defined functional requirements.

---

## 🛠️ Step-by-Step Simulation Workflow

Follow the commands below to compile the source files, execute the simulation runtime, and visualize the output waveforms:

### 1. Compile the RTL and Testbench
Combine the main design module and the verification testbench into a compiled simulation executable using `iverilog`.

```bash
iverilog -o digital_stopwatch_sim digital_stopwatch.v digital_stopwatch_tb.v
```

### 2. Run the Simulation
Execute the compiled simulation using vvp to generate the waveform dump file.

```bash
vvp digital_stopwatch_sim
```
### 3. Open the Waveform
Open the generated waveform file using GTKWave.
```bash
gtkwave digital_stopwatch.vcd
```

# 🔷 **RTL Schematics**

![RTL Schematic](rtl-schematic.png)

# 📈 **Simulation Result**
![waveform](waveform.png)

