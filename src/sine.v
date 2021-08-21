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
				`DATA_WIDTH'd0  : data_out[62:0] <= 64'h0000000000000000;
				`DATA_WIDTH'd1  : data_out[62:0] <= 64'h3f91df0b2b89dd1e;
				`DATA_WIDTH'd2  : data_out[62:0] <= 64'h3fa1de58c9f7dc27;
				`DATA_WIDTH'd3  : data_out[62:0] <= 64'h3faacbc748efc90d;
				`DATA_WIDTH'd4  : data_out[62:0] <= 64'h3fb1db8f6d6a5128;
				`DATA_WIDTH'd5  : data_out[62:0] <= 64'h3fb64fd6b8c28102;
				`DATA_WIDTH'd6  : data_out[62:0] <= 64'h3fbac2609b3c576b;
				`DATA_WIDTH'd7  : data_out[62:0] <= 64'h3fbf32d44c4f62d3;
				`DATA_WIDTH'd8  : data_out[62:0] <= 64'h3fc1d06c968d9e19;
				`DATA_WIDTH'd9  : data_out[62:0] <= 64'h3fc4060b67a85375;
				`DATA_WIDTH'd10 : data_out[62:0] <= 64'h3fc63a1a7e0b7389;
				`DATA_WIDTH'd11 : data_out[62:0] <= 64'h3fc86c6ddd76624f;
				`DATA_WIDTH'd12 : data_out[62:0] <= 64'h3fca9cd9ac4258f5;
				`DATA_WIDTH'd13 : data_out[62:0] <= 64'h3fcccb3236cdc674;
				`DATA_WIDTH'd14 : data_out[62:0] <= 64'h3fcef74bf2e4b91d;
				`DATA_WIDTH'd15 : data_out[62:0] <= 64'h3fd0907dc1930690;
				`DATA_WIDTH'd16 : data_out[62:0] <= 64'h3fd1a40add328e29;
				`DATA_WIDTH'd17 : data_out[62:0] <= 64'h3fd2b637cf83d5c7;
				`DATA_WIDTH'd18 : data_out[62:0] <= 64'h3fd3c6ef372fe94f;
				`DATA_WIDTH'd19 : data_out[62:0] <= 64'h3fd4d61bd000cddc;
				`DATA_WIDTH'd20 : data_out[62:0] <= 64'h3fd5e3a8748a0bf5;
				`DATA_WIDTH'd21 : data_out[62:0] <= 64'h3fd6ef801fced33c;
				`DATA_WIDTH'd22 : data_out[62:0] <= 64'h3fd7f98deee59681;
				`DATA_WIDTH'd23 : data_out[62:0] <= 64'h3fd901bd2298ffaa;
				`DATA_WIDTH'd24 : data_out[62:0] <= 64'h3fda07f921061ad0;
				`DATA_WIDTH'd25 : data_out[62:0] <= 64'h3fdb0c2d77379853;
				`DATA_WIDTH'd26 : data_out[62:0] <= 64'h3fdc0e45dabe05c8;
				`DATA_WIDTH'd27 : data_out[62:0] <= 64'h3fdd0e2e2b44de00;
				`DATA_WIDTH'd28 : data_out[62:0] <= 64'h3fde0bd274245079;
				`DATA_WIDTH'd29 : data_out[62:0] <= 64'h3fdf071eedefa0ed;
				`DATA_WIDTH'd30 : data_out[62:0] <= 64'h3fdfffffffffffff;
				`DATA_WIDTH'd31 : data_out[62:0] <= 64'h3fe07b3120fddf13;
				`DATA_WIDTH'd32 : data_out[62:0] <= 64'h3fe0f5193eacdd2a;
				`DATA_WIDTH'd33 : data_out[62:0] <= 64'h3fe16daed770771c;
				`DATA_WIDTH'd34 : data_out[62:0] <= 64'h3fe1e4e88411fd12;
				`DATA_WIDTH'd35 : data_out[62:0] <= 64'h3fe25abcf87c4978;
				`DATA_WIDTH'd36 : data_out[62:0] <= 64'h3fe2cf2304755a5e;
				`DATA_WIDTH'd37 : data_out[62:0] <= 64'h3fe342119455beb6;
				`DATA_WIDTH'd38 : data_out[62:0] <= 64'h3fe3b37fb1bdc939;
				`DATA_WIDTH'd39 : data_out[62:0] <= 64'h3fe4236484487abe;
				`DATA_WIDTH'd40 : data_out[62:0] <= 64'h3fe491b7523c161c;
				`DATA_WIDTH'd41 : data_out[62:0] <= 64'h3fe4fe6f81384fd4;
				`DATA_WIDTH'd42 : data_out[62:0] <= 64'h3fe5698496e20bd8;
				`DATA_WIDTH'd43 : data_out[62:0] <= 64'h3fe5d2ee398c9c2b;
				`DATA_WIDTH'd44 : data_out[62:0] <= 64'h3fe63aa430e07310;
				`DATA_WIDTH'd45 : data_out[62:0] <= 64'h3fe6a09e667f3bcc;
				`DATA_WIDTH'd46 : data_out[62:0] <= 64'h3fe704d4e6a54d38;
				`DATA_WIDTH'd47 : data_out[62:0] <= 64'h3fe7673fe0c86982;
				`DATA_WIDTH'd48 : data_out[62:0] <= 64'h3fe7c7d7a833bec1;
				`DATA_WIDTH'd49 : data_out[62:0] <= 64'h3fe82694b4a11c36;
				`DATA_WIDTH'd50 : data_out[62:0] <= 64'h3fe8836fa2cf5039;
				`DATA_WIDTH'd51 : data_out[62:0] <= 64'h3fe8de613515a327;
				`DATA_WIDTH'd52 : data_out[62:0] <= 64'h3fe9376253f463d1;
				`DATA_WIDTH'd53 : data_out[62:0] <= 64'h3fe98e6c0ea27a14;
				`DATA_WIDTH'd54 : data_out[62:0] <= 64'h3fe9e3779b97f4a8;
				`DATA_WIDTH'd55 : data_out[62:0] <= 64'h3fea367e59158747;
				`DATA_WIDTH'd56 : data_out[62:0] <= 64'h3fea8779cda8eea5;
				`DATA_WIDTH'd57 : data_out[62:0] <= 64'h3fead663a8ae2fdb;
				`DATA_WIDTH'd58 : data_out[62:0] <= 64'h3feb2335c2cda945;
				`DATA_WIDTH'd59 : data_out[62:0] <= 64'h3feb6dea1e76eadd;
				`DATA_WIDTH'd60 : data_out[62:0] <= 64'h3febb67ae8584caa;
				`DATA_WIDTH'd61 : data_out[62:0] <= 64'h3febfce277d339c6;
				`DATA_WIDTH'd62 : data_out[62:0] <= 64'h3fec411b4f6d2707;
				`DATA_WIDTH'd63 : data_out[62:0] <= 64'h3fec83201d3d2c6c;
				`DATA_WIDTH'd64 : data_out[62:0] <= 64'h3fecc2ebbb5638ca;
				`DATA_WIDTH'd65 : data_out[62:0] <= 64'h3fed0079302dd767;
				`DATA_WIDTH'd66 : data_out[62:0] <= 64'h3fed3bc3aeff7f95;
				`DATA_WIDTH'd67 : data_out[62:0] <= 64'h3fed74c6982c666f;
				`DATA_WIDTH'd68 : data_out[62:0] <= 64'h3fedab7d7997cb57;
				`DATA_WIDTH'd69 : data_out[62:0] <= 64'h3feddfe40effb805;
				`DATA_WIDTH'd70 : data_out[62:0] <= 64'h3fee11f642522d1b;
				`DATA_WIDTH'd71 : data_out[62:0] <= 64'h3fee41b02bfeb4ca;
				`DATA_WIDTH'd72 : data_out[62:0] <= 64'h3fee6f0e134454ff;
				`DATA_WIDTH'd73 : data_out[62:0] <= 64'h3fee9a0c6e7bdb1f;
				`DATA_WIDTH'd74 : data_out[62:0] <= 64'h3feec2a7e35e7b80;
				`DATA_WIDTH'd75 : data_out[62:0] <= 64'h3feee8dd4748bf15;
				`DATA_WIDTH'd76 : data_out[62:0] <= 64'h3fef0ca99f79ba25;
				`DATA_WIDTH'd77 : data_out[62:0] <= 64'h3fef2e0a214e870f;
				`DATA_WIDTH'd78 : data_out[62:0] <= 64'h3fef4cfc327a0080;
				`DATA_WIDTH'd79 : data_out[62:0] <= 64'h3fef697d6938b6c2;
				`DATA_WIDTH'd80 : data_out[62:0] <= 64'h3fef838b8c811c17;
				`DATA_WIDTH'd81 : data_out[62:0] <= 64'h3fef9b24942fe45c;
				`DATA_WIDTH'd82 : data_out[62:0] <= 64'h3fefb046a930947a;
				`DATA_WIDTH'd83 : data_out[62:0] <= 64'h3fefc2f025a23e8b;
				`DATA_WIDTH'd84 : data_out[62:0] <= 64'h3fefd31f94f867c6;
				`DATA_WIDTH'd85 : data_out[62:0] <= 64'h3fefe0d3b41815a2;
				`DATA_WIDTH'd86 : data_out[62:0] <= 64'h3fefec0b7170fff6;
				`DATA_WIDTH'd87 : data_out[62:0] <= 64'h3feff4c5ed12e61d;
				`DATA_WIDTH'd88 : data_out[62:0] <= 64'h3feffb0278bf0567;
				`DATA_WIDTH'd89 : data_out[62:0] <= 64'h3feffec097f5af8a;
				`DATA_WIDTH'd90 : data_out[62:0] <= 64'h3ff0000000000000;
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
