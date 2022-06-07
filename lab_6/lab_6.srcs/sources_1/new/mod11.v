`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2020 08:39:21 AM
// Design Name: 
// Module Name: mod11
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


module mod11(
    output wire count11,
    input inc,
    input reset,
    input clk
    );
    
    reg [3:0] q, next_q;
    
    assign count11 = (q==10 && inc);
    
    initial begin
        q = 0;
        next_q = 0;
    end
    
    always @(posedge clk) begin
        q <= next_q;
    end
    
    always @(inc, reset) begin
        case ({inc,reset})
            2'b10: next_q <= (q + 1)%11;
            2'bx1: next_q <= 0;
            default: next_q <= q;
        endcase
    end
    
endmodule

