module d_latch_tb;
  reg D, EN;

  wire Q;
  wire Q_bar;

  d_latch DUT(
    .D(D),
    .EN(EN),
    .Q(Q),
    .Q_bar(Q_bar)    
  );

  initial begin
    $dumpfile("d_latch");
    $dumpvars(0, d_latch_tb);

    EN = 0;
    D = 0;

    #10;

    EN = 1;
    D = 0;

    #10;

    EN = 1;
    D = 1;

    #10;

    $finish;
  end
endmodule    
