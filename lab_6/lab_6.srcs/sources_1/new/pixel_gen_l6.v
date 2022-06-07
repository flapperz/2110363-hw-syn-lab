`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2020 03:15:03 AM
// Design Name: 
// Module Name: pixel_gen_l6
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


module pixel_gen_l6(
        output wire [11:0] rgb_out,
        input wire [9:0] x, y,
        input wire [11:0] rgb_in,
        input wire [9:0] dx, dy
    );
    
    wire [31:0] dist;
    wire mask;
    
    assign dist = (x-320-dx)*(x-320-dx) + (y-240-dy)*(y-240-dy);
    assign mask = dist < 10000;
//    assign mask = (x==240) || (y==320);
    
    assign rgb_out = mask ? rgb_in : 12'b0_0;
endmodule
