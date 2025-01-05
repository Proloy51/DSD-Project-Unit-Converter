//-----------------------------------------------------------------------------
//
// Title       : control_unit
// Design      : buffer_register
// Author      : proloykarmakar2022@outlook.com
// Company     : KUET
//
//-----------------------------------------------------------------------------
//
// File        : C:/Users/prolo/OneDrive/Desktop/4-2/DSD Lab/buffer_register/buffer_register/src/control_unit.v
// From        : Interface description file
// By          : ItfToHdl ver. 1.0
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------

`timescale 1ps / 1ps


module ControlLogic (
    input clk,              
    input rst,             , 
    input start, valid_invalid, is_ip_given,                        
    output reg [1:0] state  
);


	wire IDLE, INPUT, SELECT, EXEC;
	assign IDLE = (state == 2'b00);
	assign INPUT = (state == 2'b01);
	assign SELECT = (state == 2'b10);
	assign EXEC = (state == 2'b11);
	
	
    wire D1, D0;
	
    assign D1 = (INPUT & is_ip_given) | (SELECT & valid_invalid); 
    assign D0 = (IDLE & start) + (SELECT & valid_invalid);
  

    always @(posedge clk or posedge rst) begin
        if (rst) begin
		   state <= IDLE;
        end if(clk == 1 && rst == 0) begin
            state <= {D1, D0};
        end
    end

endmodule
