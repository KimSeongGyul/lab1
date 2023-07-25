`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/07/19 17:36:05
// Design Name: 
// Module Name: tb_decoder
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
module tb_decoder();

reg [3:0] gray;
wire [3:0] bin;

initial begin 
	gray = 4'b0000;
	#5 if(bin != 4'b0000) $display("Error");
	#5 gray = 4'b0001;
	#5 if(bin != 4'b0001) $display("Error");
	#5 gray = 4'b0011;
	#5 if(bin != 4'b0010) $display("Error");
	#5 gray = 4'b0010;
	#5 if(bin != 4'b0011) $display("Error");
	#5 gray = 4'b0110;
	#5 if(bin != 4'b0100) $display("Error");
	#5 gray = 4'b0111;
	#5 if(bin != 4'b0101) $display("Error");
	#5 gray = 4'b0101;
	#5 if(bin != 4'b0110) $display("Error");
	#5 gray = 4'b0100;
	#5 if(bin != 4'b0111) $display("Error");
	#5 gray = 4'b1100;
	#5 if(bin != 4'b1000) $display("Error");
	#5 gray = 4'b1101;
	#5 if(bin != 4'b1001) $display("Error");
	#5 gray = 4'b1111;
	#5 if(bin != 4'b1010) $display("Error");
	#5 gray = 4'b1110;
	#5 if(bin != 4'b1011) $display("Error");
	#5 gray = 4'b1010;
	#5 if(bin != 4'b1100) $display("Error");
	#5 gray = 4'b1011;
	#5 if(bin != 4'b1101) $display("Error");
	#5 gray = 4'b1001;
	#5 if(bin != 4'b1110) $display("Error");
	#5 gray = 4'b1000;
	#5 if(bin != 4'b1111) $display("Error");
	#10 $finish;
end

decoder U1(.gray(gray), .bin(bin));

endmodule 


