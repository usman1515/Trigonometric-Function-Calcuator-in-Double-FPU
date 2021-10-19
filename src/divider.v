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
reg [`DATA_WIDTH-1:0] divider_out; //quotient

reg [`DATA_WIDTH-1:0] degrees_tmp1;
reg [`DATA_WIDTH-1:0] degrees_tmp2;


always @(posedge clk ) begin
    if (reset_n) begin
        if (en_divider) begin
            divider_out <= data_in % divisor;
            // --------------------------------------- if input_val > 360
            if (data_in > `DATA_WIDTH'd360) begin
                if (divider_out > `DATA_WIDTH'd270) begin
                    quadrant <= 2'b11;
                    data_out <= divider_out - `DATA_WIDTH'd270;
                end
                else if (divider_out > `DATA_WIDTH'd180 && (divider_out < `DATA_WIDTH'd270 || divider_out == `DATA_WIDTH'd270)) begin
                    quadrant <= 2'b10;
                    data_out <= divider_out - `DATA_WIDTH'd180;
                end
                else if (divider_out > `DATA_WIDTH'd90 && (divider_out < `DATA_WIDTH'd180 || divider_out == `DATA_WIDTH'd180)) begin
                    data_out <= `DATA_WIDTH'd180 - divider_out;
                    quadrant <= 2'b01;
                end
                else begin
                    data_out <= divider_out;
                    quadrant <= 2'b00;
                end
            end
            // --------------------------------------- if 181 < input_val < 360
            else if (data_in > `DATA_WIDTH'd180 && (data_in < `DATA_WIDTH'd360 || data_in == `DATA_WIDTH'd360)) begin
                degrees_tmp1 <= data_in - `DATA_WIDTH'd180;
                if(degrees_tmp1 >`DATA_WIDTH'd90) begin
                    quadrant <= 2'b11;
                    data_out <= `DATA_WIDTH'd180 - degrees_tmp1;
                end
                else begin
                    quadrant <= 2'b10;
                    data_out <= degrees_tmp1;
                end
            end
            // --------------------------------------- if 91 < input_val < 180
            else if (data_in > `DATA_WIDTH'd90 && (data_in < `DATA_WIDTH'd180 || data_in == `DATA_WIDTH'd180)) begin
                quadrant <= 2'b01;
                data_out <= `DATA_WIDTH'd180 - data_in;
            end
            // --------------------------------------- if input_val < 90
            else begin
                quadrant <= 2'b00;
                data_out <= data_in;
            end
            // --------------------------------------- 
        end
        else;
    end
    else;
end

endmodule
