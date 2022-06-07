`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/26/2020 05:49:24 PM
// Design Name: 
// Module Name: fullAdder
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


module fullAdder(
    output cout,
    output s,
    input a,
    input b,
    input cin
    );
    
reg cout, s;

always @(a or b or cin)
/*
begin
  s = a ^ b ^ cin;
  cout = a&b | (a^b) & cin;
end
*/
assign {cout,s} = a + b + cin;

endmodule
