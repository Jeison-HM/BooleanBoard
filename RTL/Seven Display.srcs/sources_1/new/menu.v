`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Engineer: Jeison
// 
// Create Date: 07/16/2024 07:19:02 PM
// Module Name: menu 
// Description: Menu Mealy State Machine
// 
//////////////////////////////////////////////////////////////////////////////////

`include "macros.v"

module menu(
    input wire clk, wire clk_anim, wire reset, wire next, wire enter, wire back,
    output reg [39:0] word, reg [1:0] menu, reg [4:0] sel_sym, reg [2:0] sel_digit, reg [39:0] saved_word, reg pause
    );

initial
begin
    menu <= 0;
    sel_sym <= 0;
    sel_digit <= 0;
    pause <= 0;
    //
    saved_word[39:35] <= `H;
    saved_word[34:30] <= `o;
    saved_word[29:25] <= `L;
    saved_word[24:20] <= `A;
    saved_word[19:15] <= `space;
    saved_word[14:10] <= `space;
    saved_word[9:5] <= `space;
    saved_word[4:0] <= `space;
    //
    `word_0 <= `H;
    `word_1 <= `o;
    `word_2 <= `L;
    `word_3 <= `A;
    `word_4 <= `space;
    `word_5 <= `space;
    `word_6 <= `space;
    `word_7 <= `space;
end

// Next Button: sel_digit, sel_sym

always @(posedge next, posedge back, posedge reset)
begin
    if (reset)
    begin
        sel_digit <= 0;
        sel_sym <= 0;
    end
    else if (back)
        sel_sym <= 0;
    else
    begin
        case (menu)
            1: begin
                if (sel_digit == 7)
                    sel_digit <= 0;
                else
                    sel_digit <= sel_digit + 1;
            end
            2: begin
                if (sel_sym == 31)
                    sel_sym <= 0;
                else
                    sel_sym <= sel_sym + 1;
            end
            default: menu <= menu;
        endcase
    end
end

// Enter Button: saved_word

always @(posedge next, posedge enter, posedge back, posedge reset)
begin
    if (reset)
    begin
        pause <= 0;
        saved_word[39:35] <= `H;
        saved_word[34:30] <= `o;
        saved_word[29:25] <= `L;
        saved_word[24:20] <= `A;
        saved_word[19:15] <= `space;
        saved_word[14:10] <= `space;
        saved_word[9:5] <= `space;
        saved_word[4:0] <= `space;
    end
    else if (back)
        pause <= 0;
    else if (next)
        pause <= 0;
    else
    begin
        if (menu == 2)
        begin
            pause <= 1;
            case (sel_digit) 
            // Saves the sel_sym to saved_word
                0: begin 
                    saved_word[39:35] <= sel_sym;
                end
                1: begin
                    saved_word[34:30] <= sel_sym;
                end
                2: begin
                    saved_word[29:25] <= sel_sym;
                end
                3: begin
                    saved_word[24:20] <= sel_sym;
                end
                4: begin
                    saved_word[19:15] <= sel_sym;
                end
                5: begin
                    saved_word[14:10] <= sel_sym;
                end
                6: begin
                    saved_word[9:5] <= sel_sym;
                end
                7: begin
                    saved_word[4:0] <= sel_sym;
                end
                default: sel_digit <= 0;
            endcase
        end
    end
end

// Change menu state upon button edge

always @(posedge next, posedge enter, posedge back, posedge reset)
begin
    if (reset)
    begin
        menu <= 0;
    end
    else if (next)
    begin
        case (menu)
            0: menu <= 1;
            default: menu <= menu;
        endcase
    end
    else if (enter)
    begin
        case (menu)
            1: menu <= 2;
            default: menu <= menu;
        endcase
    end
    else if (back)
    begin
        case (menu)
            1: menu <= 0;
            2: menu <= 1;
            default: menu <= menu;
        endcase
    end
end

// Refresh 7 sel_digit display every clk cycle

always @(posedge clk)
begin
    case (menu)
        0: // Updates display menu in 0 by retrieving from saved_word
        begin
            `word_0 <= saved_word[39:35];
            `word_1 <= saved_word[34:30];
            `word_2 <= saved_word[29:25];
            `word_3 <= saved_word[24:20];
            `word_4 <= saved_word[19:15];
            `word_5 <= saved_word[14:10];
            `word_6 <= saved_word[9:5];
            `word_7 <= saved_word[4:0];
        end
        1: // Updates cursor in 1 and retrieves saved sel_sym on saved_word
        begin
            if (clk_anim && pause == 0)
            begin
                case (sel_digit)
                    0: begin
                        `word_0 <= `dash;
                        `word_1 <= saved_word[34:30];
                        `word_2 <= saved_word[29:25];
                        `word_3 <= saved_word[24:20];
                        `word_4 <= saved_word[19:15];
                        `word_5 <= saved_word[14:10];
                        `word_6 <= saved_word[9:5];
                        `word_7 <= saved_word[4:0];
                    end
                    1: begin
                        `word_0 <= saved_word[39:35];
                        `word_1 <= `dash;
                        `word_2 <= saved_word[29:25];
                        `word_3 <= saved_word[24:20];
                        `word_4 <= saved_word[19:15];
                        `word_5 <= saved_word[14:10];
                        `word_6 <= saved_word[9:5];
                        `word_7 <= saved_word[4:0];
                    end
                    2: begin
                        `word_0 <= saved_word[39:35];
                        `word_1 <= saved_word[34:30];
                        `word_2 <= `dash;
                        `word_3 <= saved_word[24:20];
                        `word_4 <= saved_word[19:15];
                        `word_5 <= saved_word[14:10];
                        `word_6 <= saved_word[9:5];
                        `word_7 <= saved_word[4:0];
                    end
                    3: begin
                        `word_0 <= saved_word[39:35];
                        `word_1 <= saved_word[34:30];
                        `word_2 <= saved_word[29:25];
                        `word_3 <= `dash;
                        `word_4 <= saved_word[19:15];
                        `word_5 <= saved_word[14:10];
                        `word_6 <= saved_word[9:5];
                        `word_7 <= saved_word[4:0];
                    end
                    4: begin
                        `word_0 <= saved_word[39:35];
                        `word_1 <= saved_word[34:30];
                        `word_2 <= saved_word[29:25];
                        `word_3 <= saved_word[24:20];
                        `word_4 <= `dash;
                        `word_5 <= saved_word[14:10];
                        `word_6 <= saved_word[9:5];
                        `word_7 <= saved_word[4:0];
                    end
                    5: begin
                        `word_0 <= saved_word[39:35];
                        `word_1 <= saved_word[34:30];
                        `word_2 <= saved_word[29:25];
                        `word_3 <= saved_word[24:20];
                        `word_4 <= saved_word[19:15];
                        `word_5 <= `dash;
                        `word_6 <= saved_word[9:5];
                        `word_7 <= saved_word[4:0];
                    end
                    6: begin
                        `word_0 <= saved_word[39:35];
                        `word_1 <= saved_word[34:30];
                        `word_2 <= saved_word[29:25];
                        `word_3 <= saved_word[24:20];
                        `word_4 <= saved_word[19:15];
                        `word_5 <= saved_word[14:10];
                        `word_6 <= `dash;
                        `word_7 <= saved_word[4:0];
                    end
                    7: begin
                        `word_0 <= saved_word[39:35];
                        `word_1 <= saved_word[34:30];
                        `word_2 <= saved_word[29:25];
                        `word_3 <= saved_word[24:20];
                        `word_4 <= saved_word[19:15];
                        `word_5 <= saved_word[14:10];
                        `word_6 <= saved_word[9:5];
                        `word_7 <= `dash;
                    end
                    default: sel_digit <= 0;
                endcase
            end
            else
            begin
                case (sel_digit)
                    0: begin
                        `word_0 <= saved_word[39:35];
                        `word_1 <= saved_word[34:30];
                        `word_2 <= saved_word[29:25];
                        `word_3 <= saved_word[24:20];
                        `word_4 <= saved_word[19:15];
                        `word_5 <= saved_word[14:10];
                        `word_6 <= saved_word[9:5];
                        `word_7 <= saved_word[4:0];
                    end
                    1: begin
                        `word_0 <= saved_word[39:35];
                        `word_1 <= saved_word[34:30];
                        `word_2 <= saved_word[29:25];
                        `word_3 <= saved_word[24:20];
                        `word_4 <= saved_word[19:15];
                        `word_5 <= saved_word[14:10];
                        `word_6 <= saved_word[9:5];
                        `word_7 <= saved_word[4:0];
                    end
                    2: begin
                        `word_0 <= saved_word[39:35];
                        `word_1 <= saved_word[34:30];
                        `word_2 <= saved_word[29:25];
                        `word_3 <= saved_word[24:20];
                        `word_4 <= saved_word[19:15];
                        `word_5 <= saved_word[14:10];
                        `word_6 <= saved_word[9:5];
                        `word_7 <= saved_word[4:0];
                    end
                    3: begin
                        `word_0 <= saved_word[39:35];
                        `word_1 <= saved_word[34:30];
                        `word_2 <= saved_word[29:25];
                        `word_3 <= saved_word[24:20];
                        `word_4 <= saved_word[19:15];
                        `word_5 <= saved_word[14:10];
                        `word_6 <= saved_word[9:5];
                        `word_7 <= saved_word[4:0];
                    end
                    4: begin
                        `word_0 <= saved_word[39:35];
                        `word_1 <= saved_word[34:30];
                        `word_2 <= saved_word[29:25];
                        `word_3 <= saved_word[24:20];
                        `word_4 <= saved_word[19:15];
                        `word_5 <= saved_word[14:10];
                        `word_6 <= saved_word[9:5];
                        `word_7 <= saved_word[4:0];
                    end
                    5: begin
                        `word_0 <= saved_word[39:35];
                        `word_1 <= saved_word[34:30];
                        `word_2 <= saved_word[29:25];
                        `word_3 <= saved_word[24:20];
                        `word_4 <= saved_word[19:15];
                        `word_5 <= saved_word[14:10];
                        `word_6 <= saved_word[9:5];
                        `word_7 <= saved_word[4:0];
                    end
                    6: begin
                        `word_0 <= saved_word[39:35];
                        `word_1 <= saved_word[34:30];
                        `word_2 <= saved_word[29:25];
                        `word_3 <= saved_word[24:20];
                        `word_4 <= saved_word[19:15];
                        `word_5 <= saved_word[14:10];
                        `word_6 <= saved_word[9:5];
                        `word_7 <= saved_word[4:0];
                    end
                    7: begin
                        `word_0 <= saved_word[39:35];
                        `word_1 <= saved_word[34:30];
                        `word_2 <= saved_word[29:25];
                        `word_3 <= saved_word[24:20];
                        `word_4 <= saved_word[19:15];
                        `word_5 <= saved_word[14:10];
                        `word_6 <= saved_word[9:5];
                        `word_7 <= saved_word[4:0];
                    end
                    default: sel_digit <= 0;
                endcase
            end
        end
        2: // Updates and displays the sel_sym selected upon sel_digit change
        begin
            if (clk_anim && pause == 0)
            begin
                case (sel_digit)
                    0: `word_0 <= `space;
                    1: `word_1 <= `space;
                    2: `word_2 <= `space;
                    3: `word_3 <= `space;
                    4: `word_4 <= `space;
                    5: `word_5 <= `space;
                    6: `word_6 <= `space;
                    7: `word_7 <= `space;
                    default: sel_digit <= 0;
                endcase
            end
            else
            begin
                case (sel_digit)
                    0: `word_0 <= sel_sym;
                    1: `word_1 <= sel_sym;
                    2: `word_2 <= sel_sym;
                    3: `word_3 <= sel_sym;
                    4: `word_4 <= sel_sym;
                    5: `word_5 <= sel_sym;
                    6: `word_6 <= sel_sym;
                    7: `word_7 <= sel_sym;
                    default: sel_digit <= 0;
                endcase
            end
        end
        default: menu <= menu;
    endcase
end

endmodule