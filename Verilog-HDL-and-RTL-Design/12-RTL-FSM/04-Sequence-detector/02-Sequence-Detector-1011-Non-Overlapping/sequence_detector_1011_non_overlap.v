module sequence_detector_1011_non_overlap(
    input clk,
    input x,
    output reg y
);

reg [2:0] state;
reg [2:0] next_state;

initial begin
    state = 3'b000;
end

always @(posedge clk) begin
  state <= next_state;
end

always @(*) begin
   if (state == 3'b000) begin
       if (x == 0)
         next_state = 3'b000;
       else 
         next_state = 3'b001;
   end

   else if (state == 3'b001) begin
      if (x == 0)
        next_state = 3'b010;
      else 
          next_state = 3'b001;
    end

    else if (state == 3'b010) begin
       if (x == 0)
          next_state = 3'b000;
        else 
          next_state = 3'b011;
    end             

    else if (state == 3'b011) begin
        if (x == 0)
           next_state = 3'b000;
        else 
           next_state = 3'b100;
    end

    else if (state == 3'b100) begin
        if (x == 0)
           next_state = 3'b000;
        else 
          next_state = 3'b000;
    end                        
end

always @(*) begin
    if (state == 3'b100)
        y = 1;
    else
        y = 0;
end

endmodule


  