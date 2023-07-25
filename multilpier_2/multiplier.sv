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

parameter n = 8;

// generate the layer

genvar i, j;
generate 
	for(i = 0; i< n; i = i+1) begin : layer0
		assign layer_s[i][0] = a[i] * b[0];	
	end
endgenerate

generate 
	for(i = 0; i< n; i = i+1) begin
		if( i == 0) begin 
			assign layer_s[i][1] = (layer_s[1][0])^(a[i] * b[1]);
			assign layer_c[i][1] = (layer_s[1][0])*(a[i] * b[1]);
		end else if(i == n-1) begin 
			assign layer_s[i][1] = (layer_c[i-1][1])^(a[i] * b[1]);
			assign layer_c[i][1] = (layer_c[i-1][1])*(a[i] * b[1]);
		end else begin
			assign layer_s[i][1] = (a[i] * b[1])^(layer_c[i-1][1])^(layer_s[i+1][0]);
			assign layer_c[i][1] = (a[i] * b[1])*(layer_c[i-1][1]) | ((a[i] * b[1])^(layer_c[i-1][1]))*(layer_s[i+1][0]);
	   end
	end
endgenerate

generate 
	for(i = 0; i< n; i = i+1) begin
		for(j = 1; j< n-1; j = j+1) begin
			if( i == 0) begin 
				assign layer_s[i][j+1] = (layer_s[1][j])^(a[i] * b[j+1]);
				assign layer_c[i][j+1] = (layer_s[1][j])*(a[i] * b[j+1]);
			end else if(i == n-1) begin 
				assign layer_s[i][j+1] = (a[i] * b[j+1])^(layer_c[i-1][j+1])^(layer_c[i][j]);
				assign layer_c[i][j+1] = (a[i] * b[j+1])*(layer_c[i-1][j+1]) | ((a[i] * b[j+1])^(layer_c[i-1][j+1]))*(layer_c[i][j]);
			end else begin
				assign layer_s[i][j+1] = (a[i] * b[j+1])^(layer_c[i-1][j+1])^(layer_s[i+1][j]);
				assign layer_c[i][j+1] = (a[i] * b[j+1])*(layer_c[i-1][j+1]) | ((a[i] * b[j+1])^(layer_c[i-1][j+1]))*(layer_s[i+1][j]);
	  		end 	
	 	end
	end
endgenerate

generate 
	for(i = 0; i< 2*n; i = i+1) begin : instantiate_output
		if( i < n ) begin 
			assign z[i] = layer_s[0][i];
		end else if(i == 2*n-1) begin 
			assign z[i] = layer_c[n-1][n-1];
		end else begin
			assign z[i] = layer_s[i-n+1][n-1];
	   end
	end
endgenerate

endmodule
