`timescale 1ns / 1ps
//`timescale 1us / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2023 03:06:02 AM
// Design Name: 
// Module Name: Synchronizer_test
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


module Synchronizer_test;

	// Inputs
	reg Reset;
	reg Sensor;
	reg Walk_Request;
	reg Reprogram;
	reg clk;

	// Outputs
	wire Prog_Sync;
	wire WR_Sync;
	wire Sensor_Sync;
	wire Reset_Sync;

	// Instantiate the Unit Under Test (UUT)
	Synchronizer uut (
		.Reset(Reset), 
		.Sensor(Sensor), 
		.Walk_Request(Walk_Request), 
		.Reprogram(Reprogram), 
		.clk(clk), 
		.Prog_Sync(Prog_Sync), 
		.WR_Sync(WR_Sync), 
		.Sensor_Sync(Sensor_Sync), 
		.Reset_Sync(Reset_Sync)
	);
initial begin
        clk = 0;
        forever begin
         #5 clk = ~clk;
        end 
end

initial begin
		Reset = 0;
		Sensor = 0;
		Walk_Request = 0;
		Reprogram = 0;

		#100;
		Reset = 1;
        Sensor = 0;
        Walk_Request = 0;
        Reprogram = 1;
        
        #100;
        Reset = 0;
        Sensor = 1;
        Walk_Request = 1;
        Reprogram = 0;
        

end
      
endmodule
