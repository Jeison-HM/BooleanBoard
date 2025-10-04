`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Engineer: Jeison
// 
// Create Date: 07/15/2024 06:54:16 PM
// Module Name: debouncer
// Description: Button Debouncer Mealy State Machine
// 
//////////////////////////////////////////////////////////////////////////////////

module debouncer(
    input wire clk, wire button,
    output reg press
    );

initial
begin
    press = 0;
end

integer i = 0;
reg bounce_flag = 0;
reg initial_state = 0;

always @(posedge clk)
begin
    if (i < 999999 & bounce_flag == 0)  // 50Hz = 999 999 ---> 20ms
    begin
        if (button != initial_state)
            bounce_flag <= 1;
        else
            bounce_flag <= 0;
        i <= i + 1;
    end
    else
    begin
        if (bounce_flag == 0)
        begin
            press <= initial_state;
        end
        else
        begin
            bounce_flag <= 0;
            initial_state <= button;
        end
        i <= 0;
    end
end

endmodule