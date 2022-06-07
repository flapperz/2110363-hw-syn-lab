`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2020 12:57:29 AM
// Design Name: 
// Module Name: clockDiv
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


module clockDiv(
    output clkDiv,
    input clk
    );

reg clkDiv;

initial
begin
    clkDiv=0;
end

begin
always @(posedge clk)
   clkDiv = !clkDiv;    
end
endmodule
