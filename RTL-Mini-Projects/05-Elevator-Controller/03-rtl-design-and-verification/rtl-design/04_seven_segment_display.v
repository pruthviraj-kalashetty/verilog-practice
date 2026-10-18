`timescale 1ns/1ps
// Seven Segment Display Module
module seven_segment_display(

    // Inputs and Output
    input wire [1:0] floor_display,
    output reg [6:0] segments
);

// Display Logic
always @(*) begin
    case (floor_display)
      2'b00: segments = 7'b1111110; // Floor 0 
      2'b01: segments = 7'b0110000; // Floor 1
      2'b10: segments = 7'b1101101; // Floor 2
      default: segments = 7'b0000000; // invalid flooor 

      endcase
end 
endmodule      
