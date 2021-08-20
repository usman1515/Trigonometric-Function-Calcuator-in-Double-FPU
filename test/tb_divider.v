`include "src/defines.v"
`timescale 1ns/100ps

module tb_divider;

// -------------------------------------------------------- parameters
localparam T = 2;
integer min1 = `DATA_WIDTH'd0;
integer max1 = `DATA_WIDTH'd720;
integer num1 = 0;

// -------------------------------------------------------- IO

// -------------------------------------------------------- module instantiation

// -------------------------------------------------------- clk generator
always begin
    #(T/2) clk = 1'b0;
    #(T/2) clk = 1'b1;
end

// -------------------------------------------------------- main loop

// -------------------------------------------------------- end of module


endmodule