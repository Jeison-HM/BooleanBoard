`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/14/2024 01:56:04 PM
// Design Name: 
// Module Name: seg_symbols_tb
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


module seg_symbols_tb;

reg [3:0] select;
wire [7:0] out;

seg_symbols M0 (
    .select(select),
    .out(out)
);

always
begin
    #10 select = 0;
    #10 select = 1;
    #10 select = 2;
    #10 select = 3;
    #10 select = 4;
    #10 select = 0;
end

endmodule
