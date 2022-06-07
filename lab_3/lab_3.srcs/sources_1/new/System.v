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
    input btnU,
    input btnD,
    input [7:0]sw
    );
    
    wire [3:0]num[3:0]; 
    wire divclk, set0, set9;
    wire [3:0] dec, inc, cout, bout, upsw, downsw, underflow;
    
    assign underflow = {num[3]!=0, num[2]!=0, num[1]!=0, num[0]!=0};
    
    assign inc = upsw | {cout[2:0],1'b0};
    assign dec = (downsw & underflow) | {bout[2:0],1'b0};
//    assign inc = upsw;
//    assign dec = downsw;
    
    ClockDivArray clkArr(.clkDiv(divclk), .clk(clk));
    
    RSinglePulser rspSet0(.q(set0), .d(btnD), .clk(divclk));
    RSinglePulser rspSet9(.q(set9), .d(btnU), .clk(divclk));
    
    genvar i;
    generate 
        for (i=0; i<4; i=i+1) begin
            BCDCounter bcdcounter(
                .cout(cout[i]),
                .bout(bout[i]),
                .num(num[i]),
                .up(inc[i]),
                .down(dec[i]),
                .set9(set9),
                .set0(set0),
                .clk(divclk)
            );
        
            RSinglePulser rspU(.q(upsw[i]), .d(sw[2*i]), .clk(divclk));
            RSinglePulser rspD(.q(downsw[i]), .d(sw[(2*i)+1]), .clk(divclk));
        end
    endgenerate
    
           
    
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
