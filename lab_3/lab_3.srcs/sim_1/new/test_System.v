`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/10/2020 09:47:07 AM
// Design Name: 
// Module Name: test_System
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


module test_System(

    );
    
    reg btnU, btnD, clk;
    reg [7:0] sw;
    wire dp;
    wire [6:0] seg;
    wire [3:0] an;
    
    
    System sys(.seg(seg), .an(an), .dp(dp),.clk(clk), .btnU(btnU), .btnD(btnD),.sw(sw));
    
    always #10 clk = ~clk;
    
    initial #0 begin
    clk = 0;
    sw = 0;
    btnU = 0;
    btnD = 0;
    
    #10 btnU = 1;
    #50 btnU = 0;
   
    #1000 sw = 1;
    #40 sw = 0;
    #1000 sw = 1;
    #10 sw = 0;
    
    $finish;
    end
endmodule
