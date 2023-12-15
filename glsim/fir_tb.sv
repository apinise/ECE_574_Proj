module fir_tb (
);

////////////////////////////////////////////////////////////////
////////////////////////   Parameters   ////////////////////////
////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////
///////////////////////   Internal Net   ///////////////////////
////////////////////////////////////////////////////////////////

logic clk;
logic reset;

logic start;
logic done;

logic [11:0]  din;
logic [11:0]  dout;

logic [7:0]   write_address;
logic [7:0]   read_address;
logic [11:0]  write_value;
logic [11:0]  read_value;
logic         load;

logic [11:0]  chkDout, chkDout_r, chkDout_r2;
logic 	      testbench_pass;
integer       fvectors, r;
integer       fcoeff, t;

////////////////////////////////////////////////////////////////
//////////////////////   Instantiations   //////////////////////
////////////////////////////////////////////////////////////////

fir_transpose DUT(
  .Clk(clk),
  .Reset(reset),
  .Din(din),
  .Dout(dout),
  .write_address(write_address),
  .read_address(read_address),
  .write_value(write_value),
  .load(load),
  .read_value(read_value)
);

`ifdef USE_SDF
      initial
	begin
	   $sdf_annotate("../layout/out/design.sdf",fir_tb.DUT,,"sdf.log","MAXIMUM");
	end
`endif
////////////////////////////////////////////////////////////////
///////////////////////   Module Logic   ///////////////////////
////////////////////////////////////////////////////////////////

initial begin
  fvectors = $fopen("../refC/vectors.txt", "r");
  if (fvectors == 0) begin
     $display("Could not open refC/vectors.txt");
     $finish;
  end
  
  fcoeff = $fopen("../refC/coeff.txt", "r");
  if (fcoeff == 0) begin
     $display("Could not open refC/coeff.txt");
     $finish;
  end  
  
  write_address = 0;
  read_address = 0;
  write_value = 0;
  load = 1;
	clk = 0;
	din = 0;
	start = 0;
	testbench_pass = 1;
  chkDout_r = 0;
  chkDout_r2 = 0;
  reset = 0;
  @(posedge clk);
  @(posedge clk);
	reset = 1;
  @(posedge clk);
  reset = 0;
  
  while (!$feof(fcoeff))
    begin
      t = $fscanf(fcoeff, "%d\n", write_value);
      @(posedge clk);
      write_address = write_address + 1;
    end
  
  $fclose(fcoeff);
  
  load = 0;
  
	@(posedge clk);
  @(posedge clk);
  
	while (!$feof(fvectors))
	  begin
	     r = $fscanf(fvectors,"%d %d\n", din, chkDout);
       
	     @(posedge clk);
       
       chkDout_r <= chkDout;
       chkDout_r2 <= chkDout_r;
       
       $display("Din %d Dout %d chkDout %d OK %b", din, dout, chkDout_r2, (dout == chkDout_r2));
	     testbench_pass = testbench_pass && (dout == chkDout_r2);	     
	  end

	$fclose(fvectors);
  
	if (testbench_pass)
	  $display("TESTBENCH PASSES");
	else
	  $display("TESTBENCH FAILS");
    
  $finish;
  
end

always begin
 #5 clk = ~clk;
end

////////////////////////////////////////////////////////////////
//////////////////   Instantiation Template   //////////////////
////////////////////////////////////////////////////////////////

endmodule