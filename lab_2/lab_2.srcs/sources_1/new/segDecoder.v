`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/10/2020 01:10:45 AM
// Design Name: 
// Module Name: segDecoder
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


module segDecoder(
    output [7:0] seg_output,
    input [3:0] hex
    );
   
    reg [7:0] seg_output;
// 7-segment encoding
//      0
//     ---
//  5 |   | 1
//     --- <--6
//  4 |   | 2
//     ---
//      3


always @(hex)
begin
  case (hex)
      4'b0001 : seg_output = 8'b11110011;   // 1
      4'b0010 : seg_output = 8'b01001001;   // 2
      4'b0011 : seg_output = 8'b01100001;   // 3
      4'b0100 : seg_output = 8'b00110011;   // 4
      4'b0101 : seg_output = 8'b00100101;   // 5
      4'b0110 : seg_output = 8'b00000101;   // 6
      4'b0111 : seg_output = 8'b11110001;   // 7
      4'b1000 : seg_output = 8'b00000001;   // 8
      4'b1001 : seg_output = 8'b00100001;   // 9
      4'b1010 : seg_output = 8'b00010001;   // A
      4'b1011 : seg_output = 8'b00000111;   // b
      4'b1100 : seg_output = 8'b10001101;   // C
      4'b1101 : seg_output = 8'b01000011;   // d
      4'b1110 : seg_output = 8'b00001101;   // E
      4'b1111 : seg_output = 8'b00011101;   // F
      default : seg_output = 8'b10000001;   // 0
  endcase
end

endmodule
