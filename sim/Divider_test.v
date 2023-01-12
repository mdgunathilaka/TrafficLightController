`timescale 1ns / 1ps
//`timescale 1us / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2023 03:06:02 AM
// Design Name: 
// Module Name: Divider_test
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

module Divider_test;

	// Inputs
	reg clk;
	reg rst;
	
	// Outputs
	wire oneHz_enable;

	// Instantiate the Unit Under Test (UUT)
	Divider uut (
		.rst(rst),
		.clk(clk), 
		.oneHz_enable(oneHz_enable)
	);


	initial begin 
	clk=0;
	rst=0;
	#10;
	rst=1;
	#10;
	rst=0;
	end
	
	initial begin
	forever begin
	 #5 clk = ~clk;
	end 
	end
      
endmodule