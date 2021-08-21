`include "src/defines.v"
`timescale 1ns/100ps

module divider (
    input wire                      clk,
    input wire                      reset_n,
    input wire                      en_divider,
    input wire [`DATA_WIDTH-1 : 0]  data_in,
    output reg [1:0]                quadrant,
    output reg [`DATA_WIDTH-1 : 0]  data_out
);

wire [`DATA_WIDTH-1:0] divisor = `DATA_WIDTH'd360;

always @(posedge clk ) begin
    if (reset_n) begin
        if (en_divider) begin
            data_out <= data_in % divisor;
			// --------------------------------------- 
			if(data_out >= 'd0 && data_out <= 'd90 || data_out == 'd360)
                quadrant <= 2'd0;
			else if(data_out >= 'd91 && data_out <= 'd180)
                quadrant <= 2'd1;
			else if(data_out >= 'd181 && data_out <= 'd270)
                quadrant <= 2'd2;
			else if(data_out >= 'd271 && data_out < 'd360)
                quadrant <= 2'd3;
        end
        else begin
            data_out <= 'dz;
            quadrant <= 'dz;
        end
    end
    else begin
        data_out <= 'dz;
        quadrant <= 'dz;
    end
end

endmodule
