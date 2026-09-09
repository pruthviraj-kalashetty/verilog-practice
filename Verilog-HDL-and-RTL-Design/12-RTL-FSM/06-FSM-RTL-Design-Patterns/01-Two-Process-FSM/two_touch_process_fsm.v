module gray_encoding(
    input clk,
    input x,
    output reg y
);

reg [1:0] state;
reg [1:0] next_state;

initial begin
    state = 2'b00;
end

always @(posedge clk) begin
    state <= next_state;
end

always @(*) begin
    if (state == 2'b00) begin
        if (x == 0)
            next_state = 2'b00;
        else
            next_state = 2'b01;
    end
    else if (state == 2'b01) begin
        if (x == 0)
            next_state = 2'b11;
        else
            next_state = 2'b01;
    end
    else if (state == 2'b11) begin
        if (x == 0)
            next_state = 2'b00;
        else
            next_state = 2'b10;
    end
    else begin
        if (x == 0)
            next_state = 2'b11;
        else
            next_state = 2'b00;
    end
end

always @(*) begin
    if (state == 2'b10)
        y = 1;
    else
        y = 0;
end

endmodule
