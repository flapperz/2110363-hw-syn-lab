`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2020 02:31:38 AM
// Design Name: 
// Module Name: ClockDivArray
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


module ClockDivArray #(
    parameter NUMBER = 18 
    )(
    output clkDiv,
    input clk
    );
    
    wire [NUMBER:0] tclk;
    assign tclk[0] = clk;
    assign clkDiv = tclk[NUMBER];
    
    genvar c;
    generate for(c=0; c<NUMBER; c=c+1)
    begin
        ClockDiv fdiv(tclk[c+1], tclk[c]);
    end
    endgenerate
    
    
endmodule
