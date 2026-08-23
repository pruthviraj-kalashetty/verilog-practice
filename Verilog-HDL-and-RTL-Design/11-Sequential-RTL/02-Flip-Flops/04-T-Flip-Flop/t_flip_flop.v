module t_flip_flop(

    input T, CLK,

    output reg Q,
    output Q_bar

);

assign Q_bar = ~Q;

always @(posedge CLK) begin

    if (T == 0)
        Q <= Q;

    else
        Q <= ~Q;

end

endmodule
