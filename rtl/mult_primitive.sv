module mult_primitive (
  input   logic signed  [12:0]  Din,
  input   logic signed  [11:0]  Coeff,
  output  logic signed  [24:0]  Product
);

always_comb begin
  Product = $signed(Din) * $signed(Coeff);
end

endmodule