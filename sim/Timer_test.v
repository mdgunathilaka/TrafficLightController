`timescale 1ns / 1ps
//`timescale 1us / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2023 03:06:02 AM
// Design Name: 
// Module Name: Timer_test
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


module Timer_test;

	// Inputs
	reg [3:0] value;
	reg oneHz_enable;
	reg start_timer;
	reg clk;
	reg Reset_Sync;

	// Outputs
	wire expired;

	// Instantiate the Unit Under Test (UUT)
	Timer uut (
		.value(value), 
		.oneHz_enable(oneHz_enable), 
		.start_timer(start_timer),
		.clk(clk),
		.expired(expired),
		.Reset_Sync(Reset_Sync)
	);

	initial begin
	    value = 4'b0110; //tBase
        oneHz_enable = 0;
        start_timer = 1;
        #5 start_timer <= 0;
        Reset_Sync=0;
/*
		oneHz_enable = 0;
		value=4'b0110;
		start_timer=1;
		Reset_Sync = 1;
		#5;
		start_timer=0;
		Reset_Sync = 0;
		#100;
*/
	end
	
		initial begin 
			oneHz_enable=0;
			forever begin
				#100 oneHz_enable = ~oneHz_enable;
					  end 
					end
      initial begin 
			clk=0;
			forever begin
				#5 clk = ~clk;
					  end 
					end
endmodule


