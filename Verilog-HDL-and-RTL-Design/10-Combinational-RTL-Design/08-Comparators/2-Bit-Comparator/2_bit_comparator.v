module 2_bit_comparator(
    input A0, A1, B0, B1,
    output reg A_greater_B,
    output reg A_equal_B,
    output reg A_less_B 
);

always @(*) begin
      
    if ({A1, A0} > {B1, B0}) begin

         A_greater_B = 1;
         A_equal_B = 0;
         A_less_B = 0;

    end

    else if ({A1, A0} == {B1, B0}) begin

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