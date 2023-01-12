`timescale 1ns / 1ps
//`timescale 1us / 1ns
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/09/2023 03:00:33 AM
// Design Name: 
// Module Name: TimeParameter
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


 module TimeParameter(
    input [1:0] Time_Parameter_Selector,
    input [3:0] Time_value,
    input Prog_Sync,
    input Reset_Sync,
	input [1:0] interval,
	input clk,
    output reg [3:0] value
    );
	 
	 reg[3:0] tBASE = 4'b0110,
			  tEXT = 4'b0011,
			  tYEL = 4'b0010;
	     
						 
	always@(posedge clk) begin
	
	case (interval)
		
		2'b00: value = tBASE;
		2'b01: value = tEXT;
		2'b10: value = tYEL;
		2'b11: value = 2*tBASE;
	
	endcase
	if (Prog_Sync) begin
		case (Time_Parameter_Selector) 
			2'b00: tBASE = Time_value;
			2'b01: tEXT = Time_value;
			2'b10: tYEL = Time_value;
			2'b11:
			//case 11 not defined
                begin
                    tBASE = 4'b0110;
                    tEXT = 4'b0011;
                    tYEL = 4'b0010;
                end
		endcase
	end
	if (Reset_Sync) begin
        tBASE = 4'b0110;
        tEXT = 4'b0011;
        tYEL = 4'b0010;
    end
		
	end

	
endmodule
