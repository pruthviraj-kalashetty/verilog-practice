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
        floor_request = 2'b11;
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
        repeat (3) begin
           @(posedge clk);
           #1;
           $display("Time=%0t req=%b accept=%b valid=%b target=%b floor=%b state=%b",
                    $time, floor_request, DUT.accept_request,
                    DUT.request_valid, DUT.requested_floor,
                    current_floor, DUT.current_state);
        end

        repeat (20) begin
            @(posedge clk);
            #1;
            $display("Time=%0t floor=%b up=%b down=%b door=%b state=%b",
                    $time, current_floor, move_up, move_down,
                     door_open, DUT.current_state);
        end

        
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