`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/07/20 11:28:14
// Design Name: 
// Module Name: encoder_n
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
module encoder_n(
	bin,
	gray
);

input [3:0] bin;

output reg [3:0]gray;

parameter  N = 4;


genvar i;

generate 
	for(i = 0; i< N; i = i+1) begin 
		if(i < N-1) begin 
			always_comb begin 
				if(bin[i+1]) gray[i] = ~bin[i];
				else gray[i] = bin[i];
			end
		end else begin 
			always_comb begin 
				gray[i] = bin[i];
			end
		end 
	end
endgenerate 

endmodule