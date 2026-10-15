`timescale 1ns/1ps

// Floor Request Handler Testbench
module floor_request_handler_tb;
   
   // Inputs and Outputs
   reg clk;
   reg reset;
   reg [1:0] floor_request;
   reg accept_request;
   reg clear_request;

   wire [1:0] requested_floor;
   wire request_valid;
   
   // DUT Instantiation
   floor_request_handler DUT(
     .clk(clk),
     .reset(reset),
     .floor_request(floor_request),
     .accept_request(accept_request),
     .clear_request(clear_request),
     .requested_floor(requested_floor),
     .request_valid(request_valid)
    );

    // Clock Generation
    initial begin
       clk = 0;
       forever #5 clk = ~clk;
    end

    // Test Sequence
    initial begin
      reset = 1;
      accept_request = 0;
      clear_request = 0;
      floor_request = 2'b00;
   
      // Reset the handler
      #20;
      reset = 0;
      
      #10;
      floor_request = 2'b01;
      accept_request = 1;

      #10;
      accept_request = 0;

      if (requested_floor == 2'b01 && request_valid == 1'b1)
          $display("PASS: Floor 1 request accepted");
      else 
          $display("FAIL: Floor 1 request not accepted"); 
      
      #10;
      floor_request = 2'b11;
      accept_request = 1;

      #10;
      accept_request = 0;

      if (requested_floor == 2'b01 && request_valid == 1'b1)
          $display("PASS: Invalid request ignored");
      else
          $display("FAIL: Invalid request changed stored values");    
      
      #10;
      clear_request = 1;

      #10;
      clear_request = 0;

      if (requested_floor == 2'b00 && request_valid == 1'b0)
          $display("PASS: Request cleared");
      else      
          $display("FAIL: Request clear failed");
      
      // End Simulation
      #10;
      $finish;
    end
    
    // Waveform Dump
    initial begin 
       $dumpfile("02_floor_request_handler.vcd");
       $dumpvars(0, floor_request_handler_tb);
    end           
endmodule
