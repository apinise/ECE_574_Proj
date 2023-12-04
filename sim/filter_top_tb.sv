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
logic load, ok;
logic [7:0] register_address;
logic [11:0] register_value;
logic [7:0] read_address;
logic [11:0] read_value;

logic [6:0] count; 
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

logic [7:0]   write_address;
logic [7:0]   read_address;
logic [11:0]  write_value;
logic [11:0]  read_value;
logic         load;

logic [11:0]  chkDout, chkDout_r;
logic 	      testbench_pass;
integer       fvectors, r;
integer       fcoeff, t;

////////////////////////////////////////////////////////////////
//////////////////////   Instantiations   //////////////////////
////////////////////////////////////////////////////////////////

filter_top DUT (
  .Clk(SCK),
  .Hlt(reset),
  .Din(din),
  .Dout(dout),
  .SCK(SCK),
  .CS(CS),
  .MOSI(MOSI),
  .MISO(MISO)
);

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
  
	
    fileHandle = $fopen("packets.txt", "r");
	for (int k= 0; k <32; k++) begin
		$fscanf(fileHandle, "%s\n", packet_string);
		$sscanf(packet_string, "%b", Packet[k]);
	end

    $fclose(fileHandle);
	
	fileHandle = $fopen("packets_read.txt", "r");
	for (int k= 0; k <32; k++) begin
		$fscanf(fileHandle, "%s\n", packet_string);
		$sscanf(packet_string, "%b", Packet_read[k]);
	end

    $fclose(fileHandle);

	for (int i = 0; i < 32; i++) begin
        rands = $random;
        ///		preamble/address/value/last4-bits dont matter 
        //mess = {8'hFB, rands[23:0]};
		mess = Packet[i];
        count = 7'd31;
        @(negedge load);
        #30;
        CS = 1'b0;
        #340;
        CS = 1'b1;
        if(mess[23:16] == register_address && mess[11:0] == register_value)
            ok = 1'b1;
        else 
            ok = 1'b0;
        $display("Expected Address: %h, Expected Value: %0d, Address: %h, Value: %0d  ok: %b", mess[23:16], mess[11:0], register_address, register_value, ok);
        test_pass = test_pass & ok; 
    end
    
    if(test_pass)
         $display("TEST PASSED");
    else 
         $display("TEST FAILED");
	
	for (int i = 0; i < 32; i++) begin
        ///		preamble/address/value/last4-bits dont matter 
		mess = Packet_read[i];
        count = 7'd31;
        #30;
        CS = 1'b0;
        #540;
        CS = 1'b1;

        $display("Address: %h, Value: %0d", read_address, read_value);
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