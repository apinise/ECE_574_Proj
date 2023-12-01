module mult12x12 (
    input  logic [11:0]      Din,
    input  logic [11:0]      Coeff,
    output logic [23:0]      Product
);

  localparam XOR_VAL = 12'hFFF;

  logic [23:0]        r;
  logic [11:0][23:0]  next_r;
  logic [23:0] 	      next_r2;
  logic [11:0]        b;

  genvar i;
  generate
    for (i=0; i < 12; i++) begin
      assign next_r[i] = (b[i] == 1) ? (Din << i) : 24'd0;
    end
  endgenerate
  
  always_comb begin
    if (Coeff[11]) begin
      b = (Coeff ^ XOR_VAL) + 12'd1;
      Product = (next_r2 ^ XOR_VAL) + 12'd1;
    end
    else begin
      b = Coeff;
    end
  end
  
  always_comb begin
    next_r2 = next_r[0]+next_r[1]+next_r[2]+next_r[3]+next_r[4]+next_r[5]+next_r[6]
                +next_r[7]+next_r[8]+next_r[9]+next_r[10]+next_r[11];
  end
      
endmodule
