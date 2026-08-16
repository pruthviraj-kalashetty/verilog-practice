module mux_2to1(
    
    input I0,
    input I1,
    input S,
    output Y

);

wire w1, w2;

assign w1 = ( I0 & ~S);
assign w2 = ( I1 & S);

assign Y = w1 | w2;

endmodule