`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/07/20 11:20:58
// Design Name: 
// Module Name: tb_encoder
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


module tb_encoder_n();

reg [3:0] bin;
wire [3:0] gray;

initial begin 
	bin = 4'b0000;
	#5 if(gray !== 4'b0000) $display("Error");
	#5 bin = 4'b0001;
	#5 if(gray !== 4'b0001) $display("Error");
	#5 bin = 4'b0010;
	#5 if(gray !== 4'b0011) $display("Error");
	#5 bin = 4'b0011;
	#5 if(gray !== 4'b0010) $display("Error");
	#5 bin = 4'b0100;
	#5 if(gray !== 4'b0110) $display("Error");
	#5 bin = 4'b0101;
	#5 if(gray !== 4'b0111) $display("Error");
	#5 bin = 4'b0110;
	#5 if(gray !== 4'b0101) $display("Error");
	#5 bin = 4'b0111;
	#5 if(gray !== 4'b0100) $display("Error");
	#5 bin = 4'b1000;
	#5 if(gray !== 4'b1100) $display("Error");
	#5 bin = 4'b1001;
	#5 if(gray !== 4'b1101) $display("Error");
	#5 bin = 4'b1010;
	#5 if(gray !== 4'b1111) $display("Error");
	#5 bin = 4'b1011;
	#5 if(gray !== 4'b1110) $display("Error");
	#5 bin = 4'b1100;
	#5 if(gray !== 4'b1010) $display("Error");
	#5 bin = 4'b1101;
	#5 if(gray !== 4'b1011) $display("Error");
	#5 bin = 4'b1110;
	#5 if(gray !== 4'b1001) $display("Error");
	#5 bin = 4'b1111;
	#5 if(gray !== 4'b1000) $display("Error");
	#10 $finish;
end

encoder_n U1(.bin(bin), .gray(gray));

endmodule 
