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


module ShiftA(q,clock,d);
output [1:0] q;
input clock,d;

reg [1:0] q;

always @(posedge clock)
begin
    q[0]=d;
    q[1]=q[0];
end
endmodule

module ShiftB(q,clock,d);
output [1:0] q;
input clock,d;

reg [1:0] q;

always @(posedge clock)
begin
    q[0]<=d;
    q[1]<=q[0];
end
endmodule
