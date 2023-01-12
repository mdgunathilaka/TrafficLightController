`timescale 1ns / 1ps
//`timescale 1us / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2023 03:00:33 AM
// Design Name: 
// Module Name: FSM
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


module FSM(
    input Sensor_Sync,
    input WR,
    output reg WR_Reset,
    output reg [6:0] LEDs,
    output reg [1:0] interval,
    output reg start_timer,
    input expired,
    input Prog_Sync,
	input Reset_Sync,
	input clk
    );
	 
	 localparam tBASE = 2'b00,//tBASE
				tEXT = 2'b01,//tEXT
				tYEL = 2'b10,//tYEL
				tBASEx2 = 2'b11;//2*tBASE
					
	 reg deviate;
	 reg senseOneTime;
	 
	 localparam MG = 7'b0011000, //Main green 
				MY = 7'b0101000, //Main yellow 
				SG = 7'b1000010, //Side green 
			    SY = 7'b1000100, //Side yellow 
				WK = 7'b1001001; //walk 
	 
	 always@(posedge clk) begin
		
		start_timer = 0;
		if (Prog_Sync | Reset_Sync) begin
			LEDs = MG;
			interval = tBASEx2;
			WR_Reset = 0;
			start_timer = 1;
			senseOneTime = 1;
		end
		if (expired) 
		  begin
		      case (LEDs)
			     MG: begin
				    if (deviate) begin
					   if (Sensor_Sync & senseOneTime)begin
					       LEDs = MG;
						   interval = tEXT;
						   senseOneTime = 0;
 					   end
					   else begin
					       LEDs = MG;
						   interval = tBASE;
					   end
					   deviate = 0;
					end
					else begin	
					   LEDs = MY;
					   interval = tYEL;
					end
				end
					
				MY:	begin
				    if (WR) begin
					   LEDs = WK;
					       interval = tEXT;
						   WR_Reset = 1;
					end
					else begin
					   LEDs = SG;
					   interval = tBASE;
					end
					senseOneTime = 1;
				end
				
				SG: begin
				    if (Sensor_Sync & senseOneTime) begin
					   LEDs = SG;
					   interval = tEXT;
					   senseOneTime = 0;
					end
					else begin
					   LEDs = SY;
					   interval = tYEL;
					   senseOneTime = 1;
					end
				end
				
				SY: begin
				    LEDs = MG;
					interval = tBASE;
					deviate = 1;
					senseOneTime = 1;
				end
				
				WK: begin
				    LEDs = SG;
					interval = tYEL;
					WR_Reset = 0;
				end
				
				default : begin
				    LEDs = MG;
					interval = tBASE;
					deviate = 1;
					start_timer = 1;
				end
			endcase
			start_timer = 1;
		
		end
	end
	
endmodule
