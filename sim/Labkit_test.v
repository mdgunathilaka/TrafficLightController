`timescale 1ns / 1ps
//`timescale 1us / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2023 03:06:02 AM
// Design Name: 
// Module Name: Labkit_test
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

module Labkit_test;

	reg Reset = 0 ;
	reg Sensor = 0;
	reg Walk_Request = 0;
	reg Reprogram = 0 ;
	reg [1:0] Time_Parameter_Selector = 0;
	reg [3:0] Time_Value = 0;
	reg clk = 0;

	wire [6:0] LEDs;
    //wire oneHz_enable;
	Labkit uut (
		.Reset(Reset), 
		.Sensor(Sensor), 
		.Walk_Request(Walk_Request), 
		.Reprogram(Reprogram), 
		.Time_Parameter_Selector(Time_Parameter_Selector), 
		.Time_Value(Time_Value), 
		.clk(clk),
		//.oneHz_enable(oneHz_enable),
		.LEDs(LEDs)
	);

initial begin
Reset = 0;
		Sensor = 0;
		Walk_Request = 0;
		Reprogram = 0;
		Time_Parameter_Selector = 0;
		Time_Value = 0;
		#20
		#5
		Reset = 1;
		#5
		Reset = 0;

    //Traffic Sensor
    #100
    Sensor = 1;
	#20;
	//Sensor = 0; 

/*
    //Walk Request
    #100
    Walk_Request = 1;
    #20
    Walk_Request = 0;
*/
end
initial begin
    clk = 0;
    forever begin
        #5 clk = ~clk;
        end 
end
      
endmodule
