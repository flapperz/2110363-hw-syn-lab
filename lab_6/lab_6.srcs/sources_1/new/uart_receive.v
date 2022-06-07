`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2020 12:36:36 PM
// Design Name: 
// Module Name: uart_receive
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


module uart_receive(
        output [8:0] led,
        output RsTx,
        input RsRx,
        input clk,
        input btnC
    );
    
    parameter IDLE = 0;
    parameter SETUP = 1;
    parameter COUNT = 2;
    parameter SHIFT = 3;
    
    reg [1:0] s, ns;
    
    //output 
    wire next_bit;
    wire check_bit;
    wire count11;
    
    //control sig
    wire reset_counter;
    wire reset_timer;
    wire shift_in;
    wire [8:0] d_out;
    
    assign led = d_out;
    
    assign reset_counter = (s==SETUP);
    assign reset_timer = (s==SETUP);
    assign shift_in = (s==SHIFT);
    
    wire btn;
    SinglePulser SP(btn, btnC, clk);
    
    clk9600 CLK96(.next_bit(next_bit), 
        .reset(reset_timer), .clk(clk));
        
    shift_reg_in(d_out, 1'b0, btn, clk);
    mod11 MOD11(.count11(count11), .inc(next_bit), .reset(reset_counter), .clk(clk));
//    parity_gen PARITY(.parity(check_bit), .din(TODO[]));
    
    always @(posedge clk) begin
        s <= ns;
    end
    
    always @*
        case (s)
            IDLE: 
                if (~RsRx) ns <= SETUP;
                else ns <= IDLE;
            SETUP: ns <= COUNT;
            COUNT:
                if (~next_bit) ns <= COUNT;
                else ns <= SHIFT;
            SHIFT:
                if (count11) ns <= IDLE;
                else ns <= COUNT;
        endcase
    
    initial
        s = IDLE;
 
            
endmodule
