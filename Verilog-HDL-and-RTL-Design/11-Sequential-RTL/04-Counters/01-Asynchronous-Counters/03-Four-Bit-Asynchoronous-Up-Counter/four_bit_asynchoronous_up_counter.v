module async_4bit_up_counter(
    input clk,
    output reg [3:0] Q
);

initial begin 
   Q = 4'b0000;
end

always @(posedge clk) begin
   Q[0] <= ~Q[0];
end

always @(negedge Q[0]) begin
   Q[1] <= ~Q[1];
end

always @(negedge Q[1]) begin
   Q[2] <= ~Q[2];
end

always @(negedge clk Q[2]) begin
   Q[3] <= ~Q[3];
end

endmodule
