`timescale 1ns/1ps

// Door Timer Testbench
module door_timer_tb;

   // Inputs and Output
   reg clk;
   reg reset;
   reg door_timer_start;
   reg door_timer_clear;
   wire door_timer_done;


   // DUT Instantiation
   door_timer dut(
    .clk(clk),
    .reset(reset),
    .door_timer_start(door_timer_start),
    .door_timer_clear(door_timer_clear),
    .door_timer_done(door_timer_done)
   );
   
   // Clock Generation
    initial begin
      clk = 0;
      forever #5 clk =~ clk;
    end  

      // Test Sequence
      initial begin
       reset = 1;
       door_timer_start = 0;
       door_timer_clear = 0;

       #20;
       reset = 0;

       // Start the timer
       @(negedge clk);
       door_timer_start = 1;

       // Check that the timer is not done initially
       @(negedge clk);
       if (door_timer_done == 1'b0)
         $display("PASS: Timer starts without early completion");
       else
         $display("FAIL: Timer completed too early");

       // Keep the timer enabled for 16 rising clock edges
       repeat (16) @(posedge clk);
       #1;

       if (door_timer_done == 1'b1)
         $display("PASS: Timer completed after counting");
       else
         $display("FAIL: Timer did not complete after counting");

       // Stop the timer and clear it
       @(negedge clk);
       door_timer_start = 0;
       door_timer_clear = 1;

       @(negedge clk);
       door_timer_clear = 0;

       #1;
       if (door_timer_done == 1'b0)
         $display("PASS: Door timer cleared");
       else
         $display("FAIL: Door timer clear failed");

       $finish;
    end

    // Waveform Dump
    initial begin
       $dumpfile("03_door_timer.vcd");
       $dumpvars(0, door_timer_tb);
    end
endmodule        

