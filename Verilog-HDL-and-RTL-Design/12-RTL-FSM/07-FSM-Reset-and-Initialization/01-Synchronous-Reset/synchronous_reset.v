module synchronous_reset(
    input clk,
    input reset,
    input x,
    output reg y
);

reg state;
reg next_state;

initial begin
    state = 0;
end

// Process 1: State Register
always @(posedge clk) begin
    if (reset)
        state <= 0;
    else
        state <= next_state;
end

// Process 2: Next-State Logic
always @(*) begin
    if (state == 0) begin
        if (x == 0)
            next_state = 0;
        else
            next_state = 1;
    end
    else begin
        if (x == 0)
            next_state = 0;
        else
            next_state = 1;
    end
end

// Process 3: Output Logic
always @(*) begin
    if (state == 1)
        y = 1;
    else
        y = 0;
end

endmodule
