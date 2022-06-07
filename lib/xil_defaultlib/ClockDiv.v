`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2020 01:53:09 AM
// Design Name: 
// Module Name: ClockDiv
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


module ClockDiv(
    output clkDiv,
    input clk
    );
    
    reg clkDiv;
    
    initial
    begin
        clkDiv = 0;
    end
    
    always @(posedge clk)
        clkDiv = !clkDiv;
        
endmodule
