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

       #10;
       door_timer_start = 1;

       #170;
       door_timer_start = 0;
     

       if (door_timer_done == 1) 
         $display("PASS: Door timer completed");
       else 
         $display("FAIL: Door timer did not complete");   
       
       #10;
       door_timer_clear = 1;

       #10;
       door_timer_clear = 0;

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

