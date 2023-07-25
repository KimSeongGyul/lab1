`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/07/21 15:52:34
// Design Name: 
// Module Name: ripple_carry
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
module ripple_carry(
	A,
	B,
	Cout,
	S
);

parameter BIT_WIDTH = 8;

input wire [BIT_WIDTH-1:0] A;
input wire [BIT_WIDTH-1:0] B;

output wire [BIT_WIDTH-1:0] Cout;
output wire [BIT_WIDTH-1:0] S;

// generate the half adder


assign	S[0] = A[0]^B[0];
assign	Cout[0] = A[0]*B[0];


// generate full adder

genvar i;
generate 
	for(i = 1; i< BIT_WIDTH; i = i+1) begin : gen_full_adder
	
	assign  S[i] = A[i]^B[i]^Cout[i-1];
    assign  Cout[i] = (A[i]*B[i]) | (A[i]^B[i])*(Cout[i-1]);
    
	end
endgenerate

endmodule 

