`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2020 07:45:57 AM
// Design Name: 
// Module Name: clk9600_test
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


module clk9600_test(
        
    );
    
    reg clk;
    wire out;
    reg reset;
    clk9600 BAUDCLK(.next_bit(out), .clk(clk), .reset(reset));
    
    
    always #5 begin
        clk = ~clk;
    end
    
    initial #0 begin
        clk = 0;
        reset = 0;
        #400
        reset = 1;
        #10
        reset = 0;
        #104170
        $finish;
    end
    
    
    
endmodule
