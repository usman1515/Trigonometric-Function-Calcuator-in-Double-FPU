`include "src/defines.v"
`timescale 1ns/100ps

module cotangent_LUT (
    input wire                          clk,
    input wire                          reset_n,
    input wire                          en_cotangent,
    input wire [1:0]                    quadrant,
    input wire [`DATA_WIDTH-1 : 0]      data_in,
	output reg [(`DATA_WIDTH*2)-1 : 0]  data_out
);

always @(posedge clk) begin
    if(reset_n) begin
        if (en_cotangent) begin
            if (quadrant == 2'd0 || quadrant == 2'd2)	// Tangent is +ve in 1st and 3nd quadrant
                data_out[63] <= 1'b0;
            else
                data_out[63] <= 1'b1;
			// --------------------------------------- Sine look up table
			case (data_in)
                `DATA_WIDTH'd0  : data_out[62:0] <= 64'h7ff0000000000000;
                `DATA_WIDTH'd1  : data_out[62:0] <= 64'h404ca51d76749a71;
                `DATA_WIDTH'd2  : data_out[62:0] <= 64'h403ca2e17ec2185c;
                `DATA_WIDTH'd3  : data_out[62:0] <= 64'h403314c55fbc4c67;
                `DATA_WIDTH'd4  : data_out[62:0] <= 64'h402c99f0ed772d4c;
                `DATA_WIDTH'd5  : data_out[62:0] <= 64'h4026dc2fd0bfdbe2;
                `DATA_WIDTH'd6  : data_out[62:0] <= 64'h4023075ac71a38c7;
                `DATA_WIDTH'd7  : data_out[62:0] <= 64'h402049e7c666e3fe;
                `DATA_WIDTH'd8  : data_out[62:0] <= 64'h401c76237b025ae8;
                `DATA_WIDTH'd9  : data_out[62:0] <= 64'h4019414813ba662c;
                `DATA_WIDTH'd10 : data_out[62:0] <= 64'h4016af648056a136;
                `DATA_WIDTH'd11 : data_out[62:0] <= 64'h40149405f7cc644c;
                `DATA_WIDTH'd12 : data_out[62:0] <= 64'h4012d18a8e2ff28c;
                `DATA_WIDTH'd13 : data_out[62:0] <= 64'h4011536e695dda95;
                `DATA_WIDTH'd14 : data_out[62:0] <= 64'h40100b0a2833d3c4;
                `DATA_WIDTH'd15 : data_out[62:0] <= 64'h400ddb3d742c2656;
                `DATA_WIDTH'd16 : data_out[62:0] <= 64'h400be6398b3f2869;
                `DATA_WIDTH'd17 : data_out[62:0] <= 64'h400a2ab4c713671e;
                `DATA_WIDTH'd18 : data_out[62:0] <= 64'h40089f188bdcd7b0;
                `DATA_WIDTH'd19 : data_out[62:0] <= 64'h40073bd2e9a270e0;
                `DATA_WIDTH'd20 : data_out[62:0] <= 64'h4005fad570f872d9;
                `DATA_WIDTH'd21 : data_out[62:0] <= 64'h4004d738ef803784;
                `DATA_WIDTH'd22 : data_out[62:0] <= 64'h4003ccfa561175d6;
                `DATA_WIDTH'd23 : data_out[62:0] <= 64'h4002d8c9200b5686;
                `DATA_WIDTH'd24 : data_out[62:0] <= 64'h4001f7e220cc4172;
                `DATA_WIDTH'd25 : data_out[62:0] <= 64'h400127f33e8d12e5;
                `DATA_WIDTH'd26 : data_out[62:0] <= 64'h40006705b35391e8;
                `DATA_WIDTH'd27 : data_out[62:0] <= 64'h3fff66da45fee3f1;
                `DATA_WIDTH'd28 : data_out[62:0] <= 64'h3ffe1774a2562593;
                `DATA_WIDTH'd29 : data_out[62:0] <= 64'h3ffcdd612dd501f4;
                `DATA_WIDTH'd30 : data_out[62:0] <= 64'h3ffbb67ae8584cab;
                `DATA_WIDTH'd31 : data_out[62:0] <= 64'h3ffaa0e385c196ab;
                `DATA_WIDTH'd32 : data_out[62:0] <= 64'h3ff99af8610e4105;
                `DATA_WIDTH'd33 : data_out[62:0] <= 64'h3ff8a34971bd7010;
                `DATA_WIDTH'd34 : data_out[62:0] <= 64'h3ff7b891d9a169b4;
                `DATA_WIDTH'd35 : data_out[62:0] <= 64'h3ff6d9b1b96ce128;
                `DATA_WIDTH'd36 : data_out[62:0] <= 64'h3ff605a90c73ab79;
                `DATA_WIDTH'd37 : data_out[62:0] <= 64'h3ff53b9359d2f919;
                `DATA_WIDTH'd38 : data_out[62:0] <= 64'h3ff47aa413b0ee1e;
                `DATA_WIDTH'd39 : data_out[62:0] <= 64'h3ff3c2238553dcee;
                `DATA_WIDTH'd40 : data_out[62:0] <= 64'h3ff3116c3711527e;
                `DATA_WIDTH'd41 : data_out[62:0] <= 64'h3ff267e8b3f5da82;
                `DATA_WIDTH'd42 : data_out[62:0] <= 64'h3ff1c511a0db83e3;
                `DATA_WIDTH'd43 : data_out[62:0] <= 64'h3ff1286c17acf49b;
                `DATA_WIDTH'd44 : data_out[62:0] <= 64'h3ff091883bfbf42e;
                `DATA_WIDTH'd45 : data_out[62:0] <= 64'h3ff0000000000001;
                `DATA_WIDTH'd46 : data_out[62:0] <= 64'h3feee6ec253d2464;
                `DATA_WIDTH'd47 : data_out[62:0] <= 64'h3fedd729e0bf9cb6;
                `DATA_WIDTH'd48 : data_out[62:0] <= 64'h3fecd01c246e4060;
                `DATA_WIDTH'd49 : data_out[62:0] <= 64'h3febd1326bb88d13;
                `DATA_WIDTH'd50 : data_out[62:0] <= 64'h3fead9e7783fbf1e;
                `DATA_WIDTH'd51 : data_out[62:0] <= 64'h3fe9e9c0346ca839;
                `DATA_WIDTH'd52 : data_out[62:0] <= 64'h3fe9004ab6d5cc93;
                `DATA_WIDTH'd53 : data_out[62:0] <= 64'h3fe81d1d621eb711;
                `DATA_WIDTH'd54 : data_out[62:0] <= 64'h3fe73fd61d9df544;
                `DATA_WIDTH'd55 : data_out[62:0] <= 64'h3fe66819a3a0bf7b;
                `DATA_WIDTH'd56 : data_out[62:0] <= 64'h3fe59592e296c625;
                `DATA_WIDTH'd57 : data_out[62:0] <= 64'h3fe4c7f26ed1d60f;
                `DATA_WIDTH'd58 : data_out[62:0] <= 64'h3fe3feee02d72514;
                `DATA_WIDTH'd59 : data_out[62:0] <= 64'h3fe33a400c85af9f;
                `DATA_WIDTH'd60 : data_out[62:0] <= 64'h3fe279a74590331e;
                `DATA_WIDTH'd61 : data_out[62:0] <= 64'h3fe1bce655fbb9bf;
                `DATA_WIDTH'd62 : data_out[62:0] <= 64'h3fe103c37f7ebedc;
                `DATA_WIDTH'd63 : data_out[62:0] <= 64'h3fe04e0850c1dd5d;
                `DATA_WIDTH'd64 : data_out[62:0] <= 64'h3fdf3702bf455cf5;
                `DATA_WIDTH'd65 : data_out[62:0] <= 64'h3fddd7fc13699ab1;
                `DATA_WIDTH'd66 : data_out[62:0] <= 64'h3fdc7ea074a90a11;
                `DATA_WIDTH'd67 : data_out[62:0] <= 64'h3fdb2a986b66229e;
                `DATA_WIDTH'd68 : data_out[62:0] <= 64'h3fd9db90d0ac0d44;
                `DATA_WIDTH'd69 : data_out[62:0] <= 64'h3fd8913a75259d04;
                `DATA_WIDTH'd70 : data_out[62:0] <= 64'h3fd74b49cf3902d6;
                `DATA_WIDTH'd71 : data_out[62:0] <= 64'h3fd60976af8c1614;
                `DATA_WIDTH'd72 : data_out[62:0] <= 64'h3fd4cb7bfb4961b0;
                `DATA_WIDTH'd73 : data_out[62:0] <= 64'h3fd391176b8feb5b;
                `DATA_WIDTH'd74 : data_out[62:0] <= 64'h3fd25a0951873b22;
                `DATA_WIDTH'd75 : data_out[62:0] <= 64'h3fd126145e9ecd56;
                `DATA_WIDTH'd76 : data_out[62:0] <= 64'h3fcfe9fae1181f52;
                `DATA_WIDTH'd77 : data_out[62:0] <= 64'h3fcd8d16c1491599;
                `DATA_WIDTH'd78 : data_out[62:0] <= 64'h3fcb350dac762348;
                `DATA_WIDTH'd79 : data_out[62:0] <= 64'h3fc8e174375dceba;
                `DATA_WIDTH'd80 : data_out[62:0] <= 64'h3fc691e1ebc5cbbf;
                `DATA_WIDTH'd81 : data_out[62:0] <= 64'h3fc445f0fbb1cf93;
                `DATA_WIDTH'd82 : data_out[62:0] <= 64'h3fc1fd3df8664fe6;
                `DATA_WIDTH'd83 : data_out[62:0] <= 64'h3fbf6ecf19881d32;
                `DATA_WIDTH'd84 : data_out[62:0] <= 64'h3fbae81c75231d96;
                `DATA_WIDTH'd85 : data_out[62:0] <= 64'h3fb665a8349d55ee;
                `DATA_WIDTH'd86 : data_out[62:0] <= 64'h3fb1e6b93a6931ff;
                `DATA_WIDTH'd87 : data_out[62:0] <= 64'h3faad53144273e86;
                `DATA_WIDTH'd88 : data_out[62:0] <= 64'h3fa1e12295d61fd2;
                `DATA_WIDTH'd89 : data_out[62:0] <= 64'h3f91dfbd9410a43b;
                `DATA_WIDTH'd90 : data_out[62:0] <= 64'h0000000000000000;
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
