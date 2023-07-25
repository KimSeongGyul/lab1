`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/07/22 20:21:47
// Design Name: 
// Module Name: multiplier
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

module multiplier(
	a,
	b,
	z
);

input wire [7:0] a;
input wire [7:0] b;

output wire [15:0] z;

wire [7:0] layer_s [7:0];
wire [7:0] layer_c [7:0];

// generate the layer

genvar i, j;
generate 
	for(i = 0; i< 8; i = i+1) begin : layer0
		assign layer_s[i][0] = a[i] * b[0];	
	end
endgenerate

generate 
	for(i = 0; i< 8; i = i+1) begin
		if( i == 0) begin 
			assign layer_s[i][1] = (layer_s[1][0])^(a[i] * b[1]);
			assign layer_c[i][1] = (layer_s[1][0])*(a[i] * b[1]);
		end else if(i == 7) begin 
			assign layer_s[i][1] = (layer_c[i-1][1])^(a[i] * b[1]);
			assign layer_c[i][1] = (layer_c[i-1][1])*(a[i] * b[1]);
		end else begin
			assign layer_s[i][1] = (a[i] * b[1])^(layer_c[i-1][1])^(layer_s[i+1][0]);
			assign layer_c[i][1] = (a[i] * b[1])*(layer_c[i-1][1]) | ((a[i] * b[1])^(layer_c[i-1][1]))*(layer_s[i+1][0]);
	   end
	end
endgenerate

generate 
	for(i = 0; i< 8; i = i+1) begin
		if( i == 0) begin 
			assign layer_s[i][2] = (layer_s[1][1])^(a[i] * b[2]);
			assign layer_c[i][2] = (layer_s[1][1])*(a[i] * b[2]);
		end else if(i == 7) begin 
			assign layer_s[i][2] = (a[i] * b[2])^(layer_c[i-1][2])^(layer_c[i][1]);
			assign layer_c[i][2] = (a[i] * b[2])*(layer_c[i-1][2]) | ((a[i] * b[2])^(layer_c[i-1][2]))*(layer_c[i][1]);
		end else begin
			assign layer_s[i][2] = (a[i] * b[2])^(layer_c[i-1][2])^(layer_s[i+1][1]);
			assign layer_c[i][2] = (a[i] * b[2])*(layer_c[i-1][2]) | ((a[i] * b[2])^(layer_c[i-1][2]))*(layer_s[i+1][1]);
	   end
	end
endgenerate

generate 
	for(i = 0; i< 8; i = i+1) begin
		if( i == 0) begin 
			assign layer_s[i][3] = (layer_s[1][2])^(a[i] * b[3]);
			assign layer_c[i][3] = (layer_s[1][2])*(a[i] * b[3]);
		end else if(i == 7) begin 
			assign layer_s[i][3] = (a[i] * b[3])^(layer_c[i-1][3])^(layer_c[i][2]);
			assign layer_c[i][3] = (a[i] * b[3])*(layer_c[i-1][3]) | ((a[i] * b[3])^(layer_c[i-1][3]))*(layer_c[i][2]);
		end else begin
			assign layer_s[i][3] = (a[i] * b[3])^(layer_c[i-1][3])^(layer_s[i+1][2]);
			assign layer_c[i][3] = (a[i] * b[3])*(layer_c[i-1][3]) | ((a[i] * b[3])^(layer_c[i-1][3]))*(layer_s[i+1][2]);
	   end
	end
endgenerate

generate 
	for(i = 0; i< 8; i = i+1) begin
		if( i == 0) begin 
			assign layer_s[i][4] = (layer_s[1][3])^(a[i] * b[4]);
			assign layer_c[i][4] = (layer_s[1][3])*(a[i] * b[4]);
		end else if(i == 7) begin 
			assign layer_s[i][4] = (a[i] * b[4])^(layer_c[i-1][4])^(layer_c[i][3]);
			assign layer_c[i][4] = (a[i] * b[4])*(layer_c[i-1][4]) | ((a[i] * b[4])^(layer_c[i-1][4]))*(layer_c[i][3]);
		end else begin
			assign layer_s[i][4] = (a[i] * b[4])^(layer_c[i-1][4])^(layer_s[i+1][3]);
			assign layer_c[i][4] = (a[i] * b[4])*(layer_c[i-1][4]) | ((a[i] * b[4])^(layer_c[i-1][4]))*(layer_s[i+1][3]);
	   end
	end
endgenerate

generate 
	for(i = 0; i< 8; i = i+1) begin
		if( i == 0) begin 
			assign layer_s[i][5] = (layer_s[1][4])^(a[i] * b[5]);
			assign layer_c[i][5] = (layer_s[1][4])*(a[i] * b[5]);
		end else if(i == 7) begin 
			assign layer_s[i][5] = (a[i] * b[5])^(layer_c[i-1][5])^(layer_c[i][4]);
			assign layer_c[i][5] = (a[i] * b[5])*(layer_c[i-1][5]) | ((a[i] * b[5])^(layer_c[i-1][5]))*(layer_c[i][4]);
		end else begin
			assign layer_s[i][5] = (a[i] * b[5])^(layer_c[i-1][5])^(layer_s[i+1][4]);
			assign layer_c[i][5] = (a[i] * b[5])*(layer_c[i-1][5]) | ((a[i] * b[5])^(layer_c[i-1][5]))*(layer_s[i+1][4]);
	   end
	end
endgenerate

generate 
	for(i = 0; i< 8; i = i+1) begin
		if( i == 0) begin 
			assign layer_s[i][6] = (layer_s[1][5])^(a[i] * b[6]);
			assign layer_c[i][6] = (layer_s[1][5])*(a[i] * b[6]);
		end else if(i == 7) begin 
			assign layer_s[i][6] = (a[i] * b[6])^(layer_c[i-1][6])^(layer_c[i][5]);
			assign layer_c[i][6] = (a[i] * b[6])*(layer_c[i-1][6]) | ((a[i] * b[6])^(layer_c[i-1][6]))*(layer_c[i][5]);
		end else begin
			assign layer_s[i][6] = (a[i] * b[6])^(layer_c[i-1][6])^(layer_s[i+1][5]);
			assign layer_c[i][6] = (a[i] * b[6])*(layer_c[i-1][6]) | ((a[i] * b[6])^(layer_c[i-1][6]))*(layer_s[i+1][5]);
	   end
	end
endgenerate

generate 
	for(i = 0; i< 8; i = i+1) begin
		if( i == 0) begin 
			assign layer_s[i][7] = (layer_s[1][6])^(a[i] * b[7]);
			assign layer_c[i][7] = (layer_s[1][6])*(a[i] * b[7]);
		end else if(i == 7) begin 
			assign layer_s[i][7] = (a[i] * b[7])^(layer_c[i-1][7])^(layer_c[i][6]);
			assign layer_c[i][7] = (a[i] * b[7])*(layer_c[i-1][7]) | ((a[i] * b[7])^(layer_c[i-1][7]))*(layer_c[i][6]);
		end else begin
			assign layer_s[i][7] = (a[i] * b[7])^(layer_c[i-1][7])^(layer_s[i+1][6]);
			assign layer_c[i][7] = (a[i] * b[7])*(layer_c[i-1][7]) | ((a[i] * b[7])^(layer_c[i-1][7]))*(layer_s[i+1][6]);
	   end
	end
endgenerate

generate 
	for(i = 0; i< 16; i = i+1) begin : instantiate_output
		if( i < 8 ) begin 
			assign z[i] = layer_s[0][i];
		end else if(i == 15) begin 
			assign z[i] = layer_c[7][7];
		end else begin
			assign z[i] = layer_s[i-7][7];
	   end
	end
endgenerate

endmodule
