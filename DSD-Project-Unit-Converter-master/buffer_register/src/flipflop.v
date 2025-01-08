//-----------------------------------------------------------------------------
//
// Title       : flipflop
// Design      : buffer_register
// Author      : proloykarmakar2022@outlook.com
// Company     : KUET
//
//-----------------------------------------------------------------------------
//
// File        : C:/Users/prolo/OneDrive/Desktop/4-2/DSD Lab/buffer_register/buffer_register/src/flipflop.v
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
//{module {flipflop}}

/*module flipflop (in, out, clk, clear, load, en);
	input in, clk, clear, load, en;
	output out;
	reg out;
	
	always @(posedge clk)
		begin
			if(clear == 1)
				begin
					out = 0;
			end
			
			if(en == 0 && load == 1 && clear == 1)
				begin
					out = 1'bz;
			end
			
			if(


endmodule */


module flipflop(din, clk, q, q_bar);
	input din, clk;
	output q, q_bar;														                                                      
	reg q,q_bar;
	
	always @(posedge clk)
		begin
			q <= din;
			q_bar <= ~din;
		end
endmodule
