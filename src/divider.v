`include "src/defines.v"
`timescale 1ns/100ps

module divider (
    input wire                      clk,
    input wire                      reset_n,
    input wire                      en_divider,
    input wire [`DATA_WIDTH-1 : 0]  data_in,
    //output reg [1:0]                quadrant,
    output reg [`DATA_WIDTH-1 : 0]  data_out
);

wire [`DATA_WIDTH-1:0] divisor = `DATA_WIDTH'd360;
wire [`DATA_WIDTH-1:0] divider_out; //quotient

always @(posedge clk ) begin
    if (reset_n) begin
        if (en_divider) begin
            data_out <= data_in % divisor;
        end
    end
end

endmodule
