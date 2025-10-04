`timescale 1ns / 1ps
//////////////////////////////////////////////////////
// 
// Engineer: Jeison
// 
// Create Date: 07/14/2024 04:47:17 PM
// Module Name: seg_driver
// Description: 7 Segment Driver Mealy State Machine
// 
//////////////////////////////////////////////////////

module seg_driver(
    input wire clk_1, wire clk_2, wire [39:0] word, wire [7:0] out_sym,
    output reg [2:0] sel_digit, reg [4:0] sel_sym, reg [3:0] en_display_1, 
    output reg [3:0] en_display_2, reg [7:0] display_1, reg [7:0] display_2
    );

initial
begin
    sel_digit <= 0;
    sel_sym <= 30;           // Select space
    en_display_1 <= 4'hF;    // Turn off 7-Segment
    en_display_2 <= 4'hF;
    display_1 <= 8'hFF;      // Show no symbol
    display_2 <= 8'hFF;
end

// Select the symbol at memory (M0) from the word

always @(clk_1 == 0 & clk_2 == 0) 
begin
    case (sel_digit)
        0: begin
            sel_sym <= word[4:0];
        end
        1: begin
            sel_sym <= word[9:5];
        end
        2: begin
            sel_sym <= word[14:10];
        end
        3: begin
            sel_sym <= word[19:15];
        end
        4: begin
            sel_sym <= word[24:20];
        end
        5: begin
            sel_sym <= word[29:25];
        end
        6: begin
            sel_sym <= word[34:30];
        end
        7: begin
            sel_sym <= word[39:35];
        end
        default: sel_digit <= 0;
    endcase
end

// Enable or disable, and assign symbol to 7-Segment

always @(posedge clk_1) 
begin
    if (clk_2 == 0)
    begin
        case (sel_digit)
            0: begin
                display_1 <= out_sym;       // Assign the symbol
                en_display_1[0] <= 0;       // Show in display
            end
            1: begin
                display_1 <= out_sym;
                en_display_1[1] <= 0;
            end
            2: begin
                display_1 <= out_sym;
                en_display_1[2] <= 0;
            end
            3: begin
                display_1 <= out_sym;
                en_display_1[3] <= 0;
            end
            4: begin
                display_2 <= out_sym;
                en_display_2[0] <= 0;
            end
            5: begin
                display_2 <= out_sym;
                en_display_2[1] <= 0;
            end
            6: begin
                display_2 <= out_sym;
                en_display_2[2] <= 0;
            end
            7: begin
                display_2 <= out_sym;
                en_display_2[3] <= 0;
            end
            default: sel_digit <= 0;
        endcase
    end
    else
    begin
        en_display_1 <= 4'hF;
        en_display_2 <= 4'hF;
        display_1 <= 8'hFF;
        display_2 <= 8'hFF;
    end
end

// Change state (digit selected from 7 segment)

always @(posedge clk_2)
begin
    if (clk_1 == 0)
        if (sel_digit == 7)
            sel_digit <= 0;
        else
            sel_digit <= sel_digit + 1;
    else
        sel_digit <= sel_digit;
end

endmodule