`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/17/2020 01:33:40 AM
// Design Name: 
// Module Name: SegDecoder
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


module SegDecoder(
    output reg [6:0] seg_output,
    input [3:0] hex
    );
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
      4'b0001 : seg_output = 7'b1001111;   // 1
      4'b0010 : seg_output = 7'b0100100;   // 2
      4'b0011 : seg_output = 7'b0110000;   // 3
      4'b0100 : seg_output = 7'b0011001;   // 4
      4'b0101 : seg_output = 7'b0010010;   // 5
      4'b0110 : seg_output = 7'b0000010;   // 6
      4'b0111 : seg_output = 7'b1111000;   // 7
      4'b1000 : seg_output = 7'b0000000;   // 8
      4'b1001 : seg_output = 7'b0010000;   // 9
      4'b1010 : seg_output = 7'b0001000;   // A
      4'b1011 : seg_output = 7'b0000011;   // b
      4'b1100 : seg_output = 7'b1000110;   // C
      4'b1101 : seg_output = 7'b0100001;   // d
      4'b1110 : seg_output = 7'b0000110;   // E
      4'b1111 : seg_output = 7'b0001110;   // F
      4'b0000 : seg_output = 7'b1000000;   // 0
      default : seg_output = 7'b1111111;   // none
  endcase
end

endmodule
