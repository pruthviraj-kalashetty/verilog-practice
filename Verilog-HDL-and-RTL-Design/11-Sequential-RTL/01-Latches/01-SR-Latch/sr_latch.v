module sr_latch(
    input S, R,

    output reg Q,
    output Q_bar

);

assign Q_bar = ~Q;

    always @(*) begin
      
      if (S)
        Q = 1'b1;

      else if (R)
        Q = 1'b0;
        
    end
endmodule          