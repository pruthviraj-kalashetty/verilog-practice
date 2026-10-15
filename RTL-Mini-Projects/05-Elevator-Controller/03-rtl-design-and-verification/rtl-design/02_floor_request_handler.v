// Floor Request Module
module floor_request_handler(
    input clk,
    input reset,
    input [1:0] floor_request,
    input accept_request,
    input clear_request,
    output reg [1:0] requested_floor,
    output reg request_valid
);

    // Request Handler Logic
    always @(posedge clk) begin

       // Reset Logic
       if(reset) begin 
          requested_floor <= 2'b00;
          request_valid <= 1'b0;
        end

       // Clear Request Logic
       else if (clear_request) begin
          requested_floor <= 2'b00;
          request_valid <= 1'b0;
        end

       // Accept Request Logic
       else if (accept_request) begin
          if (floor_request != 2'b11) begin
             requested_floor <= floor_request;
             request_valid <= 1'b1;
            end
        end
    end
endmodule        

    


            
