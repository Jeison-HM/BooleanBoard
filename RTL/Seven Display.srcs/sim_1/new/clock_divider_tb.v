`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/12/2024 06:56:17 PM
// Design Name: 
// Module Name: clock_divider_tb
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


module clock_divider_tb;
reg clk = 0;                 // 100 MHz
reg [31:0] divider = 49;
wire [1:0] divided_clk;
integer multiplier [3:0];

initial
begin
    multiplier[0] = 1;
    multiplier[1] = 2;
end

clock_divider C0 (
    .clk(clk),
    .divider(divider),
    .multiplier(multiplier[0]),
    .divided_clk(divided_clk[0])
);

clock_divider C1 (
    .clk(clk),
    .divider(divider),
    .multiplier(multiplier[1]),
    .divided_clk(divided_clk[1])
);

always #5 clk = ~clk;
endmodule
