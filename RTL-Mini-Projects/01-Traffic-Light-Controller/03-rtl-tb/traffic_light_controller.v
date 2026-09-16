module traffic_light_controller #(
    parameter GREEN_CYCLE = 5,
    parameter YELLOW_CYCLE = 2,
    parameter RED_CYCLE = 1
)
(
    input clk,
    input reset,

    output reg [2:0] north_south,
    output reg [2:0] east_west
);

//Light Encoding
localparam [2:0] RED = 3'b100;
localparam [2:0] YELLOW = 3'b010;
localparam [2:0] GREEN = 3'b001;

// FSM State Encoding
localparam [2:0] NS_GREEN = 3'd0;
localparam [2:0] NS_YELLOW = 3'd1; 
localparam [2:0] ALL_RED_TO_EW = 3'd2;
localparam [2:0] EW_GREEN = 3'd3;
localparam [2:0] EW_YELLOW =3'd4;
localparam [2:0] ALL_RED_TO_NS = 3'd5;

// Internal Registers
reg [2:0] state;
reg [2:0] next_state;
reg [3:0] count;

// 1. State Register + counter
always @(posedge clk) begin

    if (reset) begin
        state <= NS_GREEN;
        count <= 4'd0;
    end

    else begin
        state <= next_state;

        if (state == NS_GREEN) begin
            if (count == GREEN_CYCLE - 1)
                count <= 4'd0;
            else
                count <= count + 4'd1;
        end

        else if (state == NS_YELLOW) begin
            if (count == YELLOW_CYCLE - 1)
                count <= 4'd0;
            else
                count <= count + 4'd1;
        end

        else if (state == ALL_RED_TO_EW) begin
            if (count == RED_CYCLE - 1)
                count <= 4'd0;
            else
                count <= count + 4'd1;
        end

        else if (state == EW_GREEN) begin
            if (count == GREEN_CYCLE - 1)
                count <= 4'd0;
            else
                count <= count + 4'd1;
        end

        else if (state == EW_YELLOW) begin
            if (count == YELLOW_CYCLE - 1)
                count <= 4'd0;
            else
                count <= count + 4'd1;
        end

        else if (state == ALL_RED_TO_NS) begin
            if (count == RED_CYCLE - 1)
                count <= 4'd0;
            else
                count <= count + 4'd1;
        end

        else begin
            count <= 4'd0;
        end
    end

end

// 2. Next State Logic
always @(*) begin
    case (state)
      
        NS_GREEN: begin
            if (count == GREEN_CYCLE -1)
                next_state = NS_YELLOW;
            else 
                next_state = NS_GREEN;
        end              
      
        NS_YELLOW: begin
            if (count == YELLOW_CYCLE -1)
                next_state = ALL_RED_TO_EW;
            else      
                next_state = NS_YELLOW;
        end      

        ALL_RED_TO_EW: begin
            if (count == RED_CYCLE -1)
                next_state = EW_GREEN;
            else
                next_state = ALL_RED_TO_EW;
        end          

        EW_GREEN: begin
            if (count == GREEN_CYCLE -1)
               next_state = EW_YELLOW;
            else
               next_state = EW_GREEN;
        end

        EW_YELLOW: begin
            if (count == YELLOW_CYCLE -1)
                next_state = ALL_RED_TO_NS;
            else
                next_state = EW_YELLOW;
        end

        ALL_RED_TO_NS: begin 
            if (count == RED_CYCLE -1)
                next_state = NS_GREEN;
            else
                next_state = ALL_RED_TO_NS;
        end

        default: begin
            next_state = NS_GREEN;
        end    
    endcase
end

//3. Output Logic
always @(*) begin
    case (state)

        NS_GREEN: begin
            north_south = GREEN;
            east_west = RED;
        end     

        NS_YELLOW: begin
            north_south = YELLOW;
            east_west = RED;
        end            

        ALL_RED_TO_EW: begin
            north_south = RED;
            east_west = RED;
        end    

        EW_GREEN: begin
            north_south = RED;
            east_west = GREEN;
        end    

        EW_YELLOW: begin
            north_south = RED;
            east_west = YELLOW;
        end    

        ALL_RED_TO_NS: begin
            north_south = RED;
            east_west = RED;
        end   

        default: begin
            north_south = RED;
            east_west = RED;
        end
    endcase
end
endmodule
