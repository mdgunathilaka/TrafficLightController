`timescale 1ns / 1ps
//`timescale 1us / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2023 03:06:02 AM
// Design Name: 
// Module Name: WalkRegister_test
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


module WalkRegister_test;

	// Inputs
	reg WR_Sync;
	reg WR_Reset;

	// Outputs
	wire WR;

	// Instantiate the Unit Under Test (UUT)
	WalkRegister uut (
		.WR_Sync(WR_Sync), 
		.WR_Reset(WR_Reset),
		.WR(WR)
	);

	initial begin
		WR_Sync = 0;
		WR_Reset = 0;

		#50;
        WR_Sync = 1;
		#5;
		WR_Sync = 0;
		#200;
		WR_Reset = 1;

	end
	
      
endmodule
