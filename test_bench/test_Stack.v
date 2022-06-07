`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2020 02:06:54 PM
// Design Name: 
// Module Name: test_Stack
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


module test_Stack(

    );
    
    reg clk;
    reg [7:0]data;
    reg push, pop;
    wire[7:0] top, lastPop;
    
    Stack stack1(
        .top(top),
        .lastPop(lastPop),
        .value(data),
        .push(push),
        .pop(pop),
        .clk(clk));
        
    always #10 begin
        clk = ~clk;
    end
    
    initial #0 begin
        clk = 0;
        push = 0;
        pop = 0;
        data = 0;
    #50 push = 1;
    #20 data = 1;
    #20 data = 2;
    #20 data = 3;
    #20 data = 4;
    #20 data = 5;
    #20 data = 6;
    #10 push = 0;
    #30 pop = 1;
    #500 $finish;
    end
endmodule
