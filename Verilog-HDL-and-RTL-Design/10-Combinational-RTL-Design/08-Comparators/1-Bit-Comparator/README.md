# ◈ 4-to-2 Encoder 

### Combinational Circuit • Encoder • Dataflow Modeling

---

## 📌 Module Description

The **4-to-2 Encoder** is a combinational circuit that converts **4 input lines** into **2 output lines**, where the binary output represents the position of the active input. Implemented using continuous assignment (`assign`) in dataflow abstraction.

---

# ◈ **Verilog RTL code** 

```verilog

module encoder_4to2(

    input [3:0] A,
    output reg [1:0] Y

);

always @(*) begin

    case (A)

        4'b0001: Y = 2'b00;
        4'b0010: Y = 2'b01;
        4'b0100: Y = 2'b10;
        4'b1000: Y = 2'b11;

        default: Y = 2'b00;

    endcase

end

endmodule       

```

# 📊 **Truth table**

| **Inputs** | **Inputs** | **Inputs** | **Inputs** | **Output** | **Output** |
|:---:|:---:|:---:|:---:|:---:|:---:|
| **A0** | **A1** | **A2** | **A3** | **Y1** | **Y0** |
| 1 | 0 | 0 | 0 | 0 | 0 |
| 0 | 1 | 0 | 0 | 0 | 1 |
| 0 | 0 | 1 | 0 | 1 | 0 |
| 0 | 0 | 0 | 1 | **1** | **1** |

# 🧪 **Testbench**

```verilog

module encoder_4to2_tb;

    reg [3:0] A;
    wire [1:0] Y;

    encoder_4to2 DUT(
        .A(A),
        .Y(Y)
    );

    initial begin

        $dumpfile("encoder_4to2.vcd");
        $dumpvars(0, encoder_4to2_tb);

        A = 4'b0001;
        #10;

        A = 4'b0010;
        #10;

        A = 4'b0100;
        #10;

        A = 4'b1000;
        #10;

        $finish;

    end

endmodule              

```

# 🔷 **RTL Schematics**

![encoder_4to2 RTL Schematic](rtl-schematic.png)

# 📈 **Simulation Result**
![encoder_4to2 Waveform](waveform.png)

# ◈ **Verification Summary**

| **Test Case** | **Expected Output** | **Status** |
|:---|:---:|:---:|
| `A0=1, A1=0, A2=0, A3=0` | `Y1=0, Y0=0` | **PASS** |
| `A0=0, A1=1, A2=0, A3=0` | `Y1=0, Y0=1` | **PASS** |
| `A0=0, A1=0, A2=1, A3=0` | `Y1=1, Y0=0` | **PASS** |
| `A0=0, A1=0, A2=0, A3=1` | `Y1=1, Y0=1` | **PASS** |

**Verification Result:** `4/4 TEST CASES PASSED`






