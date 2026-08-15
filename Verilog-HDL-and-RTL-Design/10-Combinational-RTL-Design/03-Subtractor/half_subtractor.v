module half_subtractor(

    input A,
    input B,
    output difference,
    output borrow

);

wire w1;

assign difference = A ^ B;
assign w1 = ~A;
assign barrow = w1 & B ;

endmodule