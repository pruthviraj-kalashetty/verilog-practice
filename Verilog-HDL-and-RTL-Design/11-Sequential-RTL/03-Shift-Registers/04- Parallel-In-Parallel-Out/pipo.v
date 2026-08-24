module pipo(
    input CLK,
    input clear,
    input [3:0] D,
    output reg [3:0] Q
);

always @(posedge CLK) begin

    if (clear == 1)
        Q <= 4'b0000;

    else
        Q <= D;

end

endmodule
