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
