`timescale 1ns / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/26/2020 08:56:32 PM
// Design Name: 
// Module Name: tester
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


module tester;

    reg a,b,cin;
    wire cout,s;
    
    fullAdder a1(cout,s,a,b,cin);
    
    initial
    begin
        $monitor("time %t: {%b %b} <- {%d %d %d}", 
        $time, cout, s, a, b, cin);
        #0;
        a=0; b=0; cin=0;
        #10;
        a=0; b=0; cin=1;
        #10;
        a=0; b=1; cin=0;
        #10;
        a=0; b=1; cin=1;
        #10;
        a=1; b=0; cin=0;
        #10;
        a=1; b=0; cin=1;
        #10;
        a=1; b=1; cin=0;
        #10;
        a=1; b=1; cin=1;
        #10;
        a=0; b=0; cin=0;
        #100;
        $finish;
    end    
endmodule
