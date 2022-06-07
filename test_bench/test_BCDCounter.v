`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2020 05:40:03 PM
// Design Name: 
// Module Name: test_BCDCounter
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


module test_BCDCounter(
   
    );
    reg set0, set9, up, down;
    wire [0:0] cout[3:0], bout[3:0];
    wire [3:0] number[3:0];
    
    reg clk;
    
    
    BCDCounter bcdCounter0(
        .cout(cout[0]), 
        .bout(bout[0]),
        .num(number[0]),
        .set0(set0),
        .set9(set9),
        .up(up),
        .down(down),
        .clk(clk));
        
    BCDCounter bcdCounter1(
        .cout(cout[1]), 
        .bout(bout[1]),
        .num(number[1]),
        .set0(set0),
        .set9(set9),
        .up(cout[0]),  
        .down(bout[0]),
        .clk(clk));
    BCDCounter bcdCounter2(
        .cout(cout[2]), 
        .bout(bout[2]),
        .num(number[2]),
        .set0(set0),
        .set9(set9),
        .up(cout[1]),  
        .down(bout[1]),
        .clk(clk));
    BCDCounter bcdCounter3(
        .cout(cout[3]), 
        .bout(bout[3]),
        .num(number[3]),
        .set0(set0),
        .set9(set9),
        .up(cout[2]),  
        .down(bout[2]),
        .clk(clk));
    
    always #10 clk <= !clk;
    
    initial #0 begin
        clk = 0;
        set0 = 0;
        set9 = 0;
        up = 0;
        down = 0;
        #55 up = 1;
        #250 {up,down} = 2'b01;
        #300 {set9,set0} = 2'b01;
        #20  {set9,set0} = 2'b10;
        #20  {set9,set0} = 2'b11;
        #100
        
        $finish;
    end
endmodule
