`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2020 09:06:27 AM
// Design Name: 
// Module Name: shift_test
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


module shift_test(

    );
    
    reg [8:0] data;
    reg clk, load, shift;
    wire out;
    wire [9:0] regs;
    
    shift_reg SR(.sout(out), .state(regs), .load_d(data), .load(load), .shift(shift), .clk(clk));
    
    always #5 begin 
        clk = ~clk;
    end
    
    initial #0 begin
        clk = 0;
        load = 0;
        shift = 0;
        data = 9'b010011001;
        #67
        load = 1;
        #30
        load = 0;
        #50
        shift = 1;
        #200
        shift = 0;
        #20
        load = 1;
        #30
        shift = 1;
        #200
        $finish;
    end
endmodule
