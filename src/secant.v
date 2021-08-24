`include "src/defines.v"
`timescale 1ns/100ps

module secant_LUT (
    input wire                          clk,
    input wire                          reset_n,
    input wire                          en_secant,
    input wire [1:0]                    quadrant,
    input wire [`DATA_WIDTH-1 : 0]      data_in,
	output reg [(`DATA_WIDTH*2)-1 : 0]  data_out
);

always @(posedge clk) begin
    if(reset_n) begin
        if (en_secant) begin
            if (quadrant == 2'd0 || quadrant == 2'd3)	// Secant is +ve in 1st and 4th quadrant
                data_out[63] <= 1'b0;
            else
                data_out[63] <= 1'b1;
			// --------------------------------------- Secant look up table
			case (data_in)
                `DATA_WIDTH'd0  : data_out[62:0] <= 64'h3ff0000000000000;
                `DATA_WIDTH'd1  : data_out[62:0] <= 64'h3ff0009fba3f7835;
                `DATA_WIDTH'd2  : data_out[62:0] <= 64'h3ff0027f274d432f;
                `DATA_WIDTH'd3  : data_out[62:0] <= 64'h3ff0059f0252e0bc;
                `DATA_WIDTH'd4  : data_out[62:0] <= 64'h3ff00a008406617c;
                `DATA_WIDTH'd5  : data_out[62:0] <= 64'h3ff00fa563d53203;
                `DATA_WIDTH'd6  : data_out[62:0] <= 64'h3ff0168fd9895209;
                `DATA_WIDTH'd7  : data_out[62:0] <= 64'h3ff01ec29f6be927;
                `DATA_WIDTH'd8  : data_out[62:0] <= 64'h3ff02840f4e91085;
                `DATA_WIDTH'd9  : data_out[62:0] <= 64'h3ff0330ea1b99998;
                `DATA_WIDTH'd10 : data_out[62:0] <= 64'h3ff03f2ff9989907;
                `DATA_WIDTH'd11 : data_out[62:0] <= 64'h3ff04ca9e08b8cb6;
                `DATA_WIDTH'd12 : data_out[62:0] <= 64'h3ff05b81cfc51885;
                `DATA_WIDTH'd13 : data_out[62:0] <= 64'h3ff06bbddb2b91b8;
                `DATA_WIDTH'd14 : data_out[62:0] <= 64'h3ff07d64b78dea34;
                `DATA_WIDTH'd15 : data_out[62:0] <= 64'h3ff0907dc1930690;
                `DATA_WIDTH'd16 : data_out[62:0] <= 64'h3ff0a51105712a50;
                `DATA_WIDTH'd17 : data_out[62:0] <= 64'h3ff0bb27477cf20f;
                `DATA_WIDTH'd18 : data_out[62:0] <= 64'h3ff0d2ca0da1530d;
                `DATA_WIDTH'd19 : data_out[62:0] <= 64'h3ff0ec03a9d451e4;
                `DATA_WIDTH'd20 : data_out[62:0] <= 64'h3ff106df459ea072;
                `DATA_WIDTH'd21 : data_out[62:0] <= 64'h3ff12368eecf1f68;
                `DATA_WIDTH'd22 : data_out[62:0] <= 64'h3ff141ada5766662;
                `DATA_WIDTH'd23 : data_out[62:0] <= 64'h3ff161bb6b4a03f3;
                `DATA_WIDTH'd24 : data_out[62:0] <= 64'h3ff183a154932d8b;
                `DATA_WIDTH'd25 : data_out[62:0] <= 64'h3ff1a76f9ad128b7;
                `DATA_WIDTH'd26 : data_out[62:0] <= 64'h3ff1cd37b13ce9c7;
                `DATA_WIDTH'd27 : data_out[62:0] <= 64'h3ff1f50c5b61511e;
                `DATA_WIDTH'd28 : data_out[62:0] <= 64'h3ff21f01c602373c;
                `DATA_WIDTH'd29 : data_out[62:0] <= 64'h3ff24b2da2943b49;
                `DATA_WIDTH'd30 : data_out[62:0] <= 64'h3ff279a74590331c;
                `DATA_WIDTH'd31 : data_out[62:0] <= 64'h3ff2aa87c7f7612a;
                `DATA_WIDTH'd32 : data_out[62:0] <= 64'h3ff2ddea2c696f6a;
                `DATA_WIDTH'd33 : data_out[62:0] <= 64'h3ff313eb883ae676;
                `DATA_WIDTH'd34 : data_out[62:0] <= 64'h3ff34cab310ac280;
                `DATA_WIDTH'd35 : data_out[62:0] <= 64'h3ff3884aef684af8;
                `DATA_WIDTH'd36 : data_out[62:0] <= 64'h3ff3c6ef372fe94f;
                `DATA_WIDTH'd37 : data_out[62:0] <= 64'h3ff408bf665efb99;
                `DATA_WIDTH'd38 : data_out[62:0] <= 64'h3ff44de60b3c3d86;
                `DATA_WIDTH'd39 : data_out[62:0] <= 64'h3ff4969132d53891;
                `DATA_WIDTH'd40 : data_out[62:0] <= 64'h3ff4e2f2c0fa463b;
                `DATA_WIDTH'd41 : data_out[62:0] <= 64'h3ff53340d31354d4;
                `DATA_WIDTH'd42 : data_out[62:0] <= 64'h3ff587b62f6162b3;
                `DATA_WIDTH'd43 : data_out[62:0] <= 64'h3ff5e092c2857578;
                `DATA_WIDTH'd44 : data_out[62:0] <= 64'h3ff63e1c2d781ad9;
                `DATA_WIDTH'd45 : data_out[62:0] <= 64'h3ff6a09e667f3bcc;
                `DATA_WIDTH'd46 : data_out[62:0] <= 64'h3ff7086c7026f77d;
                `DATA_WIDTH'd47 : data_out[62:0] <= 64'h3ff775e129d20b11;
                `DATA_WIDTH'd48 : data_out[62:0] <= 64'h3ff7e9603e24eb24;
                `DATA_WIDTH'd49 : data_out[62:0] <= 64'h3ff863573463a808;
                `DATA_WIDTH'd50 : data_out[62:0] <= 64'h3ff8e43eaadf9333;
                `DATA_WIDTH'd51 : data_out[62:0] <= 64'h3ff96c9bc1d2abfe;
                `DATA_WIDTH'd52 : data_out[62:0] <= 64'h3ff9fd01bf93f3a3;
                `DATA_WIDTH'd53 : data_out[62:0] <= 64'h3ffa9613f8fd7861;
                `DATA_WIDTH'd54 : data_out[62:0] <= 64'h3ffb38880b4603e4;
                `DATA_WIDTH'd55 : data_out[62:0] <= 64'h3ffbe52877982345;
                `DATA_WIDTH'd56 : data_out[62:0] <= 64'h3ffc9cd7b485648a;
                `DATA_WIDTH'd57 : data_out[62:0] <= 64'h3ffd6093ce555fa5;
                `DATA_WIDTH'd58 : data_out[62:0] <= 64'h3ffe317ab5700fce;
                `DATA_WIDTH'd59 : data_out[62:0] <= 64'h3fff10cf62336e2d;
                `DATA_WIDTH'd60 : data_out[62:0] <= 64'h3ffffffffffffffe;
                `DATA_WIDTH'd61 : data_out[62:0] <= 64'h40008056af82561c;
                `DATA_WIDTH'd62 : data_out[62:0] <= 64'h40010a59ff3c94be;
                `DATA_WIDTH'd63 : data_out[62:0] <= 64'h40019f1b8c9526ef;
                `DATA_WIDTH'd64 : data_out[62:0] <= 64'h40023fd71f682340;
                `DATA_WIDTH'd65 : data_out[62:0] <= 64'h4002edfb187b1137;
                `DATA_WIDTH'd66 : data_out[62:0] <= 64'h4003ab32fb93a3a4;
                `DATA_WIDTH'd67 : data_out[62:0] <= 64'h40047974b96de77f;
                `DATA_WIDTH'd68 : data_out[62:0] <= 64'h40055b11998752bf;
                `DATA_WIDTH'd69 : data_out[62:0] <= 64'h400652cbf905707c;
                `DATA_WIDTH'd70 : data_out[62:0] <= 64'h400763f38fb4cf92;
                `DATA_WIDTH'd71 : data_out[62:0] <= 64'h4008928aa26c4c06;
                `DATA_WIDTH'd72 : data_out[62:0] <= 64'h4009e3779b97f4a7;
                `DATA_WIDTH'd73 : data_out[62:0] <= 64'h400b5cc824ec982d;
                `DATA_WIDTH'd74 : data_out[62:0] <= 64'h400d060d6ac58d68;
                `DATA_WIDTH'd75 : data_out[62:0] <= 64'h400ee8dd4748bf16;
                `DATA_WIDTH'd76 : data_out[62:0] <= 64'h401088c56499f43a;
                `DATA_WIDTH'd77 : data_out[62:0] <= 64'h4011c819f29be021;
                `DATA_WIDTH'd78 : data_out[62:0] <= 64'h40133d2b00047f05;
                `DATA_WIDTH'd79 : data_out[62:0] <= 64'h4014f69f907046fe;
                `DATA_WIDTH'd80 : data_out[62:0] <= 64'h401708fb2129168b;
                `DATA_WIDTH'd81 : data_out[62:0] <= 64'h401991df41de341a;
                `DATA_WIDTH'd82 : data_out[62:0] <= 64'h401cbdbe5febffaf;
                `DATA_WIDTH'd83 : data_out[62:0] <= 64'h402069387b617567;
                `DATA_WIDTH'd84 : data_out[62:0] <= 64'h4023222ff85e6006;
                `DATA_WIDTH'd85 : data_out[62:0] <= 64'h4026f28a8ae3aafa;
                `DATA_WIDTH'd86 : data_out[62:0] <= 64'h402cabd2100d0374;
                `DATA_WIDTH'd87 : data_out[62:0] <= 64'h40331b797e990db2;
                `DATA_WIDTH'd88 : data_out[62:0] <= 64'h403ca7596e271c6c;
                `DATA_WIDTH'd89 : data_out[62:0] <= 64'h404ca63b6cba7b49;
                `DATA_WIDTH'd90 : data_out[62:0] <= 64'h7ff0000000000000;
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
