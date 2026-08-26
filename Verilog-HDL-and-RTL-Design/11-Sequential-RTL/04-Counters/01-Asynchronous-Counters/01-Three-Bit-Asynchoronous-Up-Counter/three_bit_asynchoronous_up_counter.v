module async_3bit_up_counter(
    input clk,
    output reg [2:0] Q
);

always @(posedge clk) begin
    Q[0] <= ~Q[0];
end

always @(posedge clk Q[0]) begin
    Q[1] <= ~Q[1];
end

always @(posedge clk Q[1]) begin
    Q[2] <= Q[2];
end    
endmodule