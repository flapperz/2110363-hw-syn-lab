`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2020 05:53:02 PM
// Design Name: 
// Module Name: test_RSinglePulser
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


module test_RSinglePulser(

    );
        
    wire q;
    reg clk, d;
    RSinglePulser rsp(.q(q), .d(d), .clk(clk));
    
    always #10 clk <= ~clk;

    initial #0 begin
        d = 0;
        clk = 0;
        #55 d = 1;
        #45 d = 0;
        #20 d = 1;
        #20 d = 0;
        #100
        $finish;
    end
endmodule
