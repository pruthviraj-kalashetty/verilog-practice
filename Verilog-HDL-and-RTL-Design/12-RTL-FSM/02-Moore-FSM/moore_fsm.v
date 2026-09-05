module moore_fsm(
    input clk,
    input x,
    output reg y
);

reg state;
reg next state;

// State 
always @(posedge clk) begin
   state <= next state;
end

// Next State
always @(*) begin
   if (state == 0) begin //state = S0
      if(x == 0)
         next_state = 0;
      else
         next_state = 1;   // Next State = S1
    end
    else begin
      if (x == 0)
         next_state = 0;
      else
         next_state = 1;
    end
end

//output
always @(*) begin
   if (state == 0)
       y = 0;
    else   
       y = 1;
end
endmodule       