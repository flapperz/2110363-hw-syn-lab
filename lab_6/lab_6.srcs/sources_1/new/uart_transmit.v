`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2020 11:21:26 AM
// Design Name: 
// Module Name: uart_transmit
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


module uart_transmit(
        output RsTx,
        input [7:0] data,
        input send,
        input RsRx,
        input clk,
        input btnC
    );
    
    parameter IDLE = 0;
    parameter LOAD = 1;
    parameter COUNT = 2;
    parameter SHIFT = 3;
    
    reg [3:0] ns, s;
    
    wire dout;
    wire btn;
    wire next_bit, count11;
    wire parity;
     
    // control
    wire reset_counter, reset_timer, shift;
    assign reset_counter = (s==LOAD);
    assign reset_timer = (s==LOAD);
    assign shift = (s==SHIFT);
    
    SinglePulser(.q(btn), .d(btnC), .clk(clk));
     
    clk9600 CLK96(.next_bit(next_bit), .reset(reset_timer), .clk(clk));
    
    mod11 MOD11(.count11(count11), .inc(next_bit), .reset(reset_counter), .clk(clk));
    
    parity_gen PARITY(.parity(parity), .din(data));
    
    shift_reg SHIFTREG(.sout(dout), .load_d({parity,data}), 
        .load(btn), .shift(shift), .clk(clk));

    always @(posedge clk) begin
        s <= ns;
    end

    always @*
        case (s)
            IDLE: 
                if (send) ns <= LOAD;
                else ns <= IDLE;
            LOAD: ns <= COUNT;
            COUNT:
                if (~next_bit) ns <= COUNT;
                else ns <= SHIFT;
            SHIFT:
                if (count11) ns <= IDLE;
                else ns <= COUNT;
        endcase
    
    initial
        s = IDLE;
        
//    always #5 clk = ~clk;
    
//    initial #0 begin 
//        data = 8'd64;
//        clk = 0;
//        #200000
//        $finish;
        
//    end
        
//    initial begin data = 8'd64; end
    
    
endmodule
