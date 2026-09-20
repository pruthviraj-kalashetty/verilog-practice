module digital_stopwatch #(
    parameter integer SUBSEC_CYCLES = 100,
    parameter integer MAX_MINUTES = 100
)(
    input clk,
    input reset,
    input start,

    output reg [7:0] minutes,
    output reg [5:0] seconds,
    output reg [6:0] subseconds
);

always @(posedge clk) begin
   if (reset) begin 
       minutes <= 8'd0;
       seconds <= 6'd0;
       subseconds <= 7'd0;
    end

   else if (start) begin
       if (subseconds == SUBSEC_CYCLES -1) begin
           subseconds <= 7'd0;

           if (seconds == 59) begin
               seconds <= 6'd0;

               if (minutes == MAX_MINUTES)
                  minutes <= 8'd0;
               else 
                  minutes <= minutes + 1;   
            end

            else begin
                seconds <= seconds + 1;
            end
        end 
        else begin
            subseconds <= subseconds + 1;
        end
    end 
end
endmodule 


