module filter_top (
  // FIR Filter Nets
  input   logic         Clk,
  input   logic         Reset,
  input   logic [11:0]  Din,
  output  logic [11:0]  Dout,
  // SPI Nets
  input   logic         SCK,
  input   logic         CS,
  input   logic         MOSI,
  output  logic         MISO
);

////////////////////////////////////////////////////////////////
////////////////////////   Parameters   ////////////////////////
////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////
///////////////////////   Internal Net   ///////////////////////
////////////////////////////////////////////////////////////////

logic [7:0]   register_address;
logic [11:0]  register_value;
logic [7:0]   read_address;
logic [11:0]  read_value;
logic         load;

////////////////////////////////////////////////////////////////
//////////////////////   Instantiations   //////////////////////
////////////////////////////////////////////////////////////////

fir_transpose fir_filter (
  .Clk(Clk),
  .Reset(Reset),
  .Din(Din),
  .Dout(Dout),
  .write_address(register_address),
  .read_address(read_address),
  .write_value(register_value),
  .load(load),
  .read_value(read_value)
);

SPI spi (
  .SCK(SCK),
  .CS(CS),
  .MOSI(MOSI),
  .Reset(Reset),
  .MISO(MISO),
  .load(load),
  .register_address(register_address),
  .register_value(register_value),
  .read_address(read_address),
  .read_value(read_value)
);

////////////////////////////////////////////////////////////////
///////////////////////   Module Logic   ///////////////////////
////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////
//////////////////   Instantiation Template   //////////////////
////////////////////////////////////////////////////////////////

/*
filter_top DUT (
  .Clk(),
  .Reset(),
  .Din(),
  .Dout(),
  .SCK(),
  .CS(),
  .MOSI(),
  .MISO()
);
*/

endmodule