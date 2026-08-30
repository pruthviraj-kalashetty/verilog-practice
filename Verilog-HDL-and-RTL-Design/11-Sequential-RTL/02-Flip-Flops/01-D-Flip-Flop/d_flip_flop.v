module d_flip_flop(

    input D, CLK,
    output reg Q,
    output Q_bar

);

assign Q_bar = ~Q;

  always @(posedge CLK) begin
    Q <= D;

  end
endmodule    
