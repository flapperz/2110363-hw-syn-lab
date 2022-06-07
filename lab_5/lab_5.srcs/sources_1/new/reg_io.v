module reg_io(
    data_out, data_in, address, we, re, clk
    );
parameter DATA_WIDTH=32;
parameter ADDR_WIDTH=27;

output [DATA_WIDTH-1:0] data_out;
input [DATA_WIDTH-1:0] data_in;
input [ADDR_WIDTH-1:0] address;
input we;
input re;
input clk;

reg [DATA_WIDTH-1:0] mem;

assign data_out = (re) ? mem : {DATA_WIDTH{1'bz}};

initial begin
    mem = {DATA_WIDTH{1'b0}};
end

always @(posedge clk) begin
    if ( we ) 
        mem = data_in;
    end

endmodule