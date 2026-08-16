module full_subtractor_using_two_half_subtractor(

    input A,
    input B,
    input Bin,
    output difference,
    output borrow

);

wire w1, w2, w3;

assign w1 = A ^ B;
assign difference = w1 ^ Bin;

assign w2 = ~A & B;
assign w3 = ~w1 & Bin;
assign borrow = w2 | w3;

endmodule