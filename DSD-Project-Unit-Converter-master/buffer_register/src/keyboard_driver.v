//-----------------------------------------------------------------------------
//
// Title       : keyboard_driver
// Design      : buffer_register
// Author      : Topu
// Company     : abv
//
//-----------------------------------------------------------------------------
//
// File        : C:/Users/Topu/Downloads/Compressed/DSD-Project-Unit-Converter-master/buffer_register/src/keyboard_driver.v
// Generated   : Wed Jan  8 22:51:47 2025
// From        : Interface description file
// By          : ItfToHdl ver. 1.0
//
//-----------------------------------------------------------------------------
//
// Description : 
//
//-----------------------------------------------------------------------------		 

`timescale 1ps / 1ps

module keyboard_driver #(parameter DATA_WIDTH = 16) (
    input [DATA_WIDTH-1:0] data, // User-defined data input
    output reg is_ip_given       // Flag to check if input is valid
);

    // Combinational logic to check if the input is zero
    always @(*) begin
        if (data == 0)
            is_ip_given = 0;
        else
            is_ip_given = 1;
    end

endmodule