`timescale 1ns / 1ps
//`timescale 1us / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2023 03:06:02 AM
// Design Name: 
// Module Name: TimeParameter_test
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


module TimeParameter_test;

	// Inputs
	reg [1:0] Time_Parameter_Selector;
	reg [3:0] Time_value;
	reg Prog_Sync;
	reg Reset_Sync;
	reg [1:0] interval;
	reg clk;

	// Outputs
	wire [3:0] value;

	// Instantiate the Unit Under Test (UUT)
	TimeParameter uut (
		.Time_Parameter_Selector(Time_Parameter_Selector), 
		.Time_value(Time_value), 
		.Prog_Sync(Prog_Sync),
		.Reset_Sync(Reset_Sync),
		.interval(interval), 
		.clk(clk), 
		.value(value)
	);
	
	initial begin
        clk = 0;
        forever begin
        #5 clk = ~clk;
        end 
    end

	initial begin
	    Prog_Sync = 0;
	    Reset_Sync = 0;
		Time_Parameter_Selector = 2'b00;
		Time_value = 4'b0000;
		
		interval = 2'b00;
		#50
		interval = 2'b01;
        #50
        Time_Parameter_Selector = 2'b01; // select tYEL
        Time_value = 4'b0100; //set tYEL to 4
        interval = 2'b10;
        #50
        
        Prog_Sync = 1; //change tYEL to 4
		interval = 2'b01;
        #50
        Prog_Sync = 0;
        interval = 2'b00;
        #50;
		

	end
	
      
endmodule
