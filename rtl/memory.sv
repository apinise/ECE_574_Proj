// This block will be used to as the storage for FIR taps 
// the SPI block can write into this block and configure the taps 
// All taps can be read from this block from the FIR 

module memory(
    input logic [7:0] write_address,
    input logic [7:0] read_address,
    input logic [11:0] write_value,
	input logic load,
    output logic [11:0] read_value
);

    logic [11:0] reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7;
    logic [11:0] reg8, reg9, reg10, reg11, reg12, reg13, reg14, reg15;
    logic [11:0] reg16, reg17, reg18, reg19, reg20, reg21, reg22, reg23;
    logic [11:0] reg24, reg25, reg26, reg27, reg28, reg29, reg30, reg31;

    always_comb begin
		if (load) begin 
        case(write_address)
            8'd0:  reg0 = write_value;
            8'd1:  reg1 = write_value;
            8'd2:  reg2 = write_value;
            8'd3:  reg3 = write_value;
            8'd4:  reg4 = write_value;
            8'd5:  reg5 = write_value;
            8'd6:  reg6 = write_value;
            8'd7:  reg7 = write_value;
            8'd8:  reg8 = write_value;
            8'd9:  reg9 = write_value;
            8'd10: reg10 = write_value;
            8'd11: reg11 = write_value;
            8'd12: reg12 = write_value;
            8'd13: reg13 = write_value;
            8'd14: reg14 = write_value;
            8'd15: reg15 = write_value;
            8'd16: reg16 = write_value;
            8'd17: reg17 = write_value;
            8'd18: reg18 = write_value;
            8'd19: reg19 = write_value;
            8'd20: reg20 = write_value;
            8'd21: reg21 = write_value;
            8'd22: reg22 = write_value;
            8'd23: reg23 = write_value;
            8'd24: reg24 = write_value;
            8'd25: reg25 = write_value;
            8'd26: reg26 = write_value;
            8'd27: reg27 = write_value;
            8'd28: reg28 = write_value;
            8'd29: reg29 = write_value;
            8'd30: reg30 = write_value;
            8'd31: reg31 = write_value;
            default: reg1 <= reg1;
        endcase
		end
    end

    always_comb begin
        case(read_address)
            8'd0:  read_value = reg0;
            8'd1:  read_value = reg1;
            8'd2:  read_value = reg2;
            8'd3:  read_value = reg3;
            8'd4:  read_value = reg4;
            8'd5:  read_value = reg5;
            8'd6:  read_value = reg6;
            8'd7:  read_value = reg7;
            8'd8:  read_value = reg8;
            8'd9:  read_value = reg9;
            8'd10: read_value = reg10;
            8'd11: read_value = reg11;
            8'd12: read_value = reg12;
            8'd13: read_value = reg13;
            8'd14: read_value = reg14;
            8'd15: read_value = reg15;
            8'd16: read_value = reg16;
            8'd17: read_value = reg17;
            8'd18: read_value = reg18;
            8'd19: read_value = reg19;
            8'd20: read_value = reg20;
            8'd21: read_value = reg21;
            8'd22: read_value = reg22;
            8'd23: read_value = reg23;
            8'd24: read_value = reg24;
            8'd25: read_value = reg25;
            8'd26: read_value = reg26;
            8'd27: read_value = reg27;
            8'd28: read_value = reg28;
            8'd29: read_value = reg29;
            8'd30: read_value = reg30;
            8'd31: read_value = reg31;
            default: read_value = 12'd0; 
        endcase
    end

endmodule
