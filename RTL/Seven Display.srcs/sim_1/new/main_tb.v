`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/14/2024 02:18:06 PM
// Design Name: 
// Module Name: main_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module main_tb;
reg clk = 0;                    // 100 MHz
reg clk_2 = 0;                  // 50 MHz
always #5 clk = ~clk;
always #10 clk_2 = ~clk_2;

// Symbols memory

reg [3:0] sel_sym;
wire [7:0] symbol;

seg_symbols M0 (
    .select(sel_sym),
    .out(symbol)
);

// State of 7-Segment

reg [3:0] en_display = 4'b1111;         // Enable 7-Segment

// Loop

integer i = 0;

always @(posedge clk)
begin
    if (i < 4) 
    begin
        if (clk_2 == 0)
        begin
            sel_sym = i;
            en_display[i] = 0;
            i = i + 1;
        end
        else
        begin
            en_display = 4'b1111;
        end
    end
    else
    begin
        i = 0;
        en_display = 4'b1111;
    end
end

endmodule
