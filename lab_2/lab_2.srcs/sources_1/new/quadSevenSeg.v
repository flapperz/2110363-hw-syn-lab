`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2020 01:01:48 AM
// Design Name: 
// Module Name: quadSevenSeg
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


module quadSevenSeg(
    output [6:0] seg,
    output dp,
    output an0,
    output an1,
    output an2,
    output an3,
    input [3:0] num0,
    input [3:0] num1,
    input [3:0] num2,
    input [3:0] num3,
    input clk
    );
    
reg [1:0] ps;
reg [3:0] dispEn;
initial
begin
    ps = 2'b00;
end    

reg [3:0] hexIn;
wire [6:0] segments;

assign seg=segments;
assign {an0,an1,an2,an3} = ~dispEn;

segDecoder SegDec1({segments,dp}, hexIn);

always @(posedge clk)
begin
    ps <= ps+1; 
end

always @(ps)
begin
    case(ps)
        2'b00: dispEn=4'b0001;
        2'b01: dispEn=4'b0010;
        2'b10: dispEn=4'b0100;
        2'b11: dispEn=4'b1000;
    endcase
end

always @(ps)
begin
    case(ps)
        2'b00: hexIn=num0;
        2'b01: hexIn=num1;
        2'b10: hexIn=num2;
        2'b11: hexIn=num3;
    endcase
end

endmodule
