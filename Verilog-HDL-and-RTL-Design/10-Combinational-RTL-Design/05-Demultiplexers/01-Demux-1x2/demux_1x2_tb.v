module demux_1to2_tb.v;
    
    reg D;
    reg S;

    wire Y0;
    wire Y1;

    demux_1to2 DUT(.*);

    initial begin
      $dumpfile("demux_1to2.vcd");
      $dumpvars(0, demux_1to2_tb);

      // D = 0, S = 0 → Y0 = 0, Y1 = 0

        D = 0;
        S = 0;

        #10;

        // D = 0, S = 1 → Y0 = 0, Y1 = 0

        D = 0;
        S = 1;

        #10;

        // D = 1, S = 0 → D goes to Y0

        D = 1;
        S = 0;

        #10;

        // D = 1, S = 1 → D goes to Y1

        D = 1;
        S = 1;

        #10;

        $finish;

    end

endmodule

    
