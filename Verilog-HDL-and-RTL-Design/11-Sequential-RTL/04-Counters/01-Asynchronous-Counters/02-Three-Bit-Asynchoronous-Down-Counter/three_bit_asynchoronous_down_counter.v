module async_3bit_down_counter(
    input clk,
    output reg [2:0] Q
);

initial begin 
   Q = 3'b111;
end

always @(posedge clk) begin
   Q[0] <= ~Q[0];
end

always @(posedge Q[0]) begin
   Q[1] <= ~Q[1];
end

always @(posedge Q[1]) begin
   Q[2] <= ~Q[2];
end   
endmodule
