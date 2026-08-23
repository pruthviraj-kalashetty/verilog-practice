module jk_flip_flop(

    input J, K, CLK,
    output reg Q,
    output Q_bar

);

assign Q_bar = ~Q;

always @(posedge CLK) begin

    if (J == 0 && K == 0)
         Q <= Q;

    else if (J == 0 && K == 1)
         Q <= 0;

    else if (J == 1 && K == 0)
         Q <= 1;

    else 
         Q <= ~Q;

end 
endmodule                        
