module one_hot_encoding(
    input clk,
    input x,
    output reg y
);

reg [3:0] state;
reg [3:0] next_state;

initial begin
    state = 4'b0001;
end

always @(posedge clk) begin
    state <= next_state;
end

always @(*) begin
    if (state == 4'b0001) begin
        if (x == 0)
            next_state = 4'b0001;
        else
            next_state = 4'b0010;
    end
    else if (state == 4'b0010) begin
        if (x == 0)
            next_state = 4'b0100;
        else
            next_state = 4'b0010;
    end
    else if (state == 4'b0100) begin
        if (x == 0)
            next_state = 4'b0001;
        else
            next_state = 4'b1000;
    end
    else begin
        if (x == 0)
            next_state = 4'b0100;
        else
            next_state = 4'b0001;
    end
end

always @(*) begin
    if (state == 4'b1000)
        y = 1;
    else
        y = 0;
end

endmodule
