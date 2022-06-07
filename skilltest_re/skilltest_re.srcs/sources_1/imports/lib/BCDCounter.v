`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/22/2020 06:29:42 PM
// Design Name: 
// Module Name: BCDCounter
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


module BCDCounter(
        output cout,
        output bout,
        output [3:0]num,
        input up,
        input down,
        input set9,
        input set0,
        input clk
    );
reg [3:0] number;
reg [3:0] nextnumber;

assign num = number;

initial begin
    number = 0;
end

assign cout = (number==9) && up && !set9;
assign bout = (number==0) && down && !set0;

always @(posedge clk) begin
    number <= nextnumber;
end

always @(*) begin
    casex({up,down,set9,set0})
        4'b1000: begin
            if (number == 9) nextnumber <= 0;
            else nextnumber <= number+1;
        end
        4'b0100: begin
            if (number == 0) nextnumber <= 9;
            else nextnumber <= number-1;
        end
        4'bxx10: nextnumber <= 9;
        4'bxx01: nextnumber <= 0;
        default: nextnumber <= number;
    endcase
end

endmodule
