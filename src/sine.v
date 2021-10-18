`include "src/defines.v"
`timescale 1ns/100ps

module sine_LUT (
    input wire                          clk,
    input wire                          reset_n,
    input wire                          en_sine,
    input wire [1:0]                    quadrant,
    input wire [`DATA_WIDTH-1 : 0]      data_in,
	output reg [(`DATA_WIDTH*2)-1 : 0]  data_out
);

always @(posedge clk) begin
    if(reset_n) begin
        if (en_sine) begin
            if (quadrant == 2'd0 || quadrant == 2'd1)	// Sine is +ve in 1st and 2nd quadrant
                data_out[63] <= 1'b0;
            else
                data_out[63] <= 1'b1;
			// --------------------------------------- Sine look up table
			case (data_in)
				`DATA_WIDTH'd0  : data_out[62:0] <= `SINE_DEG_00;
				`DATA_WIDTH'd1  : data_out[62:0] <= `SINE_DEG_01;
				`DATA_WIDTH'd2  : data_out[62:0] <= `SINE_DEG_02;
				`DATA_WIDTH'd3  : data_out[62:0] <= `SINE_DEG_03;
				`DATA_WIDTH'd4  : data_out[62:0] <= `SINE_DEG_04;
				`DATA_WIDTH'd5  : data_out[62:0] <= `SINE_DEG_05;
				`DATA_WIDTH'd6  : data_out[62:0] <= `SINE_DEG_06;
				`DATA_WIDTH'd7  : data_out[62:0] <= `SINE_DEG_07;
				`DATA_WIDTH'd8  : data_out[62:0] <= `SINE_DEG_08;
				`DATA_WIDTH'd9  : data_out[62:0] <= `SINE_DEG_09;
				`DATA_WIDTH'd10 : data_out[62:0] <= `SINE_DEG_10;
				`DATA_WIDTH'd11 : data_out[62:0] <= `SINE_DEG_11;
				`DATA_WIDTH'd12 : data_out[62:0] <= `SINE_DEG_12;
				`DATA_WIDTH'd13 : data_out[62:0] <= `SINE_DEG_13;
				`DATA_WIDTH'd14 : data_out[62:0] <= `SINE_DEG_14;
				`DATA_WIDTH'd15 : data_out[62:0] <= `SINE_DEG_15;
				`DATA_WIDTH'd16 : data_out[62:0] <= `SINE_DEG_16;
				`DATA_WIDTH'd17 : data_out[62:0] <= `SINE_DEG_17;
				`DATA_WIDTH'd18 : data_out[62:0] <= `SINE_DEG_18;
				`DATA_WIDTH'd19 : data_out[62:0] <= `SINE_DEG_19;
				`DATA_WIDTH'd20 : data_out[62:0] <= `SINE_DEG_20;
				`DATA_WIDTH'd21 : data_out[62:0] <= `SINE_DEG_21;
				`DATA_WIDTH'd22 : data_out[62:0] <= `SINE_DEG_22;
				`DATA_WIDTH'd23 : data_out[62:0] <= `SINE_DEG_23;
				`DATA_WIDTH'd24 : data_out[62:0] <= `SINE_DEG_24;
				`DATA_WIDTH'd25 : data_out[62:0] <= `SINE_DEG_25;
				`DATA_WIDTH'd26 : data_out[62:0] <= `SINE_DEG_26;
				`DATA_WIDTH'd27 : data_out[62:0] <= `SINE_DEG_27;
				`DATA_WIDTH'd28 : data_out[62:0] <= `SINE_DEG_28;
				`DATA_WIDTH'd29 : data_out[62:0] <= `SINE_DEG_29;
				`DATA_WIDTH'd30 : data_out[62:0] <= `SINE_DEG_30;
				`DATA_WIDTH'd31 : data_out[62:0] <= `SINE_DEG_31;
				`DATA_WIDTH'd32 : data_out[62:0] <= `SINE_DEG_32;
				`DATA_WIDTH'd33 : data_out[62:0] <= `SINE_DEG_33;
				`DATA_WIDTH'd34 : data_out[62:0] <= `SINE_DEG_34;
				`DATA_WIDTH'd35 : data_out[62:0] <= `SINE_DEG_35;
				`DATA_WIDTH'd36 : data_out[62:0] <= `SINE_DEG_36;
				`DATA_WIDTH'd37 : data_out[62:0] <= `SINE_DEG_37;
				`DATA_WIDTH'd38 : data_out[62:0] <= `SINE_DEG_38;
				`DATA_WIDTH'd39 : data_out[62:0] <= `SINE_DEG_39;
				`DATA_WIDTH'd40 : data_out[62:0] <= `SINE_DEG_40;
				`DATA_WIDTH'd41 : data_out[62:0] <= `SINE_DEG_41;
				`DATA_WIDTH'd42 : data_out[62:0] <= `SINE_DEG_42;
				`DATA_WIDTH'd43 : data_out[62:0] <= `SINE_DEG_43;
				`DATA_WIDTH'd44 : data_out[62:0] <= `SINE_DEG_44;
				`DATA_WIDTH'd45 : data_out[62:0] <= `SINE_DEG_45;
				`DATA_WIDTH'd46 : data_out[62:0] <= `SINE_DEG_46;
				`DATA_WIDTH'd47 : data_out[62:0] <= `SINE_DEG_47;
				`DATA_WIDTH'd48 : data_out[62:0] <= `SINE_DEG_48;
				`DATA_WIDTH'd49 : data_out[62:0] <= `SINE_DEG_49;
				`DATA_WIDTH'd50 : data_out[62:0] <= `SINE_DEG_50;
				`DATA_WIDTH'd51 : data_out[62:0] <= `SINE_DEG_51;
				`DATA_WIDTH'd52 : data_out[62:0] <= `SINE_DEG_52;
				`DATA_WIDTH'd53 : data_out[62:0] <= `SINE_DEG_53;
				`DATA_WIDTH'd54 : data_out[62:0] <= `SINE_DEG_54;
				`DATA_WIDTH'd55 : data_out[62:0] <= `SINE_DEG_55;
				`DATA_WIDTH'd56 : data_out[62:0] <= `SINE_DEG_56;
				`DATA_WIDTH'd57 : data_out[62:0] <= `SINE_DEG_57;
				`DATA_WIDTH'd58 : data_out[62:0] <= `SINE_DEG_58;
				`DATA_WIDTH'd59 : data_out[62:0] <= `SINE_DEG_59;
				`DATA_WIDTH'd60 : data_out[62:0] <= `SINE_DEG_60;
				`DATA_WIDTH'd61 : data_out[62:0] <= `SINE_DEG_61;
				`DATA_WIDTH'd62 : data_out[62:0] <= `SINE_DEG_62;
				`DATA_WIDTH'd63 : data_out[62:0] <= `SINE_DEG_63;
				`DATA_WIDTH'd64 : data_out[62:0] <= `SINE_DEG_64;
				`DATA_WIDTH'd65 : data_out[62:0] <= `SINE_DEG_65;
				`DATA_WIDTH'd66 : data_out[62:0] <= `SINE_DEG_66;
				`DATA_WIDTH'd67 : data_out[62:0] <= `SINE_DEG_67;
				`DATA_WIDTH'd68 : data_out[62:0] <= `SINE_DEG_68;
				`DATA_WIDTH'd69 : data_out[62:0] <= `SINE_DEG_69;
				`DATA_WIDTH'd70 : data_out[62:0] <= `SINE_DEG_70;
				`DATA_WIDTH'd71 : data_out[62:0] <= `SINE_DEG_71;
				`DATA_WIDTH'd72 : data_out[62:0] <= `SINE_DEG_72;
				`DATA_WIDTH'd73 : data_out[62:0] <= `SINE_DEG_73;
				`DATA_WIDTH'd74 : data_out[62:0] <= `SINE_DEG_74;
				`DATA_WIDTH'd75 : data_out[62:0] <= `SINE_DEG_75;
				`DATA_WIDTH'd76 : data_out[62:0] <= `SINE_DEG_76;
				`DATA_WIDTH'd77 : data_out[62:0] <= `SINE_DEG_77;
				`DATA_WIDTH'd78 : data_out[62:0] <= `SINE_DEG_78;
				`DATA_WIDTH'd79 : data_out[62:0] <= `SINE_DEG_79;
				`DATA_WIDTH'd80 : data_out[62:0] <= `SINE_DEG_80;
				`DATA_WIDTH'd81 : data_out[62:0] <= `SINE_DEG_81;
				`DATA_WIDTH'd82 : data_out[62:0] <= `SINE_DEG_82;
				`DATA_WIDTH'd83 : data_out[62:0] <= `SINE_DEG_83;
				`DATA_WIDTH'd84 : data_out[62:0] <= `SINE_DEG_84;
				`DATA_WIDTH'd85 : data_out[62:0] <= `SINE_DEG_85;
				`DATA_WIDTH'd86 : data_out[62:0] <= `SINE_DEG_86;
				`DATA_WIDTH'd87 : data_out[62:0] <= `SINE_DEG_87;
				`DATA_WIDTH'd88 : data_out[62:0] <= `SINE_DEG_88;
				`DATA_WIDTH'd89 : data_out[62:0] <= `SINE_DEG_89;
				`DATA_WIDTH'd90 : data_out[62:0] <= `SINE_DEG_90;
				default: data_out[62:0] <= 64'h0; 
			endcase
			// ----------------------------------------------------------
        end
        else begin
            data_out[63:0] <= 64'hz;
        end
    end
    else begin
        data_out[63:0] <= 64'hz;
    end
end

endmodule
