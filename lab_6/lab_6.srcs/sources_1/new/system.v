`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2020 03:00:47 AM
// Design Name: 
// Module Name: system
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


module system
	(
		input wire clk, btnC,
		input wire [11:0] sw,
		output wire Hsync, Vsync,
		output wire [3:0] vgaRed, vgaBlue, vgaGreen
	);
	
	// register for Basys 2 8-bit RGB DAC 
//	reg [11:0] rgb_reg;
	
	// video status output from vga_sync to tell when to route out rgb signal to DAC
	wire video_on;
	wire [9:0] x,y;
	wire p_tick;
    wire [11:0] rgb_gen;
        // instantiate vga_sync
        vga_sync VGASYNC (.clk(clk), .reset(btnC), .hsync(Hsync), .vsync(Vsync),
                                .video_on(video_on), .p_tick(p_tick), .x(x), .y(y));
                                
        pixel_gen_l6 PIXELGEN (.rgb_out(rgb_gen),
                                    .x(x), .y(y), .rgb_in({12{1'b1}}), .dx(9'd100), .dy(9'd100) );
   
        // rgb buffer
//        always @(posedge clk, posedge btnC)
//        if (btnC)
//            rgb_reg <= 0;
//        else
//            rgb_reg <= sw;
        
        // output
        assign {vgaRed,vgaGreen,vgaBlue} = (video_on) ? rgb_gen : 12'b0_0;
endmodule

