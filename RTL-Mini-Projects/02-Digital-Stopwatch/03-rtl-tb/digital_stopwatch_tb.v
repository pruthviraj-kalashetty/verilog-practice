module digital_stopwatch_tb;

    // Testbench input signals
    reg clk;
    reg reset;
    reg start;
    
    //DUT output signals
    wire [7:0] minutes;
    wire [5:0] seconds;
    wire [6:0] subseconds;
 
    // Connect testbench to DUT
    digital_stopwatch dut(
        .clk(clk),
        .reset(reset),
        .start(start),
        .minutes(minutes),
        .seconds(seconds),
        .subseconds(subseconds)
    );
  // Generate clock
  initial begin 
    clk = 1'b0;
    forever #5 clk = ~ clk;
  end

  // Create waveform file
  initial begin
      $dumpfile("digital_stopwatch.vcd");
      $dumpvars(0, digital_stopwatch_tb);
  end

  // Stop simulation
  initial begin 
    reset = 1'b1;
    start = 1'b0;

    #10;

    reset = 1'b0;
    start = 1'b1;
    
      #100;
      $finish;
  end
endmodule     