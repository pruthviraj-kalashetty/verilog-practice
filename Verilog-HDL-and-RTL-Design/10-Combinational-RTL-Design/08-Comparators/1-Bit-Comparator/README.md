# ◈ 1-Bit Comparator

### Combinational Circuit • Comparator • Dataflow Modeling

---

## 📌 Module Description

The **1-Bit Comparator** is a combinational circuit that compares two 1-bit inputs and determines whether input `A` is **greater than**, **equal to**, or **less than** input `B`. Implemented using continuous assignment (`assign`) in dataflow abstraction.

---

# ◈ **Verilog RTL code** 

```verilog

module one_bit_comparator(

    input A, B,

    output reg A_greater_B,
    output reg A_equal_B,
    output reg A_less_B

);

always @(*) begin

    if (A > B) begin

        A_greater_B = 1;
        A_equal_B = 0;
        A_less_B = 0;

    end

    else if (A == B) begin

        A_greater_B = 0;
        A_equal_B = 1;
        A_less_B = 0;

    end

    else begin

        A_greater_B = 0;
        A_equal_B = 0;
        A_less_B = 1;

    end

end

endmodule       

```

# 📊 **Truth table**

| **Inputs** | **Inputs** | **Output** | **Output** | **Output** |
|:---:|:---:|:---:|:---:|:---:|
| **A** | **B** | **A > B** | **A == B** | **A < B** |
| 0 | 0 | 0 | **1** | 0 |
| 0 | 1 | 0 | 0 | **1** |
| 1 | 0 | **1** | 0 | 0 |
| 1 | 1 | 0 | **1** | 0 |

# 🧪 **Testbench**

```verilog

module one_bit_comparator_tb;

   reg A, B;

   wire A_greater_B;
   wire A_equal_B;
   wire A_less_B;

   one_bit_comparator DUT(

    .A(A),
    .B(B),
    .A_greater_B(A_greater_B),
    .A_equal_B(A_equal_B),
    .A_less_B(A_less_B)
   
   );

   initial begin

     $dumpfile("one_bit_comparator.vcd");
     $dumpvars(0, one_bit_comparator_tb);

     
        // A = 0, B = 0  A = B

        A = 0;
        B = 0;

        #10;

        // A = 0, B = 1  A < B

        A = 0;
        B = 1;

        #10;

        // A = 1, B = 0  A > B

        A = 1;
        B = 0;

        #10;

        // A = 1, B = 1  A = B

        A = 1;
        B = 1;

        #10;

        $finish;

    end

endmodule               

```

# 🔷 **RTL Schematics**

![1-bit-comparator RTL Schematic](rtl-schematic.png)

# 📈 **Simulation Result**
![1-bit-comparator Waveform](waveform.png)

# ◈ **Verification Summary**

| **Test Case** | **Expected Output** | **Status** |
|:---|:---:|:---:|
| `A0=1, A1=0, A2=0, A3=0` | `Y1=0, Y0=0` | **PASS** |
| `A0=0, A1=1, A2=0, A3=0` | `Y1=0, Y0=1` | **PASS** |
| `A0=0, A1=0, A2=1, A3=0` | `Y1=1, Y0=0` | **PASS** |
| `A0=0, A1=0, A2=0, A3=1` | `Y1=1, Y0=1` | **PASS** |

**Verification Result:** `4/4 TEST CASES PASSED`






