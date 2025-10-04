`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Engineer: Jeison
// 
// Create Date: 07/12/2024 06:20:02 PM
// Module Name: clock
// Description: Counter Based Clock Divider
// 
//////////////////////////////////////////////////////////////////////////////////

module clock_divider(
    input wire clk, wire [31:0] divider, wire [31:0] multiplier,
    output reg divided_clk = 0
    );

integer counter = 0;                    // 32 bit register

always @(posedge clk)
begin
    if (counter == divider * multiplier)
    begin
        divided_clk <= ~divided_clk;    // Flip the signal
        counter <= 0;                   // Reset counter
    end
    else
    begin
        counter <= counter + 1;
        divided_clk <= divided_clk;     // Hold signal
    end
end

endmodule