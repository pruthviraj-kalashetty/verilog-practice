# ◈ **Verilog RTL code** 

```verilog

module traffic_light_controller #(
    parameter GREEN_CYCLE = 5,
    parameter YELLOW_CYCLE = 2,
    parameter RED_CYCLE = 1
)
(
    input clk,
    input reset,

    output reg [2:0] north_south,
    output reg [2:0] east_west
);

//Light Encoding
localparam [2:0] RED = 3'b100;
localparam [2:0] YELLOW = 3'b010;
localparam [2:0] GREEN = 3'b001;

// FSM State Encoding
localparam [2:0] NS_GREEN = 3'd0;
localparam [2:0] NS_YELLOW = 3'd1; 
localparam [2:0] ALL_RED_TO_EW = 3'd2;
localparam [2:0] EW_GREEN = 3'd3;
localparam [2:0] EW_YELLOW =3'd4;
localparam [2:0] ALL_RED_TO_NS = 3'd5;

// Internal Registers
reg [2:0] state;
reg [2:0] next_state;
reg [3:0] count;

// 1. State Register + counter
always @(posedge clk) begin

    if (reset) begin
        state <= NS_GREEN;
        count <= 4'd0;
    end

    else begin
        state <= next_state;

        if (state == NS_GREEN) begin
            if (count == GREEN_CYCLE - 1)
                count <= 4'd0;
            else
                count <= count + 4'd1;
        end

        else if (state == NS_YELLOW) begin
            if (count == YELLOW_CYCLE - 1)
                count <= 4'd0;
            else
                count <= count + 4'd1;
        end

        else if (state == ALL_RED_TO_EW) begin
            if (count == RED_CYCLE - 1)
                count <= 4'd0;
            else
                count <= count + 4'd1;
        end

        else if (state == EW_GREEN) begin
            if (count == GREEN_CYCLE - 1)
                count <= 4'd0;
            else
                count <= count + 4'd1;
        end

        else if (state == EW_YELLOW) begin
            if (count == YELLOW_CYCLE - 1)
                count <= 4'd0;
            else
                count <= count + 4'd1;
        end

        else if (state == ALL_RED_TO_NS) begin
            if (count == RED_CYCLE - 1)
                count <= 4'd0;
            else
                count <= count + 4'd1;
        end

        else begin
            count <= 4'd0;
        end
    end

end

// 2. Next State Logic
always @(*) begin
    case (state)
      
        NS_GREEN: begin
            if (count == GREEN_CYCLE -1)
                next_state = NS_YELLOW;
            else 
                next_state = NS_GREEN;
        end              
      
        NS_YELLOW: begin
            if (count == YELLOW_CYCLE -1)
                next_state = ALL_RED_TO_EW;
            else      
                next_state = NS_YELLOW;
        end      

        ALL_RED_TO_EW: begin
            if (count == RED_CYCLE -1)
                next_state = EW_GREEN;
            else
                next_state = ALL_RED_TO_EW;
        end          

        EW_GREEN: begin
            if (count == GREEN_CYCLE -1)
               next_state = EW_YELLOW;
            else
               next_state = EW_GREEN;
        end

        EW_YELLOW: begin
            if (count == YELLOW_CYCLE -1)
                next_state = ALL_RED_TO_NS;
            else
                next_state = EW_YELLOW;
        end

        ALL_RED_TO_NS: begin 
            if (count == RED_CYCLE -1)
                next_state = NS_GREEN;
            else
                next_state = ALL_RED_TO_NS;
        end

        default: begin
            next_state = NS_GREEN;
        end    
    endcase
end

//3. Output Logic
always @(*) begin
    case (state)

        NS_GREEN: begin
            north_south = GREEN;
            east_west = RED;
        end     

        NS_YELLOW: begin
            north_south = YELLOW;
            east_west = RED;
        end            

        ALL_RED_TO_EW: begin
            north_south = RED;
            east_west = RED;
        end    

        EW_GREEN: begin
            north_south = RED;
            east_west = GREEN;
        end    

        EW_YELLOW: begin
            north_south = RED;
            east_west = YELLOW;
        end    

        ALL_RED_TO_NS: begin
            north_south = RED;
            east_west = RED;
        end   

        default: begin
            north_south = RED;
            east_west = RED;
        end
    endcase
end
endmodule
```

# 🧪 **Testbench**

```verilog

`timescale 1ns/1ps

module traffic_light_controller_tb;
  
  // Testbench Signals
  reg clk;
  reg reset;
  
  // DUT Output Signals
  wire [2:0] north_south;
  wire [2:0] east_west;

  // DUT Connetions
  traffic_light_controller dut(
    .clk(clk),
    .reset(reset),
    .north_south(north_south),
    .east_west(east_west)
  );

// Clock Generation
initial begin 
    clk = 1'b0;
    forever #5 clk = ~clk;
end    

// Reset
initial begin
    reset = 1'b1;
    #10
    reset = 1'b0;
end    

// Waveform dump
initial begin
    $dumpfile("traffic_light_controller.vcd");
    $dumpvars(0, traffic_light_controller_tb);
end 

//End simulation
initial begin 
    #100;
    $finish;
end

endmodule
```

# Simulation and Verification Process

Behavioral simulation for the Traffic Light Controller is executed using **Icarus Verilog** (`iverilog`), followed by waveform inspection and debugging in **GTKWave**. This verification pipeline ensures that the Finite State Machine (FSM), timing counters, and output light encoders meet all functional requirements prior to FPGA synthesis.

---

## 🛠️ Step-by-Step Simulation Workflow

Follow the commands below to compile the source files, execute the simulation runtime, and visualize the output waveforms:

### 1. Compile the RTL and Testbench
Combine the main design module and the verification testbench into a compiled simulation executable using `iverilog`.

```bash
iverilog -o traffic_light_controller_sim traffic_light_controller.v traffic_light_controller_tb.v
```
# 🔷 **RTL Schematics**

![mealy-FSM RTL Schematic](rtl-schematic.png)

# 📈 **Simulation Result**
![mealy-FSM waveform](waveform.png)
