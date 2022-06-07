`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2020 01:33:40 AM
// Design Name: 
// Module Name: SegDecoder
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


module QuadSevenSeg(
    output [6:0] seg,
    output dp,
    output [3:0] an,
    input [3:0] num0,
    input [3:0] num1,
    input [3:0] num2,
    input [3:0] num3,
    input clk
    );
  
    reg [1:0] ps;
    reg [3:0] dispEn;
    reg [3:0] hexIn;
    wire dp;
    
    SegDecoder segDecoder1(seg, hexIn);
    
    assign an = ~dispEn;
    assign dp = 1;
    
    initial
    begin
        ps = 2'b00;
    end
    
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
