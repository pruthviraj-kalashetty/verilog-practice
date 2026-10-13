`timescale 1ns/1ps

module seven_segment_display_tb;
  reg [1:0] floor_display;
  wire [6:0] segments;

  seven_segment_display dut(
    .floor_display(floor_display),
    .segments(segments)
  );
  
  initial begin
     $dumpfile("04_seven_segment_display.vcd");
     $dumpvars(0, seven_segment_display_tb);

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
