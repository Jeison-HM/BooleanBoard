`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// 
// Engineer: Jeison
// 
// Create Date: 07/11/2024 07:04:15 PM
// Module Name: main
// Description: Main Modules Connections
// 
//////////////////////////////////////////////////////////////////////////////////

`include "macros.v"

module main(
        input wire clk, wire [3:0] btn,
        output wire [15:0] led, wire [3:0] D0_a, wire [7:0] D0_seg, wire [3:0] D1_a, wire [7:0] D1_seg
    );

wire [2:0] divided_clk;
integer divider [1:0];
integer multiplier [1:0];

initial
begin
    divider[0] = 49;        // for Main and Second Clock
    divider[1] = 49999999;  // for Third Clock
    multiplier[0] = 1;      // for Main Clock
    multiplier[1] = 2;      // for Second Clock
end

// Primary Clock

clock_divider C0 (
    .clk(clk),
    .divider(divider[0]),
    .multiplier(multiplier[0]),
    .divided_clk(divided_clk[0])
);

// Second Clock

clock_divider C1 (
    .clk(clk),
    .divider(divider[0]),
    .multiplier(multiplier[1]),
    .divided_clk(divided_clk[1])
);

// Third Clock

clock_divider C2 (
    .clk(clk),
    .divider(divider[1]),
    .multiplier(multiplier[0]),
    .divided_clk(divided_clk[2])
);

// Button Debouncer

wire button_0;
wire button_1;
wire button_2;
wire button_3;

debouncer B0 (
    .clk(clk),
    .button(btn[0]),
    .press(button_0)
);

debouncer B1 (
    .clk(clk),
    .button(btn[1]),
    .press(button_1)
);

debouncer B2 (
    .clk(clk),
    .button(btn[2]),
    .press(button_2)
);

debouncer B3 (
    .clk(clk),
    .button(btn[3]),
    .press(button_3)
);

// Symbols memory

wire [4:0] sel_sym;
wire [7:0] out_sym;

seg_symbols M0 (
    .select(sel_sym),
    .out(out_sym)
);

// 7-Segment Driver

wire [39:0] word;

seg_driver U1 (
    .clk_1(divided_clk[0]),
    .clk_2(divided_clk[1]),
    .word(word),
    .out_sym(out_sym),
    .sel_sym(sel_sym),
    // Attach common anodes to en_display
    .en_display_1(D0_a),
    .en_display_2(D1_a),
    // Attach 7-Segment status to out_symb
    .display_1(D0_seg),
    .display_2(D1_seg)
);

// Menu

menu U2 (
    .clk(clk),
    .clk_anim(divided_clk[2]),
    .reset(button_2),
    .next(button_1),
    .back(button_0),
    .enter(button_3),
    .word(word)
);

// IO assignments

assign led[2:0] = divided_clk[2:0];
assign led[15:12] = btn[3:0];

endmodule