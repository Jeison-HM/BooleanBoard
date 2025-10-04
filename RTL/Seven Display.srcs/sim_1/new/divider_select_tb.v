`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/17/2024 01:52:17 AM
// Design Name: 
// Module Name: divider_select_tb
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


module divider_select_tb;

reg clk = 0;
reg select = 0;

wire [31:0] out;

divider_select U1 (
    .clk(clk),
    .select(select),
    .out(out)
);

always #5 clk = ~clk;

always
begin
    #20 select = 0;
    #20 select = 1;
    #20 select = 2;
    #20 select = 3;
    #20 select = 0;
    #20 select = 1;
    #20 select = 2;
    #20 select = 3;
end

endmodule
