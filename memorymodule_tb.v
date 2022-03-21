`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:42:18 03/14/2022
// Design Name:   memorymodel
// Module Name:   E:/6th sem/MINOR project/and_gate1/memorymodule_tb.v
// Project Name:  and_gate1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: memorymodel
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module memorymodule_tb;


	// Inputs
	reg [7:0] data_in;
	reg [9:0] addr;
	reg wr;
	reg cs;
	integer k,myseed;

	// Outputs
	wire [7:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	memorymodel uut (
		.data_out(data_out), 
		.data_in(data_in), 
		.addr(addr), 
		.wr(wr), 
		.cs(cs)
	);

	initial begin
		// Initialize Inputs
		for(k=0;k<=1023;k=k+1)
		begin
		data_in = (k+k)%256;
		wr = 1;
		cs = 1;
		#2 addr = k;
		wr=0; cs=0;
		$display("addr:%5d,data:%4d",addr,data_in);
		end
		

    end
endmodule

