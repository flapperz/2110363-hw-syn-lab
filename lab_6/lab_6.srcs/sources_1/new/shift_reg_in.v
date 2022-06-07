`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2020 12:38:05 PM
// Design Name: 
// Module Name: shift_reg_in
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


module shift_reg_in(
        output wire [8:0] data,
        input din,
        input shift,
        input clk
    );
    
    assign data = buff;
    reg [8:0] buff;
    
    always @(posedge clk)
        if (shift)
            buff = {buff[7:0], din};
    
        
    initial buff = 9'b111111111;
 
endmodule
