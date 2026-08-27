module async_4bit_down_counter(
    input clk,
    output reg [3:0] Q
);

initial begin
   Q = 4'b1111;
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

always @(posedge Q[2]) begin
    Q[3] <= ~Q[3];
end
endmodule