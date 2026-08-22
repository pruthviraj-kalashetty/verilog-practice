module d_latch(
    input D, EN,

    output reg Q,
    output Q_bar

);

assign Q_bar = ~Q;

always @(*) begin
  
  if (EN)
     Q = D;

end
endmodule     
