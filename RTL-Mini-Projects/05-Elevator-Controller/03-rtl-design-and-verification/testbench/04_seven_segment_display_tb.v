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
     
    // Test Sequence: Floor 0
     floor_display = 2'b00;
     #10;
     if (segments == 7'b1111110)
       $display("PASS: Floor 0 display");
     else
       $display("FAIL: Floor 0 display, segments=%b", segments);

     // Test Sequence: Floor 1
     floor_display = 2'b01;
     #10;
     if (segments == 7'b0110000)
       $display("PASS: Floor 1 display");
     else
       $display("FAIL: Floor 1 display, segments=%b", segments);

     // Test Sequence: Floor 2
     floor_display = 2'b10;
     #10;
     if (segments == 7'b1101101)
       $display("PASS: Floor 2 display");
     else
       $display("FAIL: Floor 2 display, segments=%b", segments);

     // Test Sequence: Invalid floor
     floor_display = 2'b11;
     #10;
     $display("INFO: Invalid floor output, segments=%b", segments);

     $finish;
    end    
endmodule
