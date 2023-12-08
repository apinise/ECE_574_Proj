module filter_top_tb (
);

////////////////////////////////////////////////////////////////
////////////////////////   Parameters   ////////////////////////
////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////
///////////////////////   Internal Net   ///////////////////////
////////////////////////////////////////////////////////////////

// SPI Nets
logic SCK;
logic CS;
logic MOSI;
logic MISO; 


logic [4:0] count; 
logic [31:0] mess; 
logic [31:0] rands; 

logic test_pass; 

/// read the packets in 
int fileHandle;
string packet_string;
logic [31:0] Packet[32];
logic [31:0] Packet_read[32];

// FIR Nets
logic clk;
logic reset;

logic start;
logic done;

logic [11:0]  din;
logic [11:0]  dout;



logic [11:0]  chkDout, chkDout_r, chkDout_r2;
logic 	      testbench_pass;
integer       fvectors, r;
integer       fcoeff, t;

////////////////////////////////////////////////////////////////
//////////////////////   Instantiations   //////////////////////
////////////////////////////////////////////////////////////////

filter_top dut (
  .Clk(clk),
  .Reset(reset),
  .Din(din),
  .Dout(dout),
  .SCK(SCK),
  .CS(CS),
  .MOSI(MOSI),
  .MISO(MISO)
);

`ifdef USE_SDF
      initial
	begin
	   $sdf_annotate("../layout/out/design.sdf",filter_top_tb.dut,,"sdf.log","MAXIMUM");
	end
`endif
////////////////////////////////////////////////////////////////
///////////////////////   Module Logic   ///////////////////////
////////////////////////////////////////////////////////////////

always begin 
	#100 SCK <= ~SCK;
end

always begin
  #2 clk <= ~clk;
end

initial begin 
	SCK <= 1'b0;
	CS <= 1'b1;
	count <= 7'd31;
	MOSI <= 1'b0;
	test_pass <= 1'b1; 
  din = 0;
	start = 0;
	testbench_pass = 1;
  chkDout_r = 0;
  chkDout_r2 = 0;
  reset = 0;
  clk <= 0;
  @(posedge clk);
  @(posedge clk)
  reset = 1;
  @(posedge clk);
  @(posedge clk);
  @(posedge clk);
  reset = 0;
  @(posedge clk);
  
	
    fileHandle = $fopen("../refC/packets.txt", "r");
	for (int k= 0; k <32; k++) begin
		$fscanf(fileHandle, "%s\n", packet_string);
		$sscanf(packet_string, "%b", Packet[k]);
	end

    $fclose(fileHandle);
	

	for (int i = 0; i < 32; i++) begin
        //mess = {8'hFB, rands[23:0]};
		mess = Packet[i];
        count = 7'd31;
        #600;
        CS = 1'b0;
        #10800;
        CS = 1'b1;
    end
    
    
  fvectors = $fopen("../refC/vectors.txt", "r");
  if (fvectors == 0) begin
     $display("Could not open refC/vectors.txt");
     $finish;
  end

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

always @ (posedge SCK) begin
        if(CS == 1'b0) begin 
			MOSI <= mess[count]; 
			count <= count - 1'b1;
		end
    end

endmodule