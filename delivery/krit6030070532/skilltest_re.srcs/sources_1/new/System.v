`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2020 04:54:21 PM
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
        output [3:0] led,
        output leddp,
        input clk
    );
    
    wire clkdiv16, clkdiv50;
    reg [2:0] clkcount;
    reg led7;
    
    ClockDivArray #(24) clkdivarr ( clkdiv16, clk );
    GrayCounter #(4) grayCounter ( led, clkdiv50 );
    
    assign clkdiv50 = clkcount == 2;
    assign leddp = led7;
    initial begin
        clkcount = 0;
        led7 = 0;
    end
    always @(posedge clkdiv16) begin
        clkcount = (clkcount + 1)%3;
    end
    always @(posedge clkdiv50) begin
        led7 = ~led7;
    end
endmodule
