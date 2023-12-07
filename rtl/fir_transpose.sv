module fir_transpose (
  //FIR Filter Nets
  input   logic         Clk,            // Global clk
  input   logic         Reset,         // Reset coefficients and initialize registers
  input   logic [11:0]  Din,            // 12-bit input data from ADC
  output  logic [11:0]  Dout,           // 12-bit output data from Filter to DAC
  // Coefficient Mem Nets
  input   logic [7:0]   write_address,  // Write address for tap coefficients
  input   logic [7:0]   read_address,   // Read address for tap coefficients
  input   logic [11:0]  write_value,    // Value to load into tap coefficient register
  input   logic         load,           // Enable to load data in tap coefficient regs
  output  logic [11:0]  read_value      // Value read from tap coefficient for program verification
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
logic signed        [11:0]  din_r;
logic signed  [31:0][23:0]  product_c;
logic signed  [31:0][23:0]  sum_r;

integer i;
integer j;
integer l;
genvar  k;

////////////////////////////////////////////////////////////////
//////////////////////   Instantiations   //////////////////////
////////////////////////////////////////////////////////////////

generate
  for (k = 0; k < NUMTAPS; k=k+1) begin : generate_multipliers
    
    mult12x12 multiplier (
      .Din(din_r),
      .Coeff(coefficients_r[NUMTAPS-k-1]),
      .Product(product_c[k])
    );
    
    /*
    mult_primitive multiplier (
      .Din(din_r),
      .Coeff(coefficients_r[NUMTAPS-k-1]),
      .Product(product_c[k])
    );
    */
  end
endgenerate

////////////////////////////////////////////////////////////////
///////////////////////   Module Logic   ///////////////////////
////////////////////////////////////////////////////////////////

// Load coefficients
always_ff @(posedge Clk or posedge Reset) begin
  if (Reset) begin
    for (j = 0; j < NUMTAPS; j=j+1) begin
      coefficients_r[j] <= '0;
    end   
  end
  else begin
    if (load) begin
      casez(write_address)
        8'd0:   coefficients_r[0]   <= write_value;
        8'd1:   coefficients_r[1]   <= write_value;
        8'd2:   coefficients_r[2]   <= write_value;
        8'd3:   coefficients_r[3]   <= write_value;
        8'd4:   coefficients_r[4]   <= write_value;
        8'd5:   coefficients_r[5]   <= write_value;
        8'd6:   coefficients_r[6]   <= write_value;
        8'd7:   coefficients_r[7]   <= write_value;
        8'd8:   coefficients_r[8]   <= write_value;
        8'd9:   coefficients_r[9]   <= write_value;
        8'd10:  coefficients_r[10]  <= write_value;
        8'd11:  coefficients_r[11]  <= write_value;
        8'd12:  coefficients_r[12]  <= write_value;
        8'd13:  coefficients_r[13]  <= write_value;
        8'd14:  coefficients_r[14]  <= write_value;
        8'd15:  coefficients_r[15]  <= write_value;
        8'd16:  coefficients_r[16]  <= write_value;
        8'd17:  coefficients_r[17]  <= write_value;
        8'd18:  coefficients_r[18]  <= write_value;
        8'd19:  coefficients_r[19]  <= write_value;
        8'd20:  coefficients_r[20]  <= write_value;
        8'd21:  coefficients_r[21]  <= write_value;
        8'd22:  coefficients_r[22]  <= write_value;
        8'd23:  coefficients_r[23]  <= write_value;
        8'd24:  coefficients_r[24]  <= write_value;
        8'd25:  coefficients_r[25]  <= write_value;
        8'd26:  coefficients_r[26]  <= write_value;
        8'd27:  coefficients_r[27]  <= write_value;
        8'd28:  coefficients_r[28]  <= write_value;
        8'd29:  coefficients_r[29]  <= write_value;
        8'd30:  coefficients_r[30]  <= write_value;
        8'd31:  coefficients_r[31]  <= write_value;
        default: coefficients_r[0]  <= coefficients_r[0];
      endcase
    end
  end
end

// Read coefficients
always_ff @(posedge Clk or posedge Reset) begin
  if (Reset) begin
    read_value <= '0;
  end
  else begin
    casez(read_address)
      8'd0:     read_value  <= coefficients_r[0];
      8'd1:     read_value  <= coefficients_r[1];
      8'd2:     read_value  <= coefficients_r[2];
      8'd3:     read_value  <= coefficients_r[3];
      8'd4:     read_value  <= coefficients_r[4];
      8'd5:     read_value  <= coefficients_r[5];
      8'd6:     read_value  <= coefficients_r[6];
      8'd7:     read_value  <= coefficients_r[7];
      8'd8:     read_value  <= coefficients_r[8];
      8'd9:     read_value  <= coefficients_r[9];
      8'd10:    read_value  <= coefficients_r[10];
      8'd11:    read_value  <= coefficients_r[11];
      8'd12:    read_value  <= coefficients_r[12];
      8'd13:    read_value  <= coefficients_r[13];
      8'd14:    read_value  <= coefficients_r[14];
      8'd15:    read_value  <= coefficients_r[15];
      8'd16:    read_value  <= coefficients_r[16];
      8'd17:    read_value  <= coefficients_r[17];
      8'd18:    read_value  <= coefficients_r[18];
      8'd19:    read_value  <= coefficients_r[19];
      8'd20:    read_value  <= coefficients_r[20];
      8'd21:    read_value  <= coefficients_r[21];
      8'd22:    read_value  <= coefficients_r[22];
      8'd23:    read_value  <= coefficients_r[23];
      8'd24:    read_value  <= coefficients_r[24];
      8'd25:    read_value  <= coefficients_r[25];
      8'd26:    read_value  <= coefficients_r[26];
      8'd27:    read_value  <= coefficients_r[27];
      8'd28:    read_value  <= coefficients_r[28];
      8'd29:    read_value  <= coefficients_r[29];
      8'd30:    read_value  <= coefficients_r[30];
      8'd31:    read_value  <= coefficients_r[31];
      default:  read_value  <= '0;
    endcase
  end
end

/*
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
*/

// Register Inputs
always_ff @(posedge Clk or posedge Reset) begin
  if (Reset) begin
    din_r <= '0;
  end 
  else begin
    din_r <= Din;
    //din_r <= {1'b0, Din};
  end
end

always_ff @(posedge Clk or posedge Reset) begin
  if (Reset) begin
    for (l = 0; l < NUMTAPS; l=l+1) begin
      sum_r[l] <= '0;
    end    
  end
  else begin
    sum_r[0] <= product_c[0];
    for (i = 1; i < NUMTAPS; i=i+1) begin
      sum_r[i] <= sum_r[i-1] + $signed(product_c[i]);
    end
  end
end

assign Dout = sum_r[31][22:11];

////////////////////////////////////////////////////////////////
//////////////////   Instantiation Template   //////////////////
////////////////////////////////////////////////////////////////

/*
fir_transpose fir_filter (
  .Clk(),
  .Hlt(),
  .Din(),
  .Dout(),
  .write_address(),
  .read_address(),
  .write_value(),
  .load(),
  .read_value()
);
*/

endmodule