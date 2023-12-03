//SPI testbech


module SPI_tb(
	);
	
	
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

always begin 
	#5 SCK <= ~SCK;
end

initial begin 
	SCK <= 1'b0;
	CS <= 1'b1;
	count <= 7'd31;
	MOSI <= 1'b0;
	test_pass <= 1'b1; 
	
	
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
	

	$finish; 
end

always @ (posedge SCK) begin
        if(CS == 1'b0) begin 
			MOSI <= mess[count]; 
			count <= count - 1'b1;
		end
    end

SPI DUT(.SCK(SCK), .CS(CS), .MOSI(MOSI), .MISO(MISO), .load(load), .register_address(register_address), .register_value(register_value), .read_address(read_address), .read_value(read_value)); 
memory DUT2(.write_address(register_address), .read_address(read_address), .write_value(register_value), .load(load), .read_value(read_value));

endmodule 