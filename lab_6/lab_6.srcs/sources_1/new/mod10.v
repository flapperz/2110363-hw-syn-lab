`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2020 08:13:48 AM
// Design Name: 
// Module Name: mod10
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


module mod10(
    output wire count10,
    output wire [3:0] state,
    input inc,
    input reset,
    input clk
    );
    
    reg [3:0] q, next_q;
    
    assign count10 = (q==9 && inc);
    assign state = q;
    
    initial begin
        q = 0;
        next_q = 0;
    end
    
    always @(posedge clk) begin
        q <= next_q;
    end
    
    always @(inc, reset) begin
        case ({inc,reset})
            2'b10: next_q <= (q + 1)%10;
            2'bx1: next_q <= 0;
            default: next_q <= q;
        endcase
    end
endmodule
