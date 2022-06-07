`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2020 01:41:49 AM
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
    output [6:0] seg,
    output dp,
    output [3:0] an,
    input clk
    );

wire [3:0] num0,num1,num2,num3;
wire [6:0] segWire;
wire an0,an1,an2,an3;
assign an={an0,an1,an2,an3};

assign num0=1;
assign num1=2;
assign num2=3;
assign num3=4;

wire [25:0] tclk;

assign tclk[0]=clk;

genvar c;
generate for(c=0; c<25; c=c+1)
begin
    clockDiv fdiv(tclk[c+1], tclk[c]);
end endgenerate

quadSevenSeg QuadSevenSeg1(seg,dp,an0,an1,an2,an3,num0,num1,num2,num3,tclk[25]);




endmodule
