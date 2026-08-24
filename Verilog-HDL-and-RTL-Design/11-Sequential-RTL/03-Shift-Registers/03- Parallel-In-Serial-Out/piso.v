module piso(
    input CLK,
    input clear,
    input load,
    input [3:0] P,
    output SO
);

reg [3:0] Q;

always @(posedge CLK) begin

    if (clear == 1)
        Q <= 4'b0000;

    else if (load == 1)
        Q <= P;

    else
        Q <= {Q[2:0], 1'b0};

end

assign SO = Q[3];

endmodule
