module sipo(
    input CLK,
    input clear,
    input SI,
    output reg [3:0] Q
);

    
   
    always @(posedge CLK) begin
        if (clear == 1) begin
          Q <= 4'b0000;
        end

        else begin
          Q <= {SI, Q[3:1]};
        end   

    end

endmodule    
