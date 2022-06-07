`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2020 08:44:11 AM
// Design Name: 
// Module Name: parity_test
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


module parity_test(

    );
    wire parity;
    reg [7:0] data;
    parity_gen PGEN(parity, data);
    initial #0 begin
        #10
        data = 8'b10101010;
        #10
        data = 8'b11111111;
        #10
        data = 8'b00000001;
        #10
        data = 8'b00000011;
        #10
        data = 8'b10000101;
        #10
        $finish;
    end
endmodule
