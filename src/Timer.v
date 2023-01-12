`timescale 1ns / 1ps
//`timescale 1us / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2023 03:00:33 AM
// Design Name: 
// Module Name: Timer
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

module Timer(
    input [3:0] value,
    input oneHz_enable,
    input start_timer,
	input clk,
	input Reset_Sync,
    output reg expired
    );
	 
	 reg [3:0] seconds=0;
	 reg started =1; 
	 reg OneHz_checked = 0;
	always @(posedge clk) begin
        if (start_timer) started=1;
        if (started & oneHz_enable) begin
            if (!OneHz_checked)
            begin
                seconds = seconds+1;
                OneHz_checked = 1;
            end
        end if (!oneHz_enable) OneHz_checked=0;
        expired=0;
        if (seconds >= value)
        begin
            expired = 1;
            started = 0;
            seconds = 0;
        end
        
        if (Reset_Sync) begin
            seconds = 0;
            expired = 0;
        end
    end 		
endmodule

/*
module Timer(
    input [3:0] value,
    input oneHz_enable,
    input start_timer,
	 input clk,
	 input Reset_Sync,
    output reg expired
    );
	 
	 
	 reg [3:0] time_left;
	 reg change =1;
	always@(posedge clk) begin
		
		if (!change) begin
			change = 1;
			time_left = value-1;
		end
			
		if (Reset_Sync)begin
			change = 0;
		end			
		if (start_timer) begin
			change =0;
		end
		expired = 0;
		
		if (oneHz_enable) begin
			if (!time_left) begin
				expired = 1;
				end
	
			else begin
			time_left = time_left - 1;
			end
		end			
																		
	end

endmodule
*/
