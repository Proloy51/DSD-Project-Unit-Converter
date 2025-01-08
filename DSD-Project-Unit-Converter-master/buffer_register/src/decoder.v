`timescale 1ps / 1ps	

module Decoder (
    input [1:0] d,    
    output reg [1:0] next_state
);

    always @(*) begin
        case (d)
            2'b00: next_state = 2'b01; // IDLE to INPUT
            2'b01: next_state = 2'b10; // INPUT to SELECT
            2'b10: next_state = 2'b11; // SELECT to EXEC
            2'b11: next_state = 2'b00; // EXEC to IDLE
            default: next_state = 2'b00; // Default case
        endcase
    end

endmodule
