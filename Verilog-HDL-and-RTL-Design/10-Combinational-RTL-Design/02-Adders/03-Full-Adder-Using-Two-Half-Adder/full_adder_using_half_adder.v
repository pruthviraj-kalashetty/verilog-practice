module full_adder_using_half_adder(

    input A,
    input B,
    input Cin,
    output sum,
    output carry

);

wire w1, w2, w3;

assign w1 = A ^ B;
assign w2 = A & B;

assign sum = w1 ^ Cin;

assign w3 = w1 & Cin;
assign carry = w3 | w2;

endmodule