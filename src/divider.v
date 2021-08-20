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
			if(data_in >= 'd0 && data_in <= 'd90) begin
                quadrant <= 2'd0;
			end
			else if(data_in >= 'd91 && data_in <= 'd180) begin
                quadrant <= 2'd1;
				// $display("Input angle [%3d] | Quadrant [%2d] | Data output [%3d]",data_in,quadrant,data_out);
			end
			else if(data_in >= 'd181 && data_in <= 'd270) begin
                quadrant <= 2'd2;
				// $display("Input angle [%3d] | Quadrant [%2d] | Data output [%3d]",data_in,quadrant,data_out);
			end
			else if(data_in >= 'd271 && data_in <= 'd360) begin
                quadrant <= 2'd3;
				//$display("Input angle [%3d] | Quadrant [%2d] | Data output [%3d]",data_in,quadrant,data_out);
			end
            $display("Input angle [%3d] | Quadrant [%2d] | Data output [%3d]",data_in,quadrant,data_out);
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
