module demux_1to4(

    input D,
    input S1,S0,

    output reg Y3, Y2, Y1, Y0

);

always @(*) begin 
   case ({S1, S0})

   2'b00: begin
      Y0 = D;
      Y1 = 0;
      Y2 = 0;
      Y3 = 0;

   end

   2'b01: begin 
      Y0 = 0;
      Y1 = D;
      Y2 = 0;
      Y3 = 0;
   end

   2'b10: begin 
      Y0 = 0;
      Y1 = 0;
      Y2 = D;
      Y3 = 0;
   end

   2'b11: begin 
      Y0 = 0;
      Y1 = 0;
      Y2 = 0;
      Y3 = D;
   end   

   endcase
end
endmodule   
