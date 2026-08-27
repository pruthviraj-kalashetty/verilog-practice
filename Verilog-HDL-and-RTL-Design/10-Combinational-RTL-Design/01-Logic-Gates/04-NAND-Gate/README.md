# ◈ NAND Gate (`nand_gate`)

### Fundamental Logic Gate • Combinational RTL • Dataflow Modeling

---

## 📌 Module Description

The **2-Input NAND Gate** is a basic combinational circuit where the output `Y` goes **LOW (`0`)** only when both inputs `A` and `B` are **HIGH (`1`)**; otherwise, the output remains **HIGH (`1`)**. Implemented using continuous assignment (`assign`) in dataflow abstraction.

---

# ◈ **Verilog RTL code** 

```verilog

module nand_gate(
    
    input A,
    input B,
    output Y

);

assign Y = ~(A & B);

endmodule
```

# 📊 **Truth table**
| **Inputs** |  | **Output** |
|:---:|:---:|:---:|
| **A** | **B** | **Y** |
| 0 | 0 | **1** |
| 0 | 1 | **1** |
| 1 | 0 | **1** |
| 1 | 1 | **0** |

# 🧪 **Testbench**

```verilog

module nand_gate_tb;
     
     reg A;
     reg B;
     wire Y;

     nand_gate DUT(
        .A(A),
        .B(B),
        .Y(Y)
     );

     initial begin
        $dumpfile("nand_gate.vcd");
        $dumpvars(0, nand_gate_tb);

        A = 0;
        B = 0;

        #10; 

        A = 0;
        B = 1;

        #10;

        A = 1;
        B = 0;

        #10;

        A = 1;
        B = 1;

        #10

        $finish;

    end

endmodule         

```

# 🔷 **RTL Schematics**

![NAND Gate RTL Schematic](rtl-schematic.png)

# 📈 **Simulation Result**
![NAND Gate Waveform](waveform.png)

# ◈ **Verification Summary**

| **Test Case** | **Expected Output** | **Status** |
|:---:|:---:|:---:|
| `A=0, B=0` | `y=1` | **PASS** |
| `A=0, B=1` | `y=1` | **PASS** |
| `A=1, B=0` | `y=1` | **PASS** |
| `A=1, B=1` | `y=0` | **PASS** |

**Verification Result:** `4/4 TEST CASES PASSED`
