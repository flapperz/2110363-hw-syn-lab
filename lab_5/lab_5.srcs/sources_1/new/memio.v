`timescale 1ns / 1ps
//-------------------------------------------------------
// File name    : memory.v
// Title        : Memory
// Library      : nanoLADA
// Purpose      : Computer Architecture
// Developers   : Krerk Piromsopa, Ph. D.
//              : Chulalongkorn University.
                                                                                                                                                                                                                                                                                                                                                                    module memio(map_out, data, map_in,address,wr,clock);
parameter DATA_WIDTH=32;
parameter ADDR_WIDTH=27;

// map_out 
// 16 - dp
// 15:12 - num3
// 11:8 - num2
// 7:4 - num1
// 3:0 - num0 

// map_in
// sw 1-1
output  [15:0] map_out;
inout	[DATA_WIDTH-1:0]	data;
input   [11:0] map_in;
input	[ADDR_WIDTH-1:0]	address;
input		wr;
input		clock;
reg	[DATA_WIDTH-1:0]	mem[0:1<<(ADDR_WIDTH-15) -1];

reg	[DATA_WIDTH-1:0]	data_out;
reg [15:0]              map_out_buffer;
reg [11:0]              map_in_mem;    
// Tri-State buffer
assign data=(wr==0) ? data_out:32'bz;
assign map_out=map_out_buffer;

integer i;
initial
begin
	$readmemb("C:/Users/flap9/MyData/Workspaces/hw-syn-lab/lab_5/lab_5.sim/sim_1/behav/xsim/data.list",mem);
	map_out_buffer = 16'b0_0;
	map_in_mem = 12'b0_0;
end

always @(address)
begin
    case ({address,2'b00})
        16'hffe0: data_out = {28'b0_0,map_in_mem[3:0]};
        16'hffe4: data_out = {28'b0_0,map_in_mem[7:4]};
        16'hffe8: data_out = {28'b0_0,map_in_mem[11:8]};
        default: begin
            data_out = mem[address];
            $display("%10d - mem[%h] -  %h\n",$time, address,data_out);	
        end
    endcase
end

always @(posedge clock)
begin
    map_in_mem = map_in;
end

always @(posedge clock)
begin : MEM_WRITE
	if (wr) begin
	   case ({address,2'b00})
	       16'hfff0: map_out_buffer[3:0] = data[3:0];
	       16'hfff4: map_out_buffer[7:4] = data[3:0];
	       16'hfff8: map_out_buffer[15:8] = data[7:0];
	       16'hfffc: map_out_buffer[15:12] = data[3:0];
	       default: begin
                mem[address]=data;
                $display("%10d - MEM[%h] <- %h",$time, address, data);
	       end
	   endcase
	end
end

endmodule
