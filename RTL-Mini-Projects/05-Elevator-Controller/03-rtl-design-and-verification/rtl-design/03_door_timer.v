`timescale 1ns/1ps
// Door Timer Module
module door_timer #(

    parameter DOOR_OPEN_CYCLE = 16
)(    
    // Inputs and Output
    input wire clk,
    input wire reset,
    input wire door_timer_start,
    input wire door_timer_clear,
    output reg door_timer_done
);
    // Internal Registers
    reg [31:0] timer_count;
    
    // Timer Logic
    always @(posedge clk) begin
       if (reset) begin
           timer_count <= 0;
           door_timer_done <= 0;
        end

        else if (door_timer_clear) begin
           timer_count <= 0;
           door_timer_done <= 0;
        end

        else if (door_timer_start && !door_timer_clear) begin
            if (timer_count  == DOOR_OPEN_CYCLE -1 ) begin
             door_timer_done <= 1;
            end

            else begin 
              timer_count <= timer_count +1 ;
            end  
        end       
    end
endmodule     
