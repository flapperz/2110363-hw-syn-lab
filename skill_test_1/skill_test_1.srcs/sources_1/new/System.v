`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2020 01:09:18 AM
// Design Name: 
// Module Name: System
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


module System(
    output [6:0]seg,
    output dp,
    output [3:0]an,
    input clk,
    input btnC
    );
    
    reg state;
    wire [3:0] num;
    wire divclk;
    wire [1:0] countclk;
    wire reset, btnout, finalclk;
    
    assign finalclk = !state&countclk[0] | state&countclk[1];
    
    initial state = 0;
    
    always @(posedge reset) state = 1;
    
    
    ClockDivArray #(26) clkarr1(.clkDiv(countclk[0]), .clk(clk));
    ClockDivArray #(27) clkarr2(.clkDiv(countclk[1]), .clk(clk));
    ClockDivArray clkarrmain(.clkDiv(divclk), .clk(clk));

    DFF dffU1(.q(dff1out), .d(btnC), .clk(divclk));
    DFF dffU2(.q(reset), .d(dff1out), .clk(divclk));
    
    FuckCounter counter(
        .seg4bin(num),
        .clk(divclk), 
        .countclk(finalclk),
        .reset(reset));
    
    
    QuadSevenSeg quadSeg(
        .seg(seg),
        .an(an),
        .dp(dp),
        .num0(num[0]),
        .num1(num[1]),
        .num2(num[2]),
        .num3(num[3]),
        .clk(divclk));
    
endmodule
