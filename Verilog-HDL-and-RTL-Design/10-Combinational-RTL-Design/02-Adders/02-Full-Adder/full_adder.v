module full_adder(

    input A,
    input B,
    input Cin,
    output sum,
    output carry
    
);

wire w1, w2, w3, w4;

assign w1 = A ^ B;
assign sum = w1 ^ Cin;

assign w2 = A & B;
assign w3 = B & Cin;
assign w4 = A & Cin;

assign carry = w2 | w3 | w4;

endmodule