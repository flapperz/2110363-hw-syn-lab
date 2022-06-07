`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2020 10:45:05 AM
// Design Name: 
// Module Name: Stack
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


module Stack
    #( parameter DATA_W=8,
       parameter DATA_H=256
    )(
    output [DATA_W-1:0] top,
    output [DATA_W-1:0] lastPop,
    input [DATA_W-1:0] value,
    input push,
    input pop,
    input clk
    );
    
    reg [DATA_H-1:0] sp;
    reg [DATA_W-1:0] data[DATA_H-1:0];
    reg [DATA_W-1:0] lastPopR;
    
    assign lastPop = lastPopR;
    assign top = (sp==0) ? 2**DATA_W-1 : data[sp-1];
    
    integer index;
    initial begin
    sp = 0;
    lastPopR = 2**DATA_W-1;
    for (index=0; index<DATA_H; index=index+1) begin
        data[index] <= 0;
        end
    end
    
    always @(posedge clk) begin
        case ({push,pop})
        2'b10: begin
            sp <= sp + 1;
            data[sp] <= value; 
        end
        2'b01: begin
            if (sp > 0)
                sp <= sp - 1;
                lastPopR <= (sp==0) ? 2**DATA_W-1 : data[sp-1];
        end
        endcase
    end     
    
endmodule
