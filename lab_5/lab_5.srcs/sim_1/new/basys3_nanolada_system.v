`timescale 1ns / 1ps
//-------------------------------------------------------
// File name    : nano_sc_system.v
// Title        : nanoCPU Single Cycle system.
// Library      : nanoLADA
// Purpose      : Computer Architecture
// Developers   : Krerk Piromsopa, Ph. D.
//              : Chulalongkorn University.

module basys3_nanolada_system(seg, an, dp, sw, btnC, clk);
//module basys3_nanolada_system(seg, an, dp, btnC, clk);
output [6:0] seg;
output [3:0] an;
output dp;
input btnC;
input [11:0] sw;
input clk;

wire 	[31:0]	p_address;
wire 	[31:0]	p_data;
wire	[31:0]	d_address;
wire		mem_wr;
wire	[31:0]	d_data;
wire    btn_wire;
wire [15:0] map_out;

wire	clock;
wire	nreset;
assign nreset = ~btnC;

// sim
//reg clock;
//reg nreset;
//reg [11:0] sw;



ClockDivArray CDA(clock,clk);

QuadSevenSeg QUAD7SEG(
    seg, 
    dp,
    an,
    map_out[3:0],
    map_out[7:4],
    map_out[11:8],
    map_out[15:12],
    clock );

nanocpu	CPU(p_address,p_data,d_address,d_data,mem_wr,clock,nreset);
rom 	PROGMEM(p_data,p_address[28:2]);
memio 	DATAMEM(map_out, d_data, sw[11:0], d_address[28:2],mem_wr,clock);


    
//initial
//begin
//	$dumpfile("basys3_nanolada_dump.dump");
//	$dumpvars(4, basys3_nanolada_system);
//	clock=0;
//	nreset=0;
//	#40;
//	nreset=1;
//	#70;
//	sw[3:0] = 4'h7;
//	#400;
//	sw[3:0] = 4'ha;
//	#2000;
//	$finish;
//end

//always
//begin : CLOCK
//	#20
//	clock=~clock;
//end


endmodule
