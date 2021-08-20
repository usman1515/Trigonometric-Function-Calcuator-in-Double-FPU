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

always @(posedge clk ) begin
    if (reset_n) begin
        if (en_divider) begin
            
        end
        else begin
            
        end
    end
    else begin
        
    end
end

endmodule
