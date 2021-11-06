`include "src/defines.v"
`timescale 1ns/100ps

module tb_divider;

// -------------------------------------------------------- parameters
localparam T = 2;

// -------------------------------------------------------- IO
reg     clk;
reg     reset_n;
reg     en_divider;
reg     [`DATA_WIDTH-1:0]   data_in;
wire    [1:0]               quadrant;
wire    [`DATA_WIDTH-1:0]   data_out;

// -------------------------------------------------------- module instantiation
divider DUT_divider(
    .clk        (clk        ),
    .reset_n    (reset_n    ),
    .en_divider (en_divider ),
    .data_in    (data_in    ),
    .quadrant   (quadrant   ),
    .data_out   (data_out   )
);

// -------------------------------------------------------- clk generator
always begin
    #(T/2) clk = 1'b0;
    #(T/2) clk = 1'b1;
end

// -------------------------------------------------------- main loop
initial begin
    // --------------------------------------- reset module
    $display("-----------------------------------------------------------------\n");
    repeat(2) @(posedge clk) begin
        reset_n = 1'b0;
        reset_n = 1'b1;
    end
    
    // --------------------------------------- send 20 random inputs > 360
    @(posedge clk) reset_n = 1'b0;
	@(posedge clk) reset_n = 1'b1;
    $display("-----------------------------------------------------------------\n");
    repeat(20) begin
        @(posedge clk) begin
            reset_n = 1'b1;
            en_divider = 1'b1;
            data_in = `DATA_WIDTH'd360 + {$random} % (`DATA_WIDTH'hffffffff - `DATA_WIDTH'd360);
        end
        #T $display("Input angle [%10d] | Quadrant [%2d] | Data output [%3d]",data_in,quadrant,data_out);
    end
    
    // --------------------------------------- send 20 random inputs 181 < x < 360
    @(posedge clk) reset_n = 1'b0;
	@(posedge clk) reset_n = 1'b1;
    $display("-----------------------------------------------------------------\n");
    repeat(20) begin
        @(posedge clk) begin
            reset_n = 1'b1;
            en_divider = 1'b1;
            data_in = `DATA_WIDTH'd181 + {$random} % (`DATA_WIDTH'd360 - `DATA_WIDTH'd181);
        end
        #T $display("Input angle [%3d] | Quadrant [%2d] | Data output [%3d]",data_in,quadrant,data_out);
    end
    
    // --------------------------------------- send 20 random inputs 91 < x < 180
    @(posedge clk) reset_n = 1'b0;
	@(posedge clk) reset_n = 1'b1;
    $display("-----------------------------------------------------------------\n");
    repeat(20) begin
        @(posedge clk) begin
            reset_n = 1'b1;
            en_divider = 1'b1;
            data_in = `DATA_WIDTH'd91 + {$random} % (`DATA_WIDTH'd180 - `DATA_WIDTH'd91);
        end
        #T $display("Input angle [%3d] | Quadrant [%2d] | Data output [%3d]",data_in,quadrant,data_out);
    end
    
    // --------------------------------------- send 20 random inputs < 90
    @(posedge clk) reset_n = 1'b0;
	@(posedge clk) reset_n = 1'b1;
    $display("-----------------------------------------------------------------\n");
    repeat(20) begin
        @(posedge clk) begin
            reset_n = 1'b1;
            en_divider = 1'b1;
            data_in = `DATA_WIDTH'd0 + {$random} % (`DATA_WIDTH'd90 - `DATA_WIDTH'd0);
        end
        #T $display("Input angle [%3d] | Quadrant [%2d] | Data output [%3d]",data_in,quadrant,data_out);
    end
    
    $finish;
end

// -------------------------------------------------------- dump vcd
initial begin
    $dumpfile("bin/tb_divider.vcd");
    $dumpvars(0,DUT_divider);
end

// -------------------------------------------------------- end of module

endmodule
