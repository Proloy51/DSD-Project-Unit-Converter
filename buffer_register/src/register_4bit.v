//-----------------------------------------------------------------------------
//
// Title       : register
// Design      : buffer_register
// Author      : proloykarmakar2022@outlook.com
// Company     : KUET
//
//-----------------------------------------------------------------------------
//
// File        : C:/Users/prolo/OneDrive/Desktop/4-2/DSD Lab/buffer_register/buffer_register/src/register.v
// From        : Interface description file
// By          : ItfToHdl ver. 1.0
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------

/*`timescale 1ps / 1ps


module register (a0, a1, a2, a3, q0, q1, q2, q3, clk, clear);
	input a0, a1, a2, a3, clk, clear;
	output q0, q1, q2, q3;
	reg q0, q1, q2, q3;
	
	always @(posedge clk or posedge clear)
		begin
			if(clear == 1)
				begin
					q0 <= 0;
					q1 <= 0;
					q2 <= 0;
					q3 <= 0;
			end
					
			
			else if(clk==1 && clear == 0)
				begin
					q0 <= a0;
					q1 <= a1;
					q2 <= a2;
					q3 <= a3;
				end
		end
endmodule
*/


`timescale 1ps / 1ps

module register_4bit (a, q, clk, clear);
    input [3:0] a;        
    input clk, clear;     
    output reg [3:0] q;   

    always @(posedge clk or posedge clear) begin
        if (clear == 1) begin
            q <= 4'b0000; 
        end else if (clk == 1 && clear == 0) begin
            q <= a;      
        end
    end
endmodule


