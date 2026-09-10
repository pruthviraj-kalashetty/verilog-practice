# ◈ Gray Encoding

### Finite State Machine • State Encoding • Behavioral Modeling

---

## 📌 Module Description

**Gray Encoding** in an FSM is a state encoding technique where consecutive states are assigned **Gray codes** that differ by only **one bit**, reducing the possibility of multiple state bits changing simultaneously during state transitions. Implemented using Gray state encoding in behavioral abstraction.

---

# ◈ **Verilog RTL code** 

```verilog

module gray_encoding(
    input clk,
    input x,
    output reg y
);

reg [1:0] state;
reg [1:0] next_state;

initial begin
    state = 2'b00;
end

always @(posedge clk) begin
    state <= next_state;
end

always @(*) begin
    if (state == 2'b00) begin
        if (x == 0)
            next_state = 2'b00;
        else
            next_state = 2'b01;
    end
    else if (state == 2'b01) begin
        if (x == 0)
            next_state = 2'b11;
        else
            next_state = 2'b01;
    end
    else if (state == 2'b11) begin
        if (x == 0)
            next_state = 2'b00;
        else
            next_state = 2'b10;
    end
    else begin
        if (x == 0)
            next_state = 2'b11;
        else
            next_state = 2'b00;
    end
end

always @(*) begin
    if (state == 2'b10)
        y = 1;
    else
        y = 0;
end

endmodule   
                         
```

# 📊 **Truth table**

| **Current State** | **Input x** | **Next State** | **Output y** |    
| :---------------: | :---------: | :------------: | :----------: | 
|      S0 (00)      |      0      |    S0 (00)     |       0      |    
|      S0 (00)      |      1      |    S1 (01)     |       0      |    
|      S1 (01)      |      0      |    S2 (11)     |       0      |    
|      S1 (01)      |      1      |    S1 (01)     |       0      |    
|      S2 (11)      |      0      |    S0 (00)     |       0      |    
|      S2 (11)      |      1      |    S3 (10)     |       0      |    
|      S3 (10)      |      0      |    S2 (11)     |       1      |   
|      S3 (10)      |      1      |    S0 (00)     |       1      |          

# 🧪 **Testbench**

```verilog

module gray_encoding_tb;

reg clk;
reg x;
wire y;

gray_encoding DUT(
    .clk(clk),
    .x(x),
    .y(y)
);

initial begin
    clk = 0;
    forever #5 clk <= ~clk;
end

initial begin
    $dumpfile("gray_encoding.vcd");
    $dumpvars(0, gray_encoding_tb);
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

![Gray-Encoding RTL Schematic](rtl-schematic.png)

# 📈 **Simulation Result**
![Gray-Encoding waveform](waveform.png)

# ◈ **Verification Summary**

| **Test Case** | **Expected Output** | **Status** |
|:---|:---:|:---:|
| `Current State=S0 (00), x=0` | `Next State=S0 (00), y=0` | **PASS** |
| `Current State=S0 (00), x=1` | `Next State=S1 (01), y=0` | **PASS** |
| `Current State=S1 (01), x=0` | `Next State=S2 (11), y=0` | **PASS** |
| `Current State=S1 (01), x=1` | `Next State=S1 (01), y=0` | **PASS** |
| `Current State=S2 (11), x=0` | `Next State=S0 (00), y=0` | **PASS** |
| `Current State=S2 (11), x=1` | `Next State=S3 (10), y=0` | **PASS** |
| `Current State=S3 (10), x=0` | `Next State=S2 (11), y=1` | **PASS** |
| `Current State=S3 (10), x=1` | `Next State=S0 (00), y=1` | **PASS** |

**Verification Result:** `8/8 TEST CASES PASSED`


