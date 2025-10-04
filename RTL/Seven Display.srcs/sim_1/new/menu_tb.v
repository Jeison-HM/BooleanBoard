`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/16/2024 07:51:54 PM
// Design Name: 
// Module Name: menu_tb
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

module menu_tb;

reg clk = 0;
reg clk_anim = 0;
reg reset = 0;
reg next = 0;
reg enter = 0;
reg back = 0;

wire [39:0] word;
wire [1:0] menu;
wire [4:0] sel_sym;
wire [2:0] sel_digit;
wire [39:0] saved_word;
wire pause;

menu U0 (
    .clk(clk),
    .clk_anim(clk_anim),
    .reset(reset),
    .next(next),
    .enter(enter),
    .back(back),
    .word(word),
    .menu(menu),
    .sel_sym(sel_sym),
    .sel_digit(sel_digit),
    .saved_word(saved_word),
    .pause(pause)
);

always #1 clk = ~clk;
always #5 clk_anim = ~clk_anim;

always
begin
    #20 next = ~next;
    #5 next = ~next;
    //
    #20 next = ~next;
    #5 next = ~next;
    #20 next = ~next;
    #5 next = ~next;
    #20 next = ~next;
    #5 next = ~next;
    //
    #20 enter = ~enter;
    #5 enter = ~enter;
    //
    #20 next = ~next;
    #5 next = ~next;
    #20 next = ~next;
    #5 next = ~next;
    #20 next = ~next;
    #5 next = ~next;
    #20 back = ~back;
    #5 back = ~back;
    //
    #20 enter = ~enter;
    #5 enter = ~enter;
    //
    #20 next = ~next;
    #5 next = ~next;
    #20 next = ~next;
    #5 next = ~next;
    #20 next = ~next;
    #5 next = ~next;
    #20 next = ~next;
    #5 next = ~next;
    #20 back = ~back;
    #5 back = ~back;
    //
    #20 next = ~next;
    #5 next = ~next;
    #20 next = ~next;
    #5 next = ~next;
    #20 next = ~next;
    #5 next = ~next;
    //
    #20 enter = ~enter;
    #5 enter = ~enter;
    //
    #20 next = ~next;
    #5 next = ~next;
    #20 next = ~next;
    #5 next = ~next;
    #20 next = ~next;
    #5 next = ~next;
    //
    #20 enter = ~enter;
    #5 enter = ~enter;
    //
    #20 reset = ~reset;
    #5 reset = ~reset;
    //
    #20 next = ~next;
    #5 next = ~next;
    //
    #20 enter = ~enter;
    #5 enter = ~enter;
    //
    #20 next = ~next;
    #5 next = ~next;
    #20 enter = ~enter;
    #5 enter = ~enter;
    #20 enter = ~enter;
    #5 enter = ~enter;
    #20 next = ~next;
    #5 next = ~next;
    #20 enter = ~enter;
    #5 enter = ~enter;
    #20 next = ~next;
    #5 next = ~next;
    #20 next = ~next;
    #5 next = ~next;
    #20 enter = ~enter;
    #5 enter = ~enter;
end

endmodule
