//-----------------------------------------------------------------------------
//
// Title       : register_16bit
// Design      : buffer_register
// Author      : proloykarmakar2022@outlook.com
// Company     : KUET
//
//-----------------------------------------------------------------------------
//
// File        : C:/Users/prolo/OneDrive/Desktop/4-2/DSD Lab/buffer_register/buffer_register/src/register_16bit.v
// From        : Interface description file
// By          : ItfToHdl ver. 1.0
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------

`timescale 1ps / 1ps

//{{ Section below this comment is automatically maintained
//    and may be overwritten
//{module {register_16bit}}

module register_16bit (a, q, clk, clear);

	input [15:0] a;       
    input clk, clear;    
    output reg [15:0] q;   

    always @(posedge clk or posedge clear) begin
        if (clear == 1) begin
            q <= 16'b0000000000000000; 
        end else if (clk == 1 && clear == 0) begin
            q <= a;       
        end
    end

endmodule
