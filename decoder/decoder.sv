`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/07/19 17:35:37
// Design Name: 
// Module Name: decoder
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


module decoder(
	gray,
	bin
);

input [3:0] gray;

output reg [3:0] bin;

always_comb begin 
	if(gray[1]^gray[2]^gray[3]) bin[0] = ~gray[0];
	else bin[0] = gray[0];
end

always_comb begin 
	if(gray[2]^gray[3]) bin[1] = ~gray[1];
	else bin[1] = gray[1];
end

always_comb begin 
	if(gray[3]) bin[2] = ~gray[2];
	else bin[2] = gray[2];
end

always_comb begin 
	bin[3] = gray[3];
end

endmodule


