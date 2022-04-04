`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:42:07 03/25/2022
// Design Name:   Pipeline_assign
// Module Name:   E:/6th sem/MINOR project/ADLD/pipelineassign_tb.v
// Project Name:  ADLD
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Pipeline_assign
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module pipelineassign_tb;

	// Inputs
	reg [3:0] rs1;
	reg [3:0] rs2;
	reg [3:0] rd;
	reg [3:0] func;
	reg [7:0] addr;
	reg clk1;
	reg clk2;

	// Outputs
	wire [15:0] z;
	integer k;

	// Instantiate the Unit Under Test (UUT)
	Pipeline_assign uut (
		.z(z), 
		.rs1(rs1), 
		.rs2(rs2), 
		.rd(rd), 
		.func(func), 
		.addr(addr), 
		.clk1(clk1), 
		.clk2(clk2)
	);

	initial begin
		// Initialize Inputs
		
		clk1 = 0;
		clk2 = 0;
		repeat(20)
		begin
		#5 clk1 = 1; #5 clk1 = 0;
		#5 clk2 = 1; #5 clk2 = 0;
		end
	end
	initial
	for(k=0; k<16; k=k+1)
	uut.regbank[k] = k;
	initial 
	begin
	#5 rs1 = 3; rs2 = 5; rd = 10; func = 0; addr = 125; //add
	#20 rs1 = 3; rs2 = 8; rd = 12; func = 2; addr = 126;
	#20 rs1 = 10; rs2 = 5; rd = 14; func = 1; addr = 127;
	#20 rs1 = 7; rs2 = 3; rd = 13; func = 11; addr = 128;
	#20 rs1 = 10; rs2 = 5; rd = 15; func = 1; addr = 129;
	#20 rs1 = 12; rs2 = 13; rd = 16; func = 0; addr = 130;
	
	#60 for(k=125;k<131; k=k+1)
	$display("mem[%3d] = %3d",k,uut.mem[k]);
	end
	
	initial 
	begin
	
	  $dumpfile("pipelineassign.vcd");
	  $dumpvars (0,pipelineassign_tb);
	  $monitor ("Time: %3d ,F = %3d",$time,z);
	  #300 $finish;
	  end
	  
	
endmodule

