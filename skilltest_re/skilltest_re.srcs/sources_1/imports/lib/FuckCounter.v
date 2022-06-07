`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2020 03:43:42 PM
// Design Name: 
// Module Name: FuckCounter
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


module FuckCounter(
    output [3:0]seg4bin,
    input reset,
    input countclk,
    input clk
    );
    reg [3:0] dig, nextdig;
    assign seg4bin = dig;
    
    initial begin 
        dig = 4'b0000;
        nextdig = 4'b0000;
    end
    
    always @(posedge clk) begin
        dig = nextdig;
    end
    
    always @(posedge countclk) begin
        if (reset)
            nextdig = 4'b0000;
        else begin
            case(dig)
                4'b0000: nextdig = 4'b1000;
                4'b1000: nextdig = 4'b1100;
                4'b1100: nextdig = 4'b1110;
                4'b1110: nextdig = 4'b1111;
                4'b1111: nextdig = 4'b1111;
                default: nextdig = 4'b0001;
            endcase   
        end       
    end
    
endmodule
