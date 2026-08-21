module four_bit_comparator(

    input A0, A1, A2, A3,
    input B0, B1, B2, B3,

    output reg A_greater_B,
    output reg A_equal_B,
    output reg A_less_B

);

always @(*) begin

    if ({A3, A2, A1, A0} > {B3, B2, B1, B0}) begin

        A_greater_B = 1;
        A_equal_B = 0;
        A_less_B = 0;

    end

    else if ({A3, A2, A1, A0} == {B3, B2, B1, B0}) begin

        A_greater_B = 0;
        A_equal_B = 1;
        A_less_B = 0;

    end

    else begin

        A_greater_B = 0;
        A_equal_B = 0;
        A_less_B = 1;

    end

end

endmodule