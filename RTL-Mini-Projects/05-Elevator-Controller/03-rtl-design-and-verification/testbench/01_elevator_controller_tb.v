`timescale 1ns/1ps

module elevator_controller_tb;

    reg clk;
    reg reset;
    reg [1:0] floor_request;
    reg emergency_stop;

    wire [1:0] current_floor;
    wire move_up;
    wire move_down;
    wire door_open;
    wire [1:0] floor_display;
    wire emergency_active;
   
    // DUT Instantiation
    elevator_controller DUT(
        .clk(clk),
        .reset(reset),
        .floor_request(floor_request),
        .emergency_stop(emergency_stop),
        .current_floor(current_floor),
        .move_up(move_up),
        .move_down(move_down),
        .door_open(door_open),
        .floor_display(floor_display),
        .emergency_active(emergency_active)
    );
    
    // Clock Generation
    initial begin
       clk = 1'b0;
       forever #5 clk = ~clk;
    end   

    // Test Sequence
    initial begin
        
        reset = 1'b1;
        floor_request = 2'b00;
        emergency_stop = 1'b0;

        #20;
        reset = 1'b0;

        #10;

        if(current_floor == 2'b00 &&
           move_up == 1'b0 &&
           move_down == 1'b0 &&
           door_open == 1'b0) begin

           $display("PASS: Elevator reset correctly");
        end
        else begin

           $display("FAIL: Elevator reset test failed");
        end      

        floor_request = 2'b10;

        wait (door_open == 1'b1);

        
        if (current_floor == 2'b10 &&
            move_up == 1'b0 &&
            move_down == 1'b0) begin

            $display("PASS: Elevator reached Floor 2");
        end
        else begin
            $display("FAIL: Elevator did not reach Floor 2");
        end

        $finish;
    end    
    
        initial begin
          #1000;
          $display("FAIL: Simulation timeout");
          $finish;
        end  
       initial begin
         $dumpfile("01_elevator_controller.vcd");
         $dumpvars(0, elevator_controller_tb);
        end   
endmodule    