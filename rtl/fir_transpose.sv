module fir_transpose (
  input   logic Clk,
  input   logic Hlt,
  input   logic [11:0]  Din,
  output  logic [11:0]  Dout
);

////////////////////////////////////////////////////////////////
////////////////////////   Parameters   ////////////////////////
////////////////////////////////////////////////////////////////

localparam NUMTAPS = 32;

localparam  TAP0  = -12'd3,  //-12'd3
            TAP1  = 12'd0,
            TAP2  = 12'd1,
            TAP3  = 12'd4,
            TAP4  = 12'd10,
            TAP5  = 12'd19,
            TAP6  = 12'd31,
            TAP7  = 12'd46,
            TAP8  = 12'd64,
            TAP9  = 12'd83,
            TAP10 = 12'd103,
            TAP11 = 12'd123,
            TAP12 = 12'd141,
            TAP13 = 12'd156,
            TAP14 = 12'd167,
            TAP15 = 12'd173,
            TAP16 = 12'd173,
            TAP17 = 12'd167,
            TAP18 = 12'd156,
            TAP19 = 12'd141,
            TAP20 = 12'd123,
            TAP21 = 12'd103,
            TAP22 = 12'd83,
            TAP23 = 12'd64,
            TAP24 = 12'd46,
            TAP25 = 12'd31,
            TAP26 = 12'd19,
            TAP27 = 12'd10,
            TAP28 = 12'd4,
            TAP29 = 12'd1,
            TAP30 = 12'd0,
            TAP31 = -12'd3; //-12'd3

////////////////////////////////////////////////////////////////
///////////////////////   Internal Net   ///////////////////////
////////////////////////////////////////////////////////////////

logic signed  [31:0][11:0]  coefficients_r;
logic signed        [12:0]  din_r;
logic signed  [31:0][24:0]  product_c = '0;
logic signed  [31:0][24:0]  sum_r = '0;

integer i;
integer j;

////////////////////////////////////////////////////////////////
//////////////////////   Instantiations   //////////////////////
////////////////////////////////////////////////////////////////

genvar k;
generate
  for (k = 0; k < NUMTAPS; k=k+1) begin : generate_multipliers
    /*
    mult12x12 multiplier (
      .Din(din_r),
      .Coeff(coefficients_r[NUMTAPS-k-1]),
      .Product(product_c[k])
    );
    */
    
    mult_primitive multiplier (
      .Din(din_r),
      .Coeff(coefficients_r[NUMTAPS-k-1]),
      .Product(product_c[k])
    );
    
  end
endgenerate

////////////////////////////////////////////////////////////////
///////////////////////   Module Logic   ///////////////////////
////////////////////////////////////////////////////////////////

initial begin
  coefficients_r[0]   = TAP0;
  coefficients_r[1]   = TAP1;
  coefficients_r[2]   = TAP2;
  coefficients_r[3]   = TAP3;
  coefficients_r[4]   = TAP4;
  coefficients_r[5]   = TAP5;
  coefficients_r[6]   = TAP6;
  coefficients_r[7]   = TAP7;
  coefficients_r[8]   = TAP8;
  coefficients_r[9]   = TAP9;
  coefficients_r[10]  = TAP10;
  coefficients_r[11]  = TAP11;
  coefficients_r[12]  = TAP12;
  coefficients_r[13]  = TAP13;
  coefficients_r[14]  = TAP14;
  coefficients_r[15]  = TAP15;
  coefficients_r[16]  = TAP16;
  coefficients_r[17]  = TAP17;
  coefficients_r[18]  = TAP18;
  coefficients_r[19]  = TAP19;
  coefficients_r[20]  = TAP20;
  coefficients_r[21]  = TAP21;
  coefficients_r[22]  = TAP22;
  coefficients_r[23]  = TAP23;
  coefficients_r[24]  = TAP24;
  coefficients_r[25]  = TAP25;
  coefficients_r[26]  = TAP26;
  coefficients_r[27]  = TAP27;
  coefficients_r[28]  = TAP28;
  coefficients_r[29]  = TAP29;
  coefficients_r[30]  = TAP30;
  coefficients_r[31]  = TAP31;

end

// Register Inputs
always_ff @(posedge Clk or posedge Hlt) begin
  if (Hlt) begin
    din_r <= '0;
  end 
  else begin
    //din_r <= Din;
    din_r <= {1'b0, Din};
  end
end

always_ff @(posedge Clk) begin

  sum_r[0] <= product_c[0];

  for (i = 1; i < NUMTAPS; i=i+1) begin
    sum_r[i] <= sum_r[i-1] + $signed(product_c[i]);
  end  
end

assign Dout = sum_r[31][22:11];

////////////////////////////////////////////////////////////////
//////////////////   Instantiation Template   //////////////////
////////////////////////////////////////////////////////////////

endmodule