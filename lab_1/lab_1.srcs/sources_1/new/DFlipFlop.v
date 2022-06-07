`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/26/2020 10:12:27 PM
// Design Name: 
// Module Name: DFlipFlop
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


module DFlipFlop(
    output q,
    input clock,
    input nreset,
    input d
    );

    reg q;
    
    always @(posedge clock or ! nreset)
    begin
        if (nreset==1)
            q=d;
        else
            q=0;
   end
endmodule
