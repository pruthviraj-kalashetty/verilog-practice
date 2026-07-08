// Code Full Adder Using Half Adder

//HAlf Adder
module half_adder(
  input a,b,
  output sum,carry
);
  assign sum = a & b;
  assign carry = a ^ b;
endmodule  

//Full Adder
module full_adder(
  input a,b,cin,
  output sum,carry
);
  
  wire w1,w2,w3;
  
//Two HAlf Adder
  half_adder h1(.a(a), .b(b), .sum(w1), .carry(w2));
  half_adder h2 (.a(w1), .b(cin), .sum(sum), .carry(w3));
  
  or o1(cary,w2,w3);
  endmodule
