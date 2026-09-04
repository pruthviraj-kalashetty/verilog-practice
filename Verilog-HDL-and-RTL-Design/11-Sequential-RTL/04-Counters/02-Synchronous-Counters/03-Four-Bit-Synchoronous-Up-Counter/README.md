# ◈ 4-Bit Synchronous Up Counter

### Sequential Circuit • Counter • Behavioral Modeling

---

## 📌 Module Description

The **4-Bit Synchronous Up Counter** is a sequential circuit that counts upward from **0000 to 1111** using four flip-flops, where all flip-flops are triggered simultaneously by the same clock signal. Implemented using procedural statements in behavioral abstraction.

---

# ◈ **Verilog RTL code** 

```verilog


module sync_4bit_up_counter(
    input clk,
    output reg [3:0] Q
);

initial begin
   Q = 4'b0000;
end

always @(posedge clk) begin
   Q <= Q + 1;
end

endmodule
                         
```

# 📊 **Truth table**

| **Inputs** | **Output** | **Output** | **Output** | **Output** |
|:---:|:---:|:---:|:---:|:---:|
| **CLK** | **Q3** | **Q2** | **Q1** | **Q0** |
| ↑ | 0 | 0 | 0 | 0 |
| ↑ | 0 | 0 | 0 | 1 |
| ↑ | 0 | 0 | 1 | 0 |
| ↑ | 0 | 0 | 1 | 1 |
| ↑ | 0 | 1 | 0 | 0 |
| ↑ | 0 | 1 | 0 | 1 |
| ↑ | 0 | 1 | 1 | 0 |
| ↑ | 0 | 1 | 1 | 1 |
| ↑ | 1 | 0 | 0 | 0 |
| ↑ | 1 | 0 | 0 | 1 |
| ↑ | 1 | 0 | 1 | 0 |
| ↑ | 1 | 0 | 1 | 1 |
| ↑ | 1 | 1 | 0 | 0 |
| ↑ | 1 | 1 | 0 | 1 |
| ↑ | 1 | 1 | 1 | 0 |
| ↑ | 1 | 1 | 1 | 1 |
| ↑ | 0 | 0 | 0 | 0 |

# 🧪 **Testbench**

```verilog

module sync_4bit_up_counter_tb;
  reg clk;
  wire [2:0] Q;

  sync_4bit_up_counter DUT(
    .clk(clk),
    .Q(Q)
  );

  initial begin
    clk = 0;
    forever #5 clk <= ~clk;
  end

  initial begin
    $dumpfile("sync_4bit_up_counter.vcd");
    $dumpvars(0, sync_4bit_up_counter_tb);

    #1000;
    $finish;
  end
endmodule                                    

```

# 🔷 **RTL Schematics**

![Four-Bit-Synchoronous-Up-Counter RTL Schematic](rtl-schematic.png)

# 📈 **Simulation Result**
![Four-Bit-Synchoronous-Up-Counter waveform](waveform.png)

# ◈ **Verification Summary**

| **Test Case** | **Expected Output** | **Status** |
|:---|:---:|:---:|
| `Initial State` | `Q3Q2Q1Q0=0000` | **PASS** |
| `1st Clock Pulse` | `Q3Q2Q1Q0=0001` | **PASS** |
| `2nd Clock Pulse` | `Q3Q2Q1Q0=0010` | **PASS** |
| `3rd Clock Pulse` | `Q3Q2Q1Q0=0011` | **PASS** |
| `4th Clock Pulse` | `Q3Q2Q1Q0=0100` | **PASS** |
| `5th Clock Pulse` | `Q3Q2Q1Q0=0101` | **PASS** |
| `6th Clock Pulse` | `Q3Q2Q1Q0=0110` | **PASS** |
| `7th Clock Pulse` | `Q3Q2Q1Q0=0111` | **PASS** |
| `8th Clock Pulse` | `Q3Q2Q1Q0=1000` | **PASS** |
| `9th Clock Pulse` | `Q3Q2Q1Q0=1001` | **PASS** |
| `10th Clock Pulse` | `Q3Q2Q1Q0=1010` | **PASS** |
| `11th Clock Pulse` | `Q3Q2Q1Q0=1011` | **PASS** |
| `12th Clock Pulse` | `Q3Q2Q1Q0=1100` | **PASS** |
| `13th Clock Pulse` | `Q3Q2Q1Q0=1101` | **PASS** |
| `14th Clock Pulse` | `Q3Q2Q1Q0=1110` | **PASS** |
| `15th Clock Pulse` | `Q3Q2Q1Q0=1111` | **PASS** |
| `16th Clock Pulse` | `Q3Q2Q1Q0=0000` | **PASS** |

**Verification Result:** `16/16 TEST CASES PASSED`


