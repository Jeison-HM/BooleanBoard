`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/15/2024 07:32:16 PM
// Design Name: 
// Module Name: debouncer_tb
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


module debouncer_tb;

reg clk = 0;
reg button = 0;
    
wire press;

debouncer B0 (
    .clk(clk),
    .button(button),
    .press(press)
);

always #5 clk = ~clk;

always
begin
    #11000000 button = ~button;
    #11000000 button = ~button;
    #11000000 button = ~button;
    #11000000 button = ~button;
    #11000000 button = ~button;
    #11000000 button = ~button;
    #11000000 button = ~button;
    #11000000 button = ~button;
    #11000000 button = ~button;
    #11000000 button = ~button;
    #11000000 button = ~button;
    #11000000 button = ~button;
end

endmodule
