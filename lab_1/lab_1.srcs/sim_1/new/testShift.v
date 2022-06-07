`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/26/2020 11:25:28 PM
// Design Name: 
// Module Name: testShift
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


module testShift();
        reg clock, d;
        wire [1:0] qA, qB;
        ShiftA shiftA(qA,clock,d);
        ShiftB shiftB(qB,clock,d);
        always
            #10 clock=~clock;
        initial
        begin
            #0 d=0;
            clock=0;
            #25 d=1;
            #10 d=0;
            #100 $finish;
        end
endmodule
