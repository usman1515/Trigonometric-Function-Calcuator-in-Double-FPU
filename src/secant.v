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

endmodule