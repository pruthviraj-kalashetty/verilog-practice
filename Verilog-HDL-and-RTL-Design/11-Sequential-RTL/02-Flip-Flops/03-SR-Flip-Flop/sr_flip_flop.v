module sr_flip_flop(

    input S, R, CLK,

    output reg Q,
    output Q_bar

);

assign Q_bar = ~Q;

always @(posedge CLK) begin

    if (S == 0 && R == 0)
        Q <= Q;

    else if (S == 0 && R == 1)
        Q <= 0;

    else if (S == 1 && R == 0)
        Q <= 1;

    else
        Q <= 1'bx;

end

endmodule
