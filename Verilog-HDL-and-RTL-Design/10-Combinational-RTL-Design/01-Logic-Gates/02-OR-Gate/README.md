# ◈ OR Gate (`or_gate`)

### Fundamental Logic Gate • Combinational RTL • Dataflow Modeling

---

## 📌 Module Description

The **2-Input OR Gate** is a basic combinational circuit where the output `Y` goes **HIGH (`1`)** if at least one of the inputs `A` or `B` is **HIGH (`1`)**. Implemented using continuous assignment (`assign`) in dataflow abstraction.

---

# ◈ **Verilog RTL code** 

```verilog

module or_gate(

    input A,
    input B,
    output Y

);

assign Y = A | B;

endmodule
```

# 📊 **Truth table**

| **Inputs** |  | **Output** |
|:---:|:---:|:---:|
| **A** | **B** | **Y** |
| 0 | 0 | 0 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | **1** |

# 🧪 **Testbench**

```verilog

module or_gate_tb;

     reg A;
     reg B;
     wire Y;

     or_gate DUT(
        .A(A),
        .B(B),
        .Y(Y)
    );

    initial begin
        $dumpfile("or_gate.vcd");
        $dumpvars(0, or_gate_tb);

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

        #10;

        $finish;
    end 
endmodule             

```

# 🔷 **RTL Schematics**

![OR Gate RTL Schematic](rtl-schematic.png)

# 📈 **Simulation Result**
![OR Gate Waveform](waveform.png)

# ◈ **Verification Summary**

| **Test Case** | **Expected Output** | **Status** |
|:---|:---:|:---:|
| `A=0, B=0` | `y=0` | **PASS** |
| `A=0, B=1` | `y=1` | **PASS** |
| `A=1, B=0` | `y=1` | **PASS** |
| `A=1, B=1` | `y=1` | **PASS** |

**Verification Result:** `4/4 TEST CASES PASSED`
