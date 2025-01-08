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

/*
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

*/


`timescale 1ps / 1ps

module control_logic (
    input clk,                   // Clock signal
    input rst,                   // Reset signal
    input is_ip_given,           // Input validity flag
    input start,                 // Start signal
    input valid_invalid,         // Valid selection flag
    output reg [1:0] state       // Current state
);

    // State parameters
    localparam IDLE   = 2'b00;
    localparam INPUT  = 2'b01;
    localparam SELECT = 2'b10;
    localparam EXEC   = 2'b11;

    reg [1:0] next_state; // Next-state logic

    // Combinational logic for next-state determination
    always @(*) begin
        case (state)
            IDLE: begin
                if (start)
                    next_state = INPUT;
                else
                    next_state = IDLE;
            end

            INPUT: begin
                if (is_ip_given)
                    next_state = SELECT;
                else
                    next_state = INPUT;
            end

            SELECT: begin
                if (valid_invalid)
                    next_state = EXEC;
                else
                    next_state = IDLE;
            end

            EXEC: begin
                next_state = IDLE;
            end

            default: next_state = IDLE;
        endcase
    end

    // Sequential logic for state updates
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE; // Reset to IDLE state
        end else begin
            state <= next_state; // Update to the next state
        end
    end

endmodule


