

`timescale 1ps / 1ps

module Ram (
    input [1:0] selection,       // Selection input for conversion
    output reg valid_invalid,    // Valid selection flag
    output reg [1:0] selected    // Selected conversion
);

    // Conversion list stored in RAM
    reg [15:0] conversion_list [1:2];

    initial begin
        conversion_list[1] = "1. KM to M"; // Conversion 1
        conversion_list[2] = "2. M to KM"; // Conversion 2
    end

    // Combinational logic to check if selection is valid
    always @(*) begin
        if (selection == 2'b01) begin
            valid_invalid = 1;
            selected = 2'b01;
        end else if (selection == 2'b10) begin
            valid_invalid = 1;
            selected = 2'b10;
        end else begin
            valid_invalid = 0;
            selected = 2'b00;
        end
    end

endmodule
