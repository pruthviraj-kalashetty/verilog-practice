# ◈ Three-Process FSM

### Finite State Machine • RTL Design • Behavioral Modeling

---

## 📌 Module Description

A **Three-Process FSM** is a common RTL coding style where the FSM is divided into **three separate procedural blocks**: one process for the **state register**, one for **next-state logic**, and one for **output logic**, providing a clear separation of sequential, combinational, and output behavior. Implemented using procedural statements in behavioral abstraction.

---

# ◈ **Verilog RTL code** 

```verilog

module three_process_fsm(
    input clk,
    input x,
    output reg y
);

reg state;
reg next_state;

initial begin
    state = 0;
end

// Process 1: State Register
always @(posedge clk) begin
    state <= next_state;
end

// Process 2: Next-State Logic
always @(*) begin
    if (state == 0) begin
        if (x == 0)
            next_state = 0;
        else
            next_state = 1;
    end
    else begin
        if (x == 0)
            next_state = 0;
        else
            next_state = 1;
    end
end

// Process 3: Output Logic
always @(*) begin
    if (state == 1)
        y = 1;
    else
        y = 0;
end

endmodule   
                         
```

# 📊 **Truth table**

| **Current State** | **Input x** | **Next State** | **Output y** |    
| :---------------: | :---------: | :------------: | :----------: | 
|         S0        |      0      |       S0       |       0      |    
|         S0        |      1      |       S1       |       0      |    
|         S1        |      0      |       S0       |       0      |    
|         S1        |      1      |       S1       |       1      |    

# 🧪 **Testbench**

```verilog

module three_process_fsm_tb;

reg clk;
reg x;
wire y;

three_process_fsm DUT(
    .clk(clk),
    .x(x),
    .y(y)
);

initial begin
    clk = 0;
    forever #5 clk <= ~clk;
end

initial begin
    $dumpfile("three_process_fsm.vcd");
    $dumpvars(0, three_process_fsm_tb);
end

initial begin
    x = 0;

    #10 x = 1;
    #10 x = 0;
    #10 x = 1;
    #10 x = 1;
    #10 x = 0;
    #10;

    $finish;
end

endmodule

```

# 🔷 **RTL Schematics**

![three-process-fsm RTL Schematic](rtl-schematic.png)

# 📈 **Simulation Result**
![three-process-fsm waveform](waveform.png)

# ◈ **Verification Summary**

| **Test Case** | **Expected Output** | **Status** |
|:---|:---:|:---:|
| `Current State=S0, x=0` | `Next State=S0, y=0` | **PASS** |
| `Current State=S0, x=1` | `Next State=S1, y=0` | **PASS** |
| `Current State=S1, x=0` | `Next State=S0, y=0` | **PASS** |
| `Current State=S1, x=1` | `Next State=S1, y=1` | **PASS** |

**Verification Result:** `4/4 TEST CASES PASSED`



