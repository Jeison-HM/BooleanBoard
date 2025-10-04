`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/16/2024 07:19:02 PM
// Design Name: 
// Module Name: menu
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

`include "macros.v"

module menu(
    input wire home, wire next, wire cancel, wire enter,
    output reg [39:0] word, reg [1:0] menu
    );

reg [1:0] show = 0;

always @(menu)
begin
    if (menu == 0)
    begin
        `word_0 <= `U;
        `word_1 <= `i;
        `word_2 <= `space;
        `word_3 <= `space;
    end
end

always @(posedge next)
begin
    if (menu == 0)
    begin
        if (show == 3)
            show <= 0;
        else
            show <= show + 1;
    end
    else
    begin
        show <= 0;
    end
end

always @(show)
begin
    if (menu == 0)
    begin
    case (show)
        0: begin
            `word_4 <= `F;
            `word_5 <= `r;
            `word_6 <= `A;
            `word_7 <= `S;
        end
        1: begin
            `word_4 <= `P;
            `word_5 <= `i;
            `word_6 <= `n;
            `word_7 <= `G;
        end
        2: begin
            `word_4 <= `G;
            `word_5 <= `A;
            `word_6 <= `n;
            `word_7 <= `E;
        end
        3: begin
            `word_4 <= `S;
            `word_5 <= `E;
            `word_6 <= `n;
            `word_7 <= `d;
        end
        default: begin
            `word_4 <= `space;
            `word_5 <= `space;
            `word_6 <= `space;
            `word_7 <= `space;
        end
    endcase
    end
    else
    begin
        `word_4 <= `space;
        `word_5 <= `space;
        `word_6 <= `space;
        `word_7 <= `space;
    end
end

always @(posedge enter)
begin
    if (menu == 0)
    begin
    case (show)
        0: menu <= 0;
        1: menu <= 1;
        2: menu <= 2;
        3: menu <= 3;
        default: menu <= 0;
    endcase
    end
    else
    begin
        show <= 0;
    end
end

endmodule