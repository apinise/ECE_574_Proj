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
logic reset;

logic start;
logic done;

logic [11:0]  din;
logic [11:0]  dout;



logic [11:0]  chkDout, chkDout_r;
logic 	      testbench_pass;
integer       fvectors, r;
integer       fcoeff, t;

////////////////////////////////////////////////////////////////
//////////////////////   Instantiations   //////////////////////
////////////////////////////////////////////////////////////////

filter_top dut (
  .Clk(SCK),
  .Hlt(reset),
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
	#5 SCK <= ~SCK;
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
  reset = 1;
  
	
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
        #30;
        CS = 1'b0;
        #540;
        CS = 1'b1;
    end
    
    
  fvectors = $fopen("../refC/vectors.txt", "r");
  if (fvectors == 0) begin
     $display("Could not open refC/vectors.txt");
     $finish;
  end

	@(posedge SCK);
  #7;
  @(posedge SCK);
	reset = 0;
  
	while (!$feof(fvectors))
	  begin
	     r = $fscanf(fvectors,"%d %d\n", din, chkDout);
       
	     @(posedge SCK);
       
       chkDout_r <= chkDout;
       
       $display("Din %d Dout %d chkDout %d OK %b", din, dout, chkDout_r, (dout == chkDout_r));
	     testbench_pass = testbench_pass && (dout == chkDout_r);	     
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