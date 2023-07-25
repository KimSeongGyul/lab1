`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/07/22 20:42:42
// Design Name: 
// Module Name: tb_multiplier
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


module tb_multiplier();

reg [7:0] a;
reg [7:0] b;

wire [15:0]z;

initial begin 
	#5 
	a = 8'b00000000;
	b = 8'b00000001;
	#1 if(z != 1'b0) $display("Error");
	#5 
	a = 8'B00000001;
	b = 8'B00000001;
	#1 if(z !=16'd1) $display("Error");
	#5 
	a = 8'B00000001;
	b = 8'B00000010;
	#1 if(z !=16'd2) $display("Error");
	#5 
	a = 8'B00000001;
	b = 8'B00000011;
	#1 if(z !=16'd3) $display("Error");
	#5 
	a = 8'B00000001;
	b = 8'B00000100;
	#1 if(z !=16'd4) $display("Error");
	#5 
	a = 8'B00000001;
	b = 8'B00000101;
	#1 if(z !=16'd5) $display("Error");
	#5 
	a = 8'B00000001;
	b = 8'B00000110;
	#1 if(z !=16'd6) $display("Error");
	#5 
	a = 8'B00000001;
	b = 8'B00000111;
	#1 if(z !=16'd7) $display("Error");
	#5 
	a = 8'B00000001;
	b = 8'B00001000;
	#1 if(z !=16'd8) $display("Error");
	#5 
	a = 8'B00000001;
	b = 8'B00001001;
	#1 if(z !=16'd9) $display("Error");
end

multiplier U1(.a(a), .b(b), .z(z));

endmodule 