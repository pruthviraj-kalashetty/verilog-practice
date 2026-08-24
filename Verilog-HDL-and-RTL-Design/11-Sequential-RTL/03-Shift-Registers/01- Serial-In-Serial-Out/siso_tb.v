module siso_tb;
   reg CLK, clear, SI;
   wire SO;

   siso DUT(
    .CKL(CLK),
    .clear(clear),
    .SI(SI).
    .SO(SO)
   );

   
   