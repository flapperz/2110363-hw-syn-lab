`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/09/2020 02:18:56 AM
// Design Name: 
// Module Name: test_DFF
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


module test_DFF(
    
    );
    
    wire q;
    reg d, clk, clear, load;
    
    DFF dff(
        .q(q),
        .d(d),
        .clk(clk),
        .reset(clear)
    );
    
    always #10 begin
        clk <= ~clk;
    end
    
    initial #0 begin
        clk = 0;
        clear = 0;
        d = 1;
        
        #7 clear = 1;
        #20 d = 1;
        #20 clear = 0;
        #100 d = 0;
        #50
        
        $finish;
    end
    
    
endmodule
