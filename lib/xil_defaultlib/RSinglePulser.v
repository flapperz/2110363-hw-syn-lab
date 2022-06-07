`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/24/2020 01:43:26 AM
// Design Name: 
// Module Name: RSingle Pulser
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


module RSinglePulser(
    output q,
    input d,
    input clk
    );

reg [1:0] state;
wire state2dff1, dff12dff2;
assign state2dff1 = (state==1);

initial begin
    state = 0;
end

always @(posedge clk)
begin
    casex ({state,d})
    3'bxx0: state <= 0;
    3'b001: state <= 1;
    3'b011: state <= 2;
    3'b101: state <= 2;
    endcase
end

DFF dff1(.q(dff12dff2),.d(state2dff1),.clk(clk));
DFF dff2(.q(q),.d(dff12dff2),.clk(clk));

endmodule
