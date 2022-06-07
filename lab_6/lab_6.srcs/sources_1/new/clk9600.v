`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2020 07:00:00 AM
// Design Name: 
// Module Name: clk9600
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


module clk9600(
    output wire next_bit,
    input clk,
    input reset
    );
    
    reg [13:0] counter, next_counter; //14 bit counter
    
    assign next_bit = (counter == 10416);
    
    initial begin
        counter = 0;
        next_counter = 0;
    end
    
    always @(posedge clk) begin
        counter <= next_counter;
    end
    
    always @(counter, reset) begin
        next_counter = (reset) ? 13'd0 : (counter + 1)%10417;
    end
    
endmodule
