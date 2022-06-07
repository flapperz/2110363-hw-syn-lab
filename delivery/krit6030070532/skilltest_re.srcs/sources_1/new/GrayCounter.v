`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/23/2020 04:54:06 PM
// Design Name: 
// Module Name: GrayCounter
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


module GrayCounter #(
        parameter LIMIT = 15
    )(
        output [3:0] numout,
        input clk
    );
    
    wire [3:0] numout;
    reg [3:0] num;
//    reg [3:0] nextnum;
    
    assign numout[0] = num[0] ^ num[1];
    assign numout[1] = num[1] ^ num[2];
    assign numout[2] = num[2] ^ num[3];
    assign numout[3] = num[3];
    
    initial begin
        num = 0;
    end
        
    
    always @(posedge clk) begin
        num = num +1;
        if (num>LIMIT)
            num = 0;
    end
    
endmodule
