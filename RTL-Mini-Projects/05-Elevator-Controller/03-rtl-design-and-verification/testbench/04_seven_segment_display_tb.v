`timescale 1ns/1ps

// Seven Segment Display Testbench
module seven_segment_display_tb;
 
  // Inputs and Output
  reg [1:0] floor_display;
  wire [6:0] segments;

  // DUT Instantiation
  seven_segment_display dut(
    .floor_display(floor_display),
    .segments(segments)
  );

  // Waveform Dump
  initial begin
     $dumpfile("04_seven_segment_display.vcd");
     $dumpvars(0, seven_segment_display_tb);
     
     // Test Sequence
     floor_display = 2'b00;
     #10;

     floor_display = 2'b01;
     #10;

     floor_display = 2'b10;
     #10;

     floor_display = 2'b11;
     #10;

     $finish;
    end    
endmodule
