`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Engineer: Jeison
// 
// Create Date: 07/13/2024 11:28:02 AM
// Module Name: seg_symbols
// Description: 32 bit Memory based on LUTs
// 
//////////////////////////////////////////////////////////////////////////////////

module seg_symbols(
    input wire [4:0] select,
    output reg [7:0] out
    );

reg [7:0] symbol [0:31];

initial 
begin
out <= 8'hFF;               // Default no symbol

symbol[0] = 8'b10001000;     // A
symbol[1] = 8'b10000011;     // b
symbol[2] = 8'b11000110;     // C
symbol[3] = 8'b10100001;     // d
symbol[4] = 8'b10000110;     // E
symbol[5] = 8'b10001110;     // F
symbol[6] = 8'b11000010;     // G
symbol[7] = 8'b10001001;     // H
symbol[8] = 8'b11111011;     // i
symbol[9] = 8'b11100001;     // J
symbol[10] = 8'b11000111;    // L
symbol[11] = 8'b10101011;    // n
symbol[12] = 8'b10100011;    // o
symbol[13] = 8'b10001100;    // P
symbol[14] = 8'b10011000;    // q
symbol[15] = 8'b10101111;    // r
symbol[16] = 8'b10010010;    // S
symbol[17] = 8'b10000111;    // t
symbol[18] = 8'b11000001;    // U
symbol[19] = 8'b11100011;    // v
symbol[20] = 8'b10010001;    // y

symbol[21] = 8'b11000000;    // 0
symbol[22] = 8'b11111001;    // 1
symbol[23] = 8'b10100100;    // 2
symbol[24] = 8'b10110000;    // 3
symbol[25] = 8'b10011001;    // 4
// symbol[16]                // 5
symbol[26] = 8'b10000010;    // 6
symbol[27] = 8'b11111000;    // 7
symbol[28] = 8'b10000000;    // 8
symbol[29] = 8'b10010000;    // 9

symbol[30] = 8'b11111111;    // space
symbol[31] = 8'b10111111;    // -
end

always @(select)
begin
    case (select)
        0: out <= symbol[0];
        1: out <= symbol[1];
        2: out <= symbol[2];
        3: out <= symbol[3];
        4: out <= symbol[4];
        5: out <= symbol[5];
        6: out <= symbol[6];
        7: out <= symbol[7];
        8: out <= symbol[8];
        9: out <= symbol[9];
        10: out <= symbol[10];
        11: out <= symbol[11];
        12: out <= symbol[12];
        13: out <= symbol[13];
        14: out <= symbol[14];
        15: out <= symbol[15];
        16: out <= symbol[16];
        17: out <= symbol[17];
        18: out <= symbol[18];
        19: out <= symbol[19];
        20: out <= symbol[20];
        21: out <= symbol[21];
        22: out <= symbol[22];
        23: out <= symbol[23];
        24: out <= symbol[24];
        25: out <= symbol[25];
        26: out <= symbol[26];
        27: out <= symbol[27];
        28: out <= symbol[28];
        29: out <= symbol[29];
        30: out <= symbol[30];
        31: out <= symbol[31];
        default: out <= 8'hFF;
    endcase
end

endmodule