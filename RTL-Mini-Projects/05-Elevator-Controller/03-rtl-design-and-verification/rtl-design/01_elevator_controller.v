`timescale 1ns/1ps
// Elevator Controller
module elevator_controller(

    // Inputs
    input clk,
    input reset,
    input [1:0] floor_request,
    input emergency_stop,

    // Outputs
    output reg [1:0] current_floor,
    output reg move_up,
    output reg move_down,
    output reg door_open,
    output wire [1:0] floor_display,
    output reg emergency_active
);

// Door Timer Configuration
parameter DOOR_OPEN_CYCLES = 16;

// FSM State Encoding
parameter IDLE = 3'b000,
          MOVE_UP = 3'b001,
          MOVE_DOWN = 3'b010,
          DOOR_OPEN = 3'b011,
          DOOR_TIMER = 3'b100,
          DOOR_CLOSE = 3'b101,
          EMERGENCY = 3'b110;

// Internal State Registers
reg [2:0] current_state;
reg [2:0] next_state;   

// Floor Request Handler Signals
wire [1:0] requested_floor;
wire request_valid;
reg accept_request;
reg clear_request;

// Door Timer Signals
reg door_timer_start;
reg door_timer_clear;
wire door_timer_done;

// Floor Request Handler Instance
floor_request_handler request_handler_inst(
    .clk(clk),
    .reset(reset),
    .floor_request(floor_request),
    .accept_request(accept_request),
    .clear_request(clear_request),
    .requested_floor(requested_floor),
    .request_valid(request_valid)
);

// Door Timer Instance
door_timer #(
    .DOOR_OPEN_CYCLE(DOOR_OPEN_CYCLES)
) door_timer_inst(
    .clk(clk),
    .reset(reset),
    .door_timer_start(door_timer_start),
    .door_timer_clear(door_timer_clear),
    .door_timer_done(door_timer_done)
);

// FSM Sequential Logic
always @(posedge clk) begin
    if (reset)
       current_state <= IDLE;
    else
       current_state <= next_state;    
end       

// FSM Next-State Logic
always @(*) begin
   next_state = current_state;

    if (emergency_stop) begin
      next_state = EMERGENCY;
    end
    else begin
       case (current_state)  

           IDLE: begin
              if (request_valid) begin
                 if (requested_floor == current_floor)
                    next_state = DOOR_OPEN;
                else if (requested_floor > current_floor)
                     next_state = MOVE_UP;
                else
                     next_state = MOVE_DOWN;      
                end
            end    

           MOVE_UP: begin
              if (current_floor >= requested_floor)
                next_state = DOOR_OPEN;
             else
                 next_state = MOVE_UP; 
            end

           MOVE_DOWN: begin
              if (current_floor <= requested_floor)
                next_state = DOOR_OPEN;
              else
                next_state = MOVE_DOWN;
            end

           DOOR_OPEN: begin
             next_state = DOOR_TIMER;
            end

           DOOR_TIMER: begin
             if (door_timer_done)
                next_state = DOOR_CLOSE;
             else
                next_state = DOOR_TIMER;
            end

           DOOR_CLOSE: begin
             next_state = IDLE;
            end

           EMERGENCY: begin
              next_state = EMERGENCY;
            end

           default: begin
              next_state = IDLE;
            end
        endcase
    end
end    

// Floor Movement Logic
always @(posedge clk) begin
    if (reset)
        current_floor <= 2'b00;
    else if (emergency_stop)
        current_floor <= current_floor;
    else begin
        case (current_state)

            MOVE_UP: begin
                if (current_floor < requested_floor)
                    current_floor <= current_floor + 1'b1;
            end

            MOVE_DOWN: begin
                if (current_floor > requested_floor)
                    current_floor <= current_floor - 1'b1;
            end

            default: begin
                current_floor <= current_floor;
            end

        endcase
    end
end

// Output Logic
always @(*) begin
    move_up = 1'b0;
    move_down = 1'b0;
    door_open = 1'b0;
    emergency_active = 1'b0;

    case (current_state)
      
       MOVE_UP: begin
          move_up = 1'b1;
        end

        MOVE_DOWN: begin
          move_down = 1'b1;
        end

        DOOR_OPEN, DOOR_TIMER: begin
          door_open = 1'b1;
        end

        EMERGENCY: begin
           emergency_active = 1'b1;
        end

        default: begin
        end
    endcase
end

// Floor Display Connection
assign floor_display = current_floor;

// Control Signal Logic
always @(*) begin
    accept_request = 1'b0;
    clear_request = 1'b0;
    door_timer_start = 1'b0;
    door_timer_clear = 1'b0;

    case (current_state)

        IDLE: begin
            if (!emergency_stop && !request_valid)
                accept_request = 1'b1;
        end

        DOOR_OPEN: begin
            door_timer_clear = 1'b1;
        end

        DOOR_TIMER: begin
            door_timer_start = 1'b1;
        end

        DOOR_CLOSE: begin
            door_timer_clear = 1'b1;
            clear_request = 1'b1;
        end

        default: begin
            // Keep all control signals inactive
        end

    endcase
end
endmodule