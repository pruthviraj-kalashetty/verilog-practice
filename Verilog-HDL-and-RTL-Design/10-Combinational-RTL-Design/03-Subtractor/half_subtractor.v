module half_subtractor(

    input A,
    input B,
    output difference,
    output borrow

);

wire w1;

assign difference = A ^ B;
assign w1 = ~A;
assign borrow = w1 & B;

endmodule
