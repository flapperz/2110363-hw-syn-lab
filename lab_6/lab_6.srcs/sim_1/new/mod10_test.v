`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2020 08:23:58 AM
// Design Name: 
// Module Name: mod10_test
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


module mod10_test(

    );
    wire count10,out;
    wire [3:0] state;
    reg inc, reset, clk;
    mod10 MOD10(.count10(count10), .state(state), .inc(out),.reset(reset),.clk(clk));
    clk9600 BAUDCLK(.next_bit(out), .clk(clk), .reset(reset));
    always #5 begin 
        clk = ~clk;
    end
    
        initial #0 begin
        clk = 0;
        reset = 0;
        #10417
        reset = 1;
        #10
        reset = 0;
        #104170
        $finish;
    end
endmodule
