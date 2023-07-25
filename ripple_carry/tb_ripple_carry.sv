`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/07/21 15:55:18
// Design Name: 
// Module Name: tb_ripple_carry
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

module tb_ripple_carry();

reg [7:0] A;
reg [7:0] B;

wire [7:0] Cout;
wire [7:0] S;

initial begin 
	#5 
	A = 8'B00000000;
	B = 8'B00000000;
	#1 if((Cout != 8'b00000000) || (S != 8'b00000000)) $display("Error");
	#5 
	A = 8'B00000000;
	B = 8'B00000001;
	#1 if((Cout != 8'b00000000) || (S != 8'b00000001)) $display("Error");
	#5 
	A = 8'B00000000;
	B = 8'B00000010;
	#1 if((Cout != 8'b00000010) || (S != 8'b00000010)) $display("Error");	
	#5 
	A = 8'B00000000;
	B = 8'B00000011;
	#1 if((Cout != 8'b00000000) || (S != 8'b00000011)) $display("Error");		
	#5 
	A = 8'B00000001;
	B = 8'B00000011;
	#1 if((Cout != 8'b00000011) || (S != 8'b00000100)) $display("Error");	
	#5 
	A = 8'B00000010;
	B = 8'B00000011;
	#1 if((Cout != 8'b00000010) || (S != 8'b00000101)) $display("Error");
	#5 
	A = 8'B00000011;
	B = 8'B00000011;
	#1 if((Cout != 8'b00000011) || (S != 8'b00000110)) $display("Error");
	#5 
	A = 8'B00000110;
	B = 8'B00000011;
	#1 if((Cout != 8'b00000110) || (S != 8'b00001001)) $display("Error");
	#5 
	A = 8'B00000111;
	B = 8'B00000011;
	#1 if((Cout != 8'b00000011) || (S != 8'b00001000)) $display("Error");
	#5 
	A = 8'B00000111;
	B = 8'B00000111;
	#1 if((Cout != 8'b00000111) || (S != 8'b00001000)) $display("Error");
end

ripple_carry U1(.A(A), .B(B), .Cout(Cout), .S(S));

endmodule 

