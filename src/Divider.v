`timescale 1ns / 1ps
//`timescale 1us / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2023 03:00:33 AM
// Design Name: 
// Module Name: Divider
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
/*
module Divider(
    input clk,
    input rst,
    output reg oneHz_enable
    );
parameter MAX_COUNT = 50_000 - 1;//50_000_000 -1;
        wire counter_en;
        reg [28:0] counter_100M;
        initial begin oneHz_enable=1;
        end
            
        always @(posedge clk, posedge rst)
            if (rst) counter_100M <=0;
            else if (counter_100M == MAX_COUNT) begin
                counter_100M <=0;
                oneHz_enable = ~oneHz_enable; end
            else counter_100M <= counter_100M + 1'b1;
endmodule
*/

module Divider(
    input clk,
	 input rst,
    output reg oneHz_enable
    );
	 
	 localparam [24:0] period_Hz = 25'd10;
	 reg [24:0]counter = period_Hz;
	 //localparam [26:0] period_Hz = 27'd50_000_000;
	 //reg [26:0]counter = period_Hz;
	 always@(posedge clk)
		begin
			if (rst) counter = period_Hz;
			else begin
				counter = counter - 1;
				oneHz_enable = (counter == 0);
				if (!counter) counter = period_Hz;
			end
		end
endmodule
