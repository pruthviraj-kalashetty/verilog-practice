module sr_latch(
    input S, R,

    output reg Q

);

    assign @(*) begin
      
      if (S)
        Q = 1'b1;

      else if (R)
        Q = 1'b0;
    end
endmodule          