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

        @(negedge clk); 
        floor_request = 2'b11;

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

        // Test downward movement: Floor 2 to Floor 0
        wait (DUT.current_state == DUT.IDLE);
        @(negedge clk);
        floor_request = 2'b00;

        repeat (25) begin
            @(posedge clk);
            #1;
            $display("DOWN TEST: floor=%b up=%b down=%b state=%b valid=%b target=%b",
               current_floor, move_up, move_down,
               DUT.current_state, DUT.request_valid,
               DUT.requested_floor);
            end
            
                    // Check: Elevator returned to Floor 0
        if (current_floor == 2'b00 &&
            move_up == 1'b0 &&
            move_down == 1'b0) begin
            $display("PASS: Elevator returned to Floor 0");
        end else begin
            $display("FAIL: Elevator did not return to Floor 0");
        end

                // Test: Move from Floor 0 to Floor 1
        @(negedge clk);
        floor_request = 2'b11;

        // Allow the previous request to clear
         
        wait (DUT.current_state == DUT.IDLE);
        wait (DUT.request_valid == 1'b0);
        @(negedge clk);

        floor_request = 2'b01;

        @(posedge clk);
        #1;
        $display("FLOOR 1 REQUEST CHECK: req=%b accept=%b valid=%b target=%b state=%b",
                 floor_request, DUT.accept_request, DUT.request_valid,
                 DUT.requested_floor, DUT.current_state);

        repeat (10) begin
            @(posedge clk);
            #1;
            $display("FLOOR 1 TEST: floor=%b up=%b down=%b door=%b state=%b",
                     current_floor, move_up, move_down,
                     door_open, DUT.current_state);
        end

        @(negedge clk);
        floor_request = 2'b11;

        if (current_floor == 2'b01 &&
            move_up == 1'b0 &&
            move_down == 1'b0) begin
            $display("PASS: Elevator reached Floor 1");
        end else begin
            $display("FAIL: Elevator did not reach Floor 1");
        end

                // Test: Move from Floor 1 to Floor 2, then return to Floor 1
        @(negedge clk);
        floor_request = 2'b10;

        wait (current_floor == 2'b10);
        wait (DUT.current_state == DUT.IDLE);
        wait (DUT.request_valid == 1'b0);

        @(negedge clk);
        floor_request = 2'b01;

        wait (current_floor == 2'b01);
        wait (DUT.current_state == DUT.IDLE);

        @(negedge clk);
        floor_request = 2'b11;

        if (current_floor == 2'b01 &&
            move_up == 1'b0 &&
            move_down == 1'b0) begin
            $display("PASS: Elevator returned from Floor 2 to Floor 1");
        end else begin
            $display("FAIL: Elevator did not return to Floor 1");
        end

        // Reset before the emergency test
        @(negedge clk);
        reset = 1'b1;
        floor_request = 2'b11;

        repeat (2) @(negedge clk);
        reset = 1'b0;

        repeat (2) @(posedge clk);
        #1;
            

        // Test emergency stop during upward movement
        wait (DUT.current_state == DUT.IDLE);
        wait (DUT.request_valid == 1'b0);
        @(negedge clk);
        floor_request = 2'b10;

        wait (move_up == 1'b1);
        @(negedge clk);
        emergency_stop = 1'b1;

        repeat (2) begin
            @(posedge clk);
            #1;
            $display("EMERGENCY TEST: floor=%b up=%b down=%b emergency_active=%b state=%b",
                     current_floor, move_up, move_down,
                     emergency_active, DUT.current_state);
        end

        if (emergency_active == 1'b1 &&
            move_up == 1'b0 &&
            move_down == 1'b0) begin
            $display("PASS: Emergency stop activated during movement");
        end else begin
            $display("FAIL: Emergency stop response incorrect");
        end

        @(negedge clk);
        emergency_stop = 1'b0;

        repeat (3) begin
            @(posedge clk);
            #1;
            $display("AFTER RELEASE: floor=%b up=%b down=%b emergency_active=%b state=%b",
                     current_floor, move_up, move_down,
                     emergency_active, DUT.current_state);
        end
         

        // Test: New floor request is ignored during emergency
        @(negedge clk);
        floor_request = 2'b10;

        repeat (2) begin
            @(posedge clk);
            #1;
        end

               $display("EMERGENCY REQUEST CHECK: state=%b emergency_active=%b request_valid=%b target=%b up=%b down=%b",
                 DUT.current_state,
                 emergency_active,
                 DUT.request_valid,
                 DUT.requested_floor,
                 move_up,
                 move_down);

        if (DUT.current_state == DUT.EMERGENCY &&
            emergency_active == 1'b1 &&
            move_up == 1'b0 &&
            move_down == 1'b0) begin
            $display("PASS: Elevator remains stopped during emergency");
        end else begin
            $display("FAIL: Emergency state or stopped outputs are incorrect");
        end

        @(negedge clk);
        floor_request = 2'b11;

        // First, reset the controller to recover from emergency state
        @(negedge clk);
        reset = 1'b1;
        emergency_stop = 1'b0;
        floor_request = 2'b11;

        repeat (2) @(negedge clk);
        reset = 1'b0;

        // Allow the controller to settle
        repeat (2) @(posedge clk);
        #1;

        // Check that invalid request does not cause movement
        if (current_floor == 2'b00 &&
            move_up == 1'b0 &&
            move_down == 1'b0) begin
            $display("PASS: Invalid request does not cause movement");
        end else begin
            $display("FAIL: Invalid request caused unexpected behavior");
        end

        // Test 1: Request the current floor (Floor 0)
        @(negedge clk);
        floor_request = 2'b00;

        repeat (5) begin
            @(posedge clk);
            #1;
             $display("CURRENT FLOOR TEST: floor=%b up=%b down=%b door=%b state=%b timer_count=%0d timer_done=%b",
                     current_floor, move_up, move_down,
                     door_open, DUT.current_state,
                     DUT.door_timer_inst.timer_count,
                     DUT.door_timer_done);
        end

         @(negedge clk);
        floor_request = 2'b11;

        if (current_floor == 2'b00 &&
            move_up == 1'b0 &&
            move_down == 1'b0 &&
            door_open == 1'b1) begin
            $display("PASS: Current-floor request opened the door without movement");
        end else begin
            $display("CHECK: Current-floor request behavior needs inspection");
        end

        // Test 2: Wait for the door timer to finish
        repeat (20) begin
            @(posedge clk);
            #1;
            $display("DOOR CLOSE TEST: floor=%b door=%b state=%b timer_count=%0d timer_done=%b",
                     current_floor, door_open, DUT.current_state,
                     DUT.door_timer_inst.timer_count,
                     DUT.door_timer_done);
        end

        if (current_floor == 2'b00 &&
            move_up == 1'b0 &&
            move_down == 1'b0 &&
            door_open == 1'b0 &&
            DUT.current_state == DUT.IDLE) begin
            $display("PASS: Door closed and elevator returned to IDLE");
        end else begin
            $display("FAIL: Door did not close or controller did not return to IDLE");
        end

        $finish;
    end    
    
        initial begin
          #2000;
          $display("FAIL: Simulation timeout");
          $finish;
        end  
       initial begin
         $dumpfile("01_elevator_controller.vcd");
         $dumpvars(0, elevator_controller_tb);
        end   
endmodule    