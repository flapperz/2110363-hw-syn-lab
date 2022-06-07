`timescale 1ns / 1ps
//-------------------------------------------------------
// File name    : rom.v
// Title        : Program Memory
// Library      : nanoLADA
// Purpose      : Computer Architecture
// Developers   : Krerk Piromsopa, Ph. D.
//              : Chulalongkorn University.
module rom(data,address);
parameter DATA_WIDTH=32;
parameter ADDR_WIDTH=27;

output	[DATA_WIDTH-1:0]	data;
input	[ADDR_WIDTH-1:0]	address;
(* synthesis, rom_block = "ROM_CELLXYZ01" *)
reg	[DATA_WIDTH-1:0]	mem[0:1<<(ADDR_WIDTH-15) -1];

assign data=mem[address];

initial begin
	$readmemb("C:/Users/flap9/MyData/Workspaces/hw-syn-lab/lab_5/lab_5.sim/sim_1/behav/xsim/flapprog.list",mem);
end

endmodule
