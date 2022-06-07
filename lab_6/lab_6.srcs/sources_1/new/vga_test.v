`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2020 03:04:53 AM
// Design Name: 
// Module Name: vga_test
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


module vga_test
	(
		input wire clk, btnC,
		input wire [11:0] sw,
		output wire Hsync, Vsync,
		output wire [3:0] vgaRed, vgaBlue, vgaGreen
	);
	
	// register for Basys 2 8-bit RGB DAC 
	reg [11:0] rgb_reg;
	
	// video status output from vga_sync to tell when to route out rgb signal to DAC
	wire video_on;

        // instantiate vga_sync
        vga_sync vga_sync_unit (.clk(clk), .reset(btnC), .hsync(Hsync), .vsync(Vsync),
                                .video_on(video_on), .p_tick(), .x(), .y());
   
        // rgb buffer
        always @(posedge clk, posedge btnC)
        if (btnC)
            rgb_reg <= 0;
        else
            rgb_reg <= sw;
        
        // output
        assign {vgaRed,vgaGreen, vgaBlue} = (video_on) ? rgb_reg : 12'b0;
endmodule
