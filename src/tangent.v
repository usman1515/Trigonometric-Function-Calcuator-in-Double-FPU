`include "src/defines.v"
`timescale 1ns/100ps

module tangent_LUT (
    input wire                          clk,
    input wire                          reset_n,
    input wire                          en_tangent,
    input wire [1:0]                    quadrant,
    input wire [`DATA_WIDTH-1 : 0]      data_in,
	output reg [(`DATA_WIDTH*2)-1 : 0]  data_out
);

always @(posedge clk) begin
    if(reset_n) begin
        if (en_tangent) begin
            if (quadrant == 2'd0 || quadrant == 2'd2)	// Tangent is +ve in 1st and 3nd quadrant
                data_out[63] <= 1'b0;
            else
                data_out[63] <= 1'b1;
			// --------------------------------------- Sine look up table
			case (data_in)
                `DATA_WIDTH'd0  : data[62:0] <= 64'h0000000000000000;
                `DATA_WIDTH'd1  : data[62:0] <= 64'h3f91dfbd9410a422;
                `DATA_WIDTH'd2  : data[62:0] <= 64'h3fa1e12295d61fc2;
                `DATA_WIDTH'd3  : data[62:0] <= 64'h3faad53144273e71;
                `DATA_WIDTH'd4  : data[62:0] <= 64'h3fb1e6b93a693204;
                `DATA_WIDTH'd5  : data[62:0] <= 64'h3fb665a8349d55e1;
                `DATA_WIDTH'd6  : data[62:0] <= 64'h3fbae81c75231d97;
                `DATA_WIDTH'd7  : data[62:0] <= 64'h3fbf6ecf19881d32;
                `DATA_WIDTH'd8  : data[62:0] <= 64'h3fc1fd3df8664fe5;
                `DATA_WIDTH'd9  : data[62:0] <= 64'h3fc445f0fbb1cf91;
                `DATA_WIDTH'd10 : data[62:0] <= 64'h3fc691e1ebc5cbbc;
                `DATA_WIDTH'd11 : data[62:0] <= 64'h3fc8e174375dceb6;
                `DATA_WIDTH'd12 : data[62:0] <= 64'h3fcb350dac76234b;
                `DATA_WIDTH'd13 : data[62:0] <= 64'h3fcd8d16c1491593;
                `DATA_WIDTH'd14 : data[62:0] <= 64'h3fcfe9fae1181f54;
                `DATA_WIDTH'd15 : data[62:0] <= 64'h3fd126145e9ecd56;
                `DATA_WIDTH'd16 : data[62:0] <= 64'h3fd25a0951873b22;
                `DATA_WIDTH'd17 : data[62:0] <= 64'h3fd391176b8feb5a;
                `DATA_WIDTH'd18 : data[62:0] <= 64'h3fd4cb7bfb4961ae;
                `DATA_WIDTH'd19 : data[62:0] <= 64'h3fd60976af8c1613;
                `DATA_WIDTH'd20 : data[62:0] <= 64'h3fd74b49cf3902d4;
                `DATA_WIDTH'd21 : data[62:0] <= 64'h3fd8913a75259d06;
                `DATA_WIDTH'd22 : data[62:0] <= 64'h3fd9db90d0ac0d40;
                `DATA_WIDTH'd23 : data[62:0] <= 64'h3fdb2a986b66229e;
                `DATA_WIDTH'd24 : data[62:0] <= 64'h3fdc7ea074a90a0c;
                `DATA_WIDTH'd25 : data[62:0] <= 64'h3fddd7fc13699ab1;
                `DATA_WIDTH'd26 : data[62:0] <= 64'h3fdf3702bf455cf3;
                `DATA_WIDTH'd27 : data[62:0] <= 64'h3fe04e0850c1dd5c;
                `DATA_WIDTH'd28 : data[62:0] <= 64'h3fe103c37f7ebedc;
                `DATA_WIDTH'd29 : data[62:0] <= 64'h3fe1bce655fbb9bf;
                `DATA_WIDTH'd30 : data[62:0] <= 64'h3fe279a74590331c;
                `DATA_WIDTH'd31 : data[62:0] <= 64'h3fe33a400c85af9d;
                `DATA_WIDTH'd32 : data[62:0] <= 64'h3fe3feee02d72515;
                `DATA_WIDTH'd33 : data[62:0] <= 64'h3fe4c7f26ed1d60d;
                `DATA_WIDTH'd34 : data[62:0] <= 64'h3fe59592e296c624;
                `DATA_WIDTH'd35 : data[62:0] <= 64'h3fe66819a3a0bf7a;
                `DATA_WIDTH'd36 : data[62:0] <= 64'h3fe73fd61d9df543;
                `DATA_WIDTH'd37 : data[62:0] <= 64'h3fe81d1d621eb710;
                `DATA_WIDTH'd38 : data[62:0] <= 64'h3fe9004ab6d5cc92;
                `DATA_WIDTH'd39 : data[62:0] <= 64'h3fe9e9c0346ca838;
                `DATA_WIDTH'd40 : data[62:0] <= 64'h3fead9e7783fbf1d;
                `DATA_WIDTH'd41 : data[62:0] <= 64'h3febd1326bb88d11;
                `DATA_WIDTH'd42 : data[62:0] <= 64'h3fecd01c246e405f;
                `DATA_WIDTH'd43 : data[62:0] <= 64'h3fedd729e0bf9cb7;
                `DATA_WIDTH'd44 : data[62:0] <= 64'h3feee6ec253d2462;
                `DATA_WIDTH'd45 : data[62:0] <= 64'h3fefffffffffffff;
                `DATA_WIDTH'd46 : data[62:0] <= 64'h3ff091883bfbf42d;
                `DATA_WIDTH'd47 : data[62:0] <= 64'h3ff1286c17acf49c;
                `DATA_WIDTH'd48 : data[62:0] <= 64'h3ff1c511a0db83e2;
                `DATA_WIDTH'd49 : data[62:0] <= 64'h3ff267e8b3f5da80;
                `DATA_WIDTH'd50 : data[62:0] <= 64'h3ff3116c3711527e;
                `DATA_WIDTH'd51 : data[62:0] <= 64'h3ff3c2238553dced;
                `DATA_WIDTH'd52 : data[62:0] <= 64'h3ff47aa413b0ee1d;
                `DATA_WIDTH'd53 : data[62:0] <= 64'h3ff53b9359d2f918;
                `DATA_WIDTH'd54 : data[62:0] <= 64'h3ff605a90c73ab78;
                `DATA_WIDTH'd55 : data[62:0] <= 64'h3ff6d9b1b96ce127;
                `DATA_WIDTH'd56 : data[62:0] <= 64'h3ff7b891d9a169b3;
                `DATA_WIDTH'd57 : data[62:0] <= 64'h3ff8a34971bd700d;
                `DATA_WIDTH'd58 : data[62:0] <= 64'h3ff99af8610e4106;
                `DATA_WIDTH'd59 : data[62:0] <= 64'h3ffaa0e385c196a8;
                `DATA_WIDTH'd60 : data[62:0] <= 64'h3ffbb67ae8584ca8;
                `DATA_WIDTH'd61 : data[62:0] <= 64'h3ffcdd612dd501f3;
                `DATA_WIDTH'd62 : data[62:0] <= 64'h3ffe1774a2562592;
                `DATA_WIDTH'd63 : data[62:0] <= 64'h3fff66da45fee3f0;
                `DATA_WIDTH'd64 : data[62:0] <= 64'h40006705b35391e7;
                `DATA_WIDTH'd65 : data[62:0] <= 64'h400127f33e8d12e5;
                `DATA_WIDTH'd66 : data[62:0] <= 64'h4001f7e220cc416f;
                `DATA_WIDTH'd67 : data[62:0] <= 64'h4002d8c9200b5686;
                `DATA_WIDTH'd68 : data[62:0] <= 64'h4003ccfa561175d3;
                `DATA_WIDTH'd69 : data[62:0] <= 64'h4004d738ef803785;
                `DATA_WIDTH'd70 : data[62:0] <= 64'h4005fad570f872d7;
                `DATA_WIDTH'd71 : data[62:0] <= 64'h40073bd2e9a270df;
                `DATA_WIDTH'd72 : data[62:0] <= 64'h40089f188bdcd7ad;
                `DATA_WIDTH'd73 : data[62:0] <= 64'h400a2ab4c713671d;
                `DATA_WIDTH'd74 : data[62:0] <= 64'h400be6398b3f2869;
                `DATA_WIDTH'd75 : data[62:0] <= 64'h400ddb3d742c2656;
                `DATA_WIDTH'd76 : data[62:0] <= 64'h40100b0a2833d3c5;
                `DATA_WIDTH'd77 : data[62:0] <= 64'h4011536e695dda91;
                `DATA_WIDTH'd78 : data[62:0] <= 64'h4012d18a8e2ff28e;
                `DATA_WIDTH'd79 : data[62:0] <= 64'h40149405f7cc6448;
                `DATA_WIDTH'd80 : data[62:0] <= 64'h4016af648056a133;
                `DATA_WIDTH'd81 : data[62:0] <= 64'h4019414813ba6629;
                `DATA_WIDTH'd82 : data[62:0] <= 64'h401c76237b025ae6;
                `DATA_WIDTH'd83 : data[62:0] <= 64'h402049e7c666e3fe;
                `DATA_WIDTH'd84 : data[62:0] <= 64'h4023075ac71a38c8;
                `DATA_WIDTH'd85 : data[62:0] <= 64'h4026dc2fd0bfdbd5;
                `DATA_WIDTH'd86 : data[62:0] <= 64'h402c99f0ed772d54;
                `DATA_WIDTH'd87 : data[62:0] <= 64'h403314c55fbc4c58;
                `DATA_WIDTH'd88 : data[62:0] <= 64'h403ca2e17ec21843;
                `DATA_WIDTH'd89 : data[62:0] <= 64'h404ca51d76749a49;
                `DATA_WIDTH'd90 : data[62:0] <= 64'h7ff0000000000000;
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

