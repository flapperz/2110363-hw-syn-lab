`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2020 08:51:05 AM
// Design Name: 
// Module Name: shift_reg
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


module shift_reg(
        output wire sout,
        input [8:0] load_d,
        input load, shift, clk
    );
    reg [9:0] buff;
    
    assign sout = buff[0];
    
    initial buff = 10'b1111111111;
    
    always @(posedge clk) begin
        case ({load,shift})
            2'b10: buff = {load_d, 1'b0};
            2'b01: buff = {1'b1, buff[9:1]};
            2'b11: buff = 10'b1111111111;
            default: buff = buff;
        endcase
    end
        
endmodule
