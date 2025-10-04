`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Engineer: Jeison
// 
// Create Date: 07/13/2024 01:51:15 PM
// Module Name: divider_select
// Description: 32 bit Integer Selector
// 
//////////////////////////////////////////////////////////////////////////////////

module divider_select(
    input wire select,
    output reg [31:0] out
    );

reg [31:0] divider [3:0];
integer counter = 0;

initial 
begin
    divider[0] = 49999;          // 1000Hz = 49 999
    divider[1] = 499999;          // 100Hz = 49 999 9
    divider[2] = 4999999;          // 10Hz = 49 999 99
    divider[3] = 49999999;          // 1Hz = 49 999 999
    out = divider[0];
end

always @(posedge select)
begin
    if (counter < 3)
        counter <= counter + 1;
    else
        counter <= 0;
end

always @(counter)
begin
    case (counter)
        0: out <= divider[0];
        1: out <= divider[1];
        2: out <= divider[2];
        3: out <= divider[3];
        default: out <= divider[0];
    endcase
end

endmodule