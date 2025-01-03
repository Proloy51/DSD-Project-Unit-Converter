//-----------------------------------------------------------------------------
//
// Title       : bread_board
// Design      : buffer_register
// Author      : proloykarmakar2022@outlook.com
// Company     : KUET
//
//-----------------------------------------------------------------------------
//
// File        : C:/Users/prolo/OneDrive/Desktop/4-2/DSD Lab/buffer_register/buffer_register/src/bread_board.v
// From        : Interface description file
// By          : ItfToHdl ver. 1.0
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------


`timescale 1ps / 1ps

module bread_board ();	
    reg clk;            
    reg rst;           
    reg [1:0] conversion_type;
    reg start;        
    reg [15:0] input_value;
    wire [3:0] alu_op;   
    wire [15:0] factor; 
    wire [15:0] value; 
    wire ready;         
    wire [1:0] state;

    ControlLogic cl (
        .clk(clk),
        .rst(rst),
        .conversion_type(conversion_type),
        .start(start),
        .input_value(input_value),
        .alu_op(alu_op),
        .factor(factor),
        .value(value),
        .ready(ready),
        .state(state)
    );

    initial begin
        clk <= 0;
        rst <= 1;
        conversion_type <= 2'b00;
        start <= 1;
        input_value <= 16'd1;

        #1;
        $display("Alu_OP = %b, Factor = %b, Value = %b , Ready = %b, State = %b", alu_op, factor, value, ready, state);
    end

endmodule



