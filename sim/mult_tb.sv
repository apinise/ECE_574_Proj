module mult_tb (
);

logic [11:0] din;
logic [11:0] coeff;
logic [23:0] out;

mult12x12 DUT (
  .Din(din),
  .Coeff(coeff),
  .Product(out)
);

initial begin
  din = 12'h010;
  coeff = 12'hFFD;
  #5;
  din = 12'h800;
  coeff = 12'hFFF;
  #5;
  din = 12'h800;
  coeff = 12'h00A;
  #5;
  $finish;
end

endmodule