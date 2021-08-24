`include "src/defines.v"
`timescale 1ns/100ps

module tb_secant;

// -------------------------------------------------------- parameters
localparam T = 2;
integer min1 = `DATA_WIDTH'd0;
integer max1 = `DATA_WIDTH'd360;
integer unsigned num1 = 0;

// -------------------------------------------------------- IO
reg     clk;
reg     reset_n;
reg     en_secant;
reg     [1:0]                    quadrant;
reg     [`DATA_WIDTH-1 : 0]      data_in;
wire    [(`DATA_WIDTH*2)-1 : 0]  data_out;

// -------------------------------------------------------- module instantiation

// -------------------------------------------------------- clk generator
always begin
    #(T/2) clk = 1'b0;
    #(T/2) clk = 1'b1;
end

// -------------------------------------------------------- main loop

// -------------------------------------------------------- dump vcd
initial begin
    $dumpfile("bin/tb_secant.vcd");
    $dumpvars(0,DUT_secantLUT);
end

// -------------------------------------------------------- end of module

endmodule
