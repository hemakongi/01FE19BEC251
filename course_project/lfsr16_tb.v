module lfsr16_tb;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire [15:0] q;

	// Instantiate the Unit Under Test (UUT)
	lfsr16 uut (
		.clk(clk), 
		.reset(reset), 
		.q(q)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		#20;
		
		reset =0;
		#20;

	
        
		// Add stimulus here

	end
	always #10 clk = ~ clk;
      
endmodule



