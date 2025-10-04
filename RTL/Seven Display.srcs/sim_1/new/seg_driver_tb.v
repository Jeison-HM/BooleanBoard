`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/14/2024 06:29:33 PM
// Design Name: 
// Module Name: seg_driver_tb
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

module seg_driver_tb;

reg clk_1 = 0;
reg clk_2 = 0;
reg [39:0] word;

wire [7:0] out_sym;

wire [2:0] sel_digit;
wire [4:0] sel_sym;
wire [3:0] en_display_1;
wire [3:0] en_display_2;
wire [7:0] display_1;
wire [7:0] display_2;

seg_symbols M0 (
    .select(sel_sym),
    .out(out_sym)
);

seg_driver U0 (
    .clk_1(clk_1),
    .clk_2(clk_2),
    .word(word),
    .out_sym(out_sym),
    .sel_digit(sel_digit),
    .sel_sym(sel_sym),
    .en_display_1(en_display_1),                    // Attach common anodes to en_display
    .en_display_2(en_display_2),
    .display_1(display_1),                     // Attach 7-Segment status to out_symb
    .display_2(display_2)
);

always #49999 clk_1 = ~clk_1;
always #99998 clk_2 = ~clk_2;

initial
begin
word[39:35] = 0;
word[34:30] = 1;
word[29:25] = 2;
word[24:20] = 3;
word[19:15] = 4;
word[14:10] = 5;
word[9:5] = 6;
word[4:0] = 7;
end

endmodule
